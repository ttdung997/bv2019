<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
// use App\Repositories\Certificate\CertificateRepositoryInterface;
use App\User;
use Carbon\Carbon;
use App\Http\Requests\RegisterRequest;
use App\Repositories\NumberRequest\NumberRequestRepositoryInterface;
use App\Repositories\User\UserRepositoryInterface;
use App\Notifications\SendRegisterCert;
use App\Repositories\Certificate\CertificateRepositoryInterface;
use App\Model\Certificate;
use App\Model\Role;
use Auth;
use Response;
use File;
use Session;

class CertificateController extends Controller
{
    protected $certificate;

    public function __construct(CertificateRepositoryInterface $certificate)
    {
        $this->certificate = $certificate;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $certificates = $this->certificate->getData();

        return view('admin.certificates.index', compact('certificates'));
    }
    public function check()
    {
        return view('doctor.cert.check');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function adminShowCert($id)
    {
        $certificate = Certificate::withTrashed()->where('id', $id)->first();

        return view('admin.certificates.show', compact('certificate'));
    }

    /**
     * Update status of certificate when expired
     */
    public function status()
    {
        $certificates = $this->certificate->getData(['user'], ['status' => 0]);

        foreach ($certificates as $cert) {
            if (strtotime($cert->valid_to_time) < strtotime(Carbon::now())) {
                $this->certificate->update($cert->id, ['status' => 1]);
                $cert->delete();
            }
        }

        return back()->withSuccess('Cập nhật thành công!');
    }
     public function download(Certificate $certificate)
    {
        $with = ['user'];
        $data = [
            'id' => $certificate->id,
            'user_id' => Auth::id(),
            'deleted_at' => Null,
        ];
        $certificate = $this->certificate->getData($with, $data)->first();

        if (\Route::current()->getName() == 'download-cert') {
            $headers = [
                'Content-Type : application/pem',
            ];
            if ($certificate->type == 0) {
                openssl_x509_export_to_file($certificate->pkcs12['cert'], public_path('p12/cert'.$certificate->id.'.pem'));
                $file = public_path().'/p12/cert'.$certificate->id.'.pem';
                return Response::download($file, 'cert.pem', $headers);
            } else {
                openssl_x509_export_to_file($certificate->certificate, public_path('p12/cert_temp_'.$certificate->id.'.pem'));
                $file = public_path().'/p12/cert_temp_'.$certificate->id.'.pem';
                return Response::download($file, 'cert_temp.pem', $headers);
            }
        } else {
            $file = public_path().'/p12/pkcs12_'.$certificate->id.'.p12';
            $headers = [
                'Content-Type : application/p12',
            ];

            return Response::download($file, 'pkcs12.p12', $headers);
        }
    }

    public function checkCert(Request $request)
    {
        $file = \File::get($request->file('file'));
        $certificates = $this->certificate->getData();
        foreach ($certificates as $key => $certificate) {
            if ($file == $certificate->certificate) {
                $check = 1;
                break;
            } else {
                $check = 0;
            }
        }
        // print($check);
        // die();
        if ($check == 1) {
            return back()->with(['flash_level' => 'success', 'flash_message_success' => 'thành công !! Chứng thư hợp lệ']);
        } else {
            return back()->with(['flash_level' => 'success', 'flash_message' => 'Cảnh báo!! Chứng thư không hợp lệ']);
        }
    }

    public function notifications()
    {
        $user = Auth::user();

        return view('layouts.notifications', compact('user'));
    }

    public function markAsAll()
    {
        Auth::user()->unreadNotifications->markAsRead();
        return back();
    }
     public function store(Request $request)
    {
        $certificate = $this->cert->getCert($request->user_id);

        if ($certificate) {
            $request_of_user = $request->except('user_id');
            $request_of_user['message'] = 'Yêu cầu cấp chứng thư tạm thời';
            $request_of_user['type'] = 1;
            $request_of_user['role'] = ["1.2.3.4.5.6.2"];
            $data = [
                'user_id' => $request->user_id,
                'request_of_user' => $request_of_user,
                'status' => 0,
            ];
            $request_cert = $this->requestCert->create($data);

            $receivers = $this->user->getAllAdmin();
            $user = User::where('id', $request->user_id)->first();
            if (isset($receivers)) {
                foreach ($receivers as $receiver) {
                    $receiver->notify(new SendRegisterCert($user, $request_of_user['message'], $request_cert->id));
                }
                return response()->json('success', 200);
            } else {
                return response()->json('fail', 400);
            }
        } else {
            return response()->json('Bạn chưa có chứng thư hoặc đã bị thu hồi', 400);
        }
    }
    public function registerStore(RegisterRequest $request)
    {
        $certificate = $this->cert->getCert($request->user_id);

        $checkout_request = $this->requestCert->getData(['user'],
            ['user'],
            ['user_id' => $request->user_id, 'status' => 0]
        )->first();

        if (!isset($certificate) && !isset($checkout_request)) {
            $request_of_user = $request->except('user_id');
            $request_of_user['message'] = 'Yêu cầu cấp chứng thư';
            $request_of_user['password'] = encrypt($request->password);
            $request_of_user['type'] = 0;
            $data = [
                'user_id' => $request->user_id,
                'request_of_user' => $request_of_user,
                'status' => 0,
            ];
            $request_cert = $this->requestCert->create($data);

            $receivers = $this->user->getAllAdmin();
            $user = User::where('id', $request->user_id)->first();
            if (isset($receivers)) {
                foreach ($receivers as $receiver) {
                    $receiver->notify(new SendRegisterCert($user, $request_of_user['message'], $request_cert->id));
                }
                return response()->json('success', 200);
            } else {
                return response()->json('fail', 400);
            }
        } else {
            if (isset($certificate)) {
                return response()->json('Bạn đã được cấp chứng thư', 400);
            } else {
                return response()->json('Bạn đã gửi yêu cầu rồi', 400);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function showAsJson($id)
    {
        $certificate = Certificate::find($id);

        if (isset($certificate)) {
            return $certificate;
        } else {
            return response()->json('Not found', 404);
        }
    }
     public function createCert()
    {
        $roles = readXml();

        return view('doctor.cert.register-cert', compact('roles'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeCert(RegisterRequest $request)
    {
        $certificate = $this->cert->getCert($request->user_id);

        $checkout_request = $this->requestCert->getData(
            ['user'],
            ['user_id' => $request->user_id, 'status' => 0]
        )->first();

        if (!isset($certificate) && !isset($checkout_request)) {
            $request_of_user = $request->except(['user_id', 'status']);
            $request_of_user['password'] = encrypt($request->password);
            $data = [
                'user_id' => $request->user_id,
                'request_of_user' => $request_of_user,
                'status' => 0,
            ];
            $request_cert = $this->requestCert->create($data);
            $receivers = $this->user->getAllAdmin();

            if (isset($receivers)) {
                foreach ($receivers as $receiver) {
                    $receiver->notify(new SendRegisterCert(Auth::user(), $request->message, $request_cert->id));
                }
                return back()->withSuccess('Gửi yêu cầu thành công!');
            } else {
                return back()->withError('Gửi yêu cầu thất bại!');
            }
        } else {
            if (isset($certificate)) {
                return back()->withWarning('Bạn đã được cấp chứng thư');
            } else {
                return back()->withWarning('Bạn đã gửi yêu cầu rồi');
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function showCert($id)
    {
        $certificate = $this->cert->findById($id);

        return view('doctor.cert.show-cert', compact('certificate'));
    }

    //xac nhan chung thu
}
