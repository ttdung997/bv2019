<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\RegisterRequest;
use App\Repositories\Crequest\CrequestRepositoryInterface;
use App\Repositories\User\UserRepositoryInterface;
use App\Notifications\SendRegisterCert;
use App\Repositories\Certificate\CertificateRepositoryInterface;
use App\Models\Certificate;
use App\Models\Role;
use Auth;

class RegisterRequestController extends Controller
{
    protected $requestCert, $user, $cert;

    public function __construct(CrequestRepositoryInterface $requestCert, UserRepositoryInterface $user, CertificateRepositoryInterface $cert)
    {
        $this->requestCert = $requestCert;
        $this->user = $user;
        $this->cert = $cert;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Auth::user()->unreadNotifications->markAsRead();
        $with = ['user'];
        $data = [
            'user_id' => Auth::id(),
            'type' => 0,
        ];
        $attribute = ['status', 'asc'];
        $certificates = $this->cert->getData($with, $data, ['*'], $attribute);

        return view('doctor.cert.list-certs', compact('certificates'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
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
    public function store(RegisterRequest $request)
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
             return back()->with(['flash_level' => 'success', 'flash_message_success' => 'thành công !! Bạn đã được cấp chứng thư']);
            // $receivers = $this->user->getAllAdmin();

            // if (isset($receivers)) {
            //     foreach ($receivers as $receiver) {
            //         $receiver->notify(new SendRegisterCert(Auth::user(), $request->message, $request_cert->id));
            //     }
            //     return back()->withSuccess('Gửi yêu cầu thành công!');
            // } else {
            //     return back()->withError('Gửi yêu cầu thất bại!');
            // }
        } else {
            if (isset($certificate)) { 
                return back()->with(['flash_level' => 'success', 'flash_message' => 'Cảnh báo !! Chứng thư đã tồn tại']);
            
            } else { 
                return back()->with(['flash_level' => 'success', 'flash_message' => 'Cảnh báo !! Cấp phát thất bại']);
            
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $certificate = $this->cert->findById($id);

        return view('doctor.cert.show-cert', compact('certificate'));
    }
}
