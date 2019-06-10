<?php

namespace App\Http\Controllers;

use App\Http\Requests\RegisterRequest;
use App\Repositories\Crequest\CrequestRepositoryInterface;
use App\Repositories\Certificate\CertificateRepositoryInterface;
use App\User;
use App\Model\Role;
use Auth;
use App\Notifications\SendRegisterCert;


include 'config/init.php';
class AdmincertController extends Controller
{
    protected $certRequest, $cert;

    public function __construct(CrequestRepositoryInterface $certRequest, CertificateRepositoryInterface $cert)
    {
        $this->certRequest = $certRequest;
        $this->cert = $cert;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $with = ['user'];
        $certRequest = $this->certRequest->getData();

        return view('admin.requests.index', compact('certRequest'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // $this->certRequest->markNotify($id);
        $certRequest = $this->certRequest->findById($id);

        if ($certRequest->status != 3) {
            if (isset($certRequest->request_of_user['status'])) {
                $data = [
                    'user_id' => $certRequest->user_id,
                    'status' => 1,
                ];
                // print_r($data);
                $certificate = $this->cert->getDataOnlyTrashed(['user'], $data)->first();
                // print_r($certificate);
                return view('admin.requests.revoke', compact('certRequest', 'certificate'));
            } else {
                $roles = readXml();

                return view('admin.requests.edit', compact('certRequest',  'roles'));
            }
        } else {
            $data = [
                'user_id' => $certRequest->user_id,
                'status' => 0,
            ];
            $certificate = $this->cert->getData(['user'], $data)->first();

            return view('admin.requests.revoke', compact('certRequest', 'certificate'));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function init()
    {
        // $receiver = User::where('id', $request->user_id)->first();
        try {
            if (1 == 1) {
                // gọi cert của bệnh viện
                $cert_bv = $this->cert->getCert(1);

                // $request_of_user = $request->except(['user_id', 'status', '_method']);
                $data = [
                    'user_id' => 1,
                    'request_of_user' => 0,
                    'status' => 0,
                ];
                // $this->certRequest->update(Auth::id(), $data);

                // change openssl.cnf file
                // editConfigFile($request->roles, 1);

                $dn = [
                    'countryName' => Country,
                    'stateOrProvinceName' => Province,
                    'localityName' => Locality,
                    'organizationName' => Organization,
                    'commonName' => Common_name,
                    'emailAddress' => Email,
                ];
                // Generate a new private (and public) key pair
                $privkey = openssl_pkey_new([
                    'private_key_bits' => 1024,
                    'private_key_type' => OPENSSL_KEYTYPE_RSA,
                    'encrypt_key'      => true,
                ]);
                $configArgs = [
                    'digest_alg' => 'sha256',
                    'x509_extensions' => 'usr_cert',
                ];
                // Generate a certificate signing request
                $csr = openssl_csr_new($dn, $privkey);

                // Generate a self-signed cert, valid for 365 days
                $x509 = openssl_csr_sign($csr, null, $privkey, $days = 730, $configArgs, serialNumber()); // tạo cert của bệnh viện
                // $x509 = openssl_csr_sign($csr, $cert_bv['certificate'], $cert_bv['pkcs12']['pkey'], $days = 730, $configArgs, serialNumber());

                // save both private key and cert in a file
                $args = array(
                    'friendly_name' => 'Certificate'
                );
                openssl_pkcs12_export($x509, $certout, $privkey, (Password), $args);
                openssl_pkcs12_read($certout, $pkcs12, (Password));

                // return openssl.cnf file
                // editConfigFile($request->roles, 0);

                $data = [
                    'pkcs12' => $pkcs12,
                    'user_id' => 1,
                    'certificate' => $pkcs12['cert'],
                    'serial_number' => openssl_x509_parse($pkcs12['cert'])['serialNumberHex'],
                    'type' => 0,
                    'valid_from_time' => date('Y-m-d H:m:s', openssl_x509_parse($pkcs12['cert'])['validFrom_time_t']),
                    'valid_to_time' => date('Y-m-d H:m:s', openssl_x509_parse($pkcs12['cert'])['validTo_time_t']),
                    'status' => 0
                ];
                $certificate = $this->cert->create($data);
                openssl_pkcs12_export_to_file($x509, public_path('p12/pkcs12_'.$certificate->id.'.p12'), $privkey, (Password), $args);
                $message = 'Yêu cầu đã được xử lý';
            } 
            // $receiver->notify(new SendRegisterCert(Auth::user(), $message, $id));

            return redirect()->route('admin-request-index')->with(['flash_level' => 'success', 
                'flash_message_success' => 'thành công !!Đã xử lý thành công!']);
        } catch (Exception $e) {
            return redirect()->route('admin-request-index')->with(['flash_level' => 'success', 
                'flash_message' => 'Cảnh báo !!Xử lý thất bại!']);
        }
    }

    public function update(RegisterRequest $request, $id)
    {
        $receiver = User::where('id', $request->user_id)->first();
        try {
            if ($request->status == 1) {
                // gọi cert của bệnh viện
                $cert_bv = $this->cert->getCert(1);
//                print_r($cert_bv);
//                die();

                $request_of_user = $request->except(['user_id', 'status', '_method']);
                $data = [
                    'user_id' => $request->user_id,
                    'request_of_user' => $request_of_user,
                    'status' => $request->status,
                ];
                $this->certRequest->update($id, $data);

                // change openssl.cnf file
                editConfigFile($request->roles, 1);

                $dn = [
                    'countryName' => splitCountry($request->country),
                    'stateOrProvinceName' => $request->province,
                    'localityName' => $request->locality,
                    'organizationName' => $request->organization,
                    'commonName' => $request->common_name,
                    'emailAddress' => $request->email,
                ];
                // Generate a new private (and public) key pair
                $privkey = openssl_pkey_new([
                    'private_key_bits' => 2048,
                    'private_key_type' => OPENSSL_KEYTYPE_RSA,
                    'encrypt_key'      => true,
                ]);
                $configArgs = [
                    'digest_alg' => 'sha256',
                    'x509_extensions' => 'usr_cert',
                ];
                // Generate a certificate signing request
                $csr = openssl_csr_new($dn, $privkey);

                // Generate a self-signed cert, valid for 365 days
                // $x509 = openssl_csr_sign($csr, null, $privkey, $days = 730, $configArgs, serialNumber()); // tạo cert của bệnh viện
                $x509 = openssl_csr_sign($csr, $cert_bv['certificate'], $cert_bv['pkcs12']['pkey'], $days = 730, $configArgs, serialNumber());

                // save both private key and cert in a file
                $args = array(
                    'friendly_name' => 'Certificate'
                );
                openssl_pkcs12_export($x509, $certout, $privkey, decrypt($request->password), $args);
                openssl_pkcs12_read($certout, $pkcs12, decrypt($request->password));

                // return openssl.cnf file
                editConfigFile($request->roles, 0);

                $data = [
                    'pkcs12' => $pkcs12,
                    'user_id' => $request->user_id,
                    'certificate' => $pkcs12['cert'],
                    'serial_number' => openssl_x509_parse($pkcs12['cert'])['serialNumberHex'],
                    'type' => 0,
                    'valid_from_time' => date('Y-m-d H:m:s', openssl_x509_parse($pkcs12['cert'])['validFrom_time_t']),
                    'valid_to_time' => date('Y-m-d H:m:s', openssl_x509_parse($pkcs12['cert'])['validTo_time_t']),
                    'status' => 0
                ];
                $certificate = $this->cert->create($data);
                openssl_pkcs12_export_to_file($x509, public_path('p12/pkcs12_'.$certificate->id.'.p12'), $privkey, decrypt($request->password), $args);
                $message = 'Yêu cầu đã được xử lý';
            } elseif ($request->status == 2) {
                $data = [
                    'status' => $request->status,
                ];
                $this->certRequest->update($id, $data);
                $message = 'Yêu cầu không được chấp nhận';
            } else {
                return redirect()->back()->withError('Trạng thái chưa thay đổi');
            }
            // $receiver->notify(new SendRegisterCert(Auth::user(), $message, $id));

             return redirect()->route('admin-request-index')->with(['flash_level' => 'success', 
                'flash_message_success' => 'thành công !!Đã xử lý thành công!']);
        } catch (Exception $e) {
            return redirect()->route('admin-request-index')->with(['flash_level' => 'success', 
                'flash_message' => 'Cảnh báo !!Xử lý thất bại!']);
        }
    }
}
