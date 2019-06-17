<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\RBACController\UserManagement;
use Giaptt\Oidcda\Authen;
use App\Http\Requests;
use App\Model\MedicalApplication;
use App\Model\MedicalTestApplication;
use App\User;
use App\Model\Certificate;
use Storage;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //return redirect()->route('patient-index');
        if(Auth::user()->position == UserManagement::PATIENT_POSITION){
            return redirect()->route('patient-index');
        }
        if(Auth::user()->position == UserManagement::DOCTOR_POSITION){
            return redirect()->route('doctor-index');
        }        
        if(Auth::user()->position == UserManagement::STAFF_POSITION){
            return redirect()->route('StaffController.index');
        }
//         if(Auth::user()->position ==  UserManagement::ADMIN_POSITION){
//             return redirect()->route('AdminController.index');
//         }
        return view('home');
    }

    public function cacheDataFormMobie(){
         $msg = "oke";
        return response()->json(array('msg' => $msg), 200);
   
    }

    public function checkCertNotBelongToUser($userId, $certId) {
        return Certificate::where('id', $certId)->where('user_id', $userId)->count() == 0;
    }

    public function checkCertificateExpired($certificate) {
        $from = strtotime($certificate->valid_from_time);
        $to = strtotime($certificate->valid_to_time);
        $now = time();
        return ($from > $now || $to < $now);
    }

    public function checkSignature($message, $signature, $certificate) {
        $publicKey = openssl_pkey_get_details(openssl_pkey_get_public($certificate->certificate))['key'];
        return openssl_verify($message, base64_decode($signature), $publicKey);
    }

    public function checkMedicalApplication($id) {
        $medical = MedicalApplication::findOrFail($id);

        if($medical->status != 0)
            return 'Trạng thái của đơn khám chưa hoàn thành!';

        $method = config('encrypt.method');
        $global_key = base64_decode(config('encrypt.key'));
        $iv = base64_decode(config('encrypt.iv'));

        try {
            $contents = Storage::get($medical->url);
        } catch (\Exception $e) {
            return "Không tìm thấy file đơn khám";
        }
        $key = MedicalApplication::where('id', $id)->first()->xml_key;
        $key = openssl_decrypt($key, $method, $global_key, OPENSSL_RAW_DATA, $iv);
        $contents = openssl_decrypt($contents, $method, $key, OPENSSL_RAW_DATA, $iv);
          
        $medical_application_xml = simplexml_load_string($contents);

        $kham_the_luc = $medical_application_xml->kham_the_luc;
        if(!empty($kham_the_luc->chu_ky)) {
            $originValue = $kham_the_luc->chieu_cao . $kham_the_luc->can_nang . $kham_the_luc->huyet_ap . $kham_the_luc->bac_si_ky . $kham_the_luc->thoi_diem_ky;
            
            $certificate = Certificate::findOrFail($kham_the_luc->chung_thu_ky);

            if($this->checkCertNotBelongToUser($kham_the_luc->bac_si_ky, $kham_the_luc->chung_thu_ky))
                return 'Chứng thư số dùng để ký có ID '.$kham_the_luc->chung_thu_ky.' không thuộc về bác sĩ '.User::findOrFail($kham_the_luc->bac_si_ky)->name.'!';

            if($certificate->status != 0)
                return 'Chứng thư số dùng để ký có ID '.$kham_the_luc->chung_thu_ky.' đã bị thu hồi!';

            if($this->checkCertificateExpired($certificate))
                return 'Chứng thư số dùng để ký có ID '.$kham_the_luc->chung_thu_ky.' đã hết hạn!';

            if(! $this->checkSignature($originValue, $kham_the_luc->chu_ky, $certificate))
                return 'Đơn khám đã bị sửa đổi trái phép!';
        }

        $kham_lam_sang_noi_khoa = $medical_application_xml->kham_lam_sang->noi_khoa;
        if(!empty($kham_lam_sang_noi_khoa->chu_ky)) {
            $originValue = $kham_lam_sang_noi_khoa->tuan_hoan . $kham_lam_sang_noi_khoa->phan_loai_tuan_hoan . $kham_lam_sang_noi_khoa->tieu_hoa . $kham_lam_sang_noi_khoa->phan_loai_tieu_hoa . $kham_lam_sang_noi_khoa->ho_hap . $kham_lam_sang_noi_khoa->phan_loai_ho_hap . $kham_lam_sang_noi_khoa->noi_tiet . $kham_lam_sang_noi_khoa->phan_loai_noi_tiet . $kham_lam_sang_noi_khoa->than_tiet_nieu . $kham_lam_sang_noi_khoa->phan_loai_than_tiet_nieu . $kham_lam_sang_noi_khoa->co_xuong_khop . $kham_lam_sang_noi_khoa->phan_loai_co_xuong_khop . $kham_lam_sang_noi_khoa->than_kinh . $kham_lam_sang_noi_khoa->phan_loai_than_kinh . $kham_lam_sang_noi_khoa->tam_than . $kham_lam_sang_noi_khoa->phan_loai_tam_than . $kham_lam_sang_noi_khoa->bac_si_ky . $kham_lam_sang_noi_khoa->thoi_diem_ky;
            $certificate = Certificate::findOrFail($kham_lam_sang_noi_khoa->chung_thu_ky);

            if($this->checkCertNotBelongToUser($kham_lam_sang_noi_khoa->bac_si_ky, $kham_lam_sang_noi_khoa->chung_thu_ky))
                return 'Chứng thư số dùng để ký có ID '.$kham_lam_sang_noi_khoa->chung_thu_ky.' không thuộc về bác sĩ '.User::findOrFail($kham_lam_sang_noi_khoa->bac_si_ky)->name.'!';

            if($certificate->status != 0)
                return 'Chứng thư số dùng để ký có ID '.$kham_lam_sang_noi_khoa->chung_thu_ky.' đã bị thu hồi!';

            if($this->checkCertificateExpired($certificate))
                return 'Chứng thư số dùng để ký có ID '.$kham_lam_sang_noi_khoa->chung_thu_ky.' đã hết hạn!';

            if(! $this->checkSignature($originValue, $kham_lam_sang_noi_khoa->chu_ky, $certificate))
                return 'Đơn khám đã bị sửa đổi trái phép!';
        }

        $kham_lam_sang_mat = $medical_application_xml->kham_lam_sang->mat;
        if(!empty($kham_lam_sang_mat->chu_ky)) {
            $originValue = $kham_lam_sang_mat->thi_luc->mat_trai . $kham_lam_sang_mat->thi_luc->mat_phai . $kham_lam_sang_mat->benh_neu_co . $kham_lam_sang_mat->phan_loai . $kham_lam_sang_mat->bac_si_ky . $kham_lam_sang_mat->thoi_diem_ky;
            $certificate = Certificate::findOrFail($kham_lam_sang_mat->chung_thu_ky);

            if($this->checkCertNotBelongToUser($kham_lam_sang_mat->bac_si_ky, $kham_lam_sang_mat->chung_thu_ky))
                return 'Chứng thư số dùng để ký có ID '.$kham_lam_sang_mat->chung_thu_ky.' không thuộc về bác sĩ '.User::findOrFail($kham_lam_sang_mat->bac_si_ky)->name.'!';

            if($certificate->status != 0)
                return 'Chứng thư số dùng để ký có ID '.$kham_lam_sang_mat->chung_thu_ky.' đã bị thu hồi!';

            if($this->checkCertificateExpired($certificate))
                return 'Chứng thư số dùng để ký có ID '.$kham_lam_sang_mat->chung_thu_ky.' đã hết hạn!';

            if(! $this->checkSignature($originValue, $kham_lam_sang_mat->chu_ky, $certificate))
                return 'Đơn khám đã bị sửa đổi trái phép!';
        }

        $kham_lam_sang_tai_mui_hong = $medical_application_xml->kham_lam_sang->tai_mui_hong;
        if(!empty($kham_lam_sang_tai_mui_hong->chu_ky)) {
            $originValue = $kham_lam_sang_tai_mui_hong->thinh_luc->tai_trai . $kham_lam_sang_tai_mui_hong->thinh_luc->tai_phai . $kham_lam_sang_tai_mui_hong->benh_neu_co . $kham_lam_sang_tai_mui_hong->phan_loai . $kham_lam_sang_tai_mui_hong->bac_si_ky . $kham_lam_sang_tai_mui_hong->thoi_diem_ky;
            $certificate = Certificate::findOrFail($kham_lam_sang_tai_mui_hong->chung_thu_ky);

            if($this->checkCertNotBelongToUser($kham_lam_sang_tai_mui_hong->bac_si_ky, $kham_lam_sang_tai_mui_hong->chung_thu_ky))
                return 'Chứng thư số dùng để ký có ID '.$kham_lam_sang_tai_mui_hong->chung_thu_ky.' không thuộc về bác sĩ '.User::findOrFail($kham_lam_sang_tai_mui_hong->bac_si_ky)->name.'!';

            if($certificate->status != 0)
                return 'Chứng thư số dùng để ký có ID '.$kham_lam_sang_tai_mui_hong->chung_thu_ky.' đã bị thu hồi!';

            if($this->checkCertificateExpired($certificate))
                return 'Chứng thư số dùng để ký có ID '.$kham_lam_sang_tai_mui_hong->chung_thu_ky.' đã hết hạn!';

            if(! $this->checkSignature($originValue, $kham_lam_sang_tai_mui_hong->chu_ky, $certificate))
                return 'Đơn khám đã bị sửa đổi trái phép!';
        }

        $kham_lam_sang_rang_ham_mat = $medical_application_xml->kham_lam_sang->rang_ham_mat;
        if(!empty($kham_lam_sang_rang_ham_mat->chu_ky)) {
            $originValue = $kham_lam_sang_rang_ham_mat->ham_tren . $kham_lam_sang_rang_ham_mat->ham_duoi . $kham_lam_sang_rang_ham_mat->phan_loai . $kham_lam_sang_rang_ham_mat->bac_si_ky . $kham_lam_sang_rang_ham_mat->thoi_diem_ky;
            $certificate = Certificate::findOrFail($kham_lam_sang_rang_ham_mat->chung_thu_ky);

            if($this->checkCertNotBelongToUser($kham_lam_sang_rang_ham_mat->bac_si_ky, $kham_lam_sang_rang_ham_mat->chung_thu_ky))
                return 'Chứng thư số dùng để ký có ID '.$kham_lam_sang_rang_ham_mat->chung_thu_ky.' không thuộc về bác sĩ '.User::findOrFail($kham_lam_sang_rang_ham_mat->bac_si_ky)->name.'!';

            if($certificate->status != 0)
                return 'Chứng thư số dùng để ký có ID '.$kham_lam_sang_rang_ham_mat->chung_thu_ky.' đã bị thu hồi!';

            if($this->checkCertificateExpired($certificate))
                return 'Chứng thư số dùng để ký có ID '.$kham_lam_sang_rang_ham_mat->chung_thu_ky.' đã hết hạn!';

            if(! $this->checkSignature($originValue, $kham_lam_sang_rang_ham_mat->chu_ky, $certificate))
                return 'Đơn khám đã bị sửa đổi trái phép!';
        }

        $kham_lam_sang_da_lieu = $medical_application_xml->kham_lam_sang->da_lieu;
        if(!empty($kham_lam_sang_da_lieu->chu_ky)) {
            $originValue = $kham_lam_sang_da_lieu->phan_loai . $kham_lam_sang_da_lieu->bac_si_ky . $kham_lam_sang_da_lieu->thoi_diem_ky;
            $certificate = Certificate::findOrFail($kham_lam_sang_da_lieu->chung_thu_ky);

            if($this->checkCertNotBelongToUser($kham_lam_sang_da_lieu->bac_si_ky, $kham_lam_sang_da_lieu->chung_thu_ky))
                return 'Chứng thư số dùng để ký có ID '.$kham_lam_sang_da_lieu->chung_thu_ky.' không thuộc về bác sĩ '.User::findOrFail($kham_lam_sang_da_lieu->bac_si_ky)->name.'!';

            if($certificate->status != 0)
                return 'Chứng thư số dùng để ký có ID '.$kham_lam_sang_da_lieu->chung_thu_ky.' đã bị thu hồi!';

            if($this->checkCertificateExpired($certificate))
                return 'Chứng thư số dùng để ký có ID '.$kham_lam_sang_da_lieu->chung_thu_ky.' đã hết hạn!';

            if(! $this->checkSignature($originValue, $kham_lam_sang_da_lieu->chu_ky, $certificate))
                return 'Đơn khám đã bị sửa đổi trái phép!';
        }

        $kham_can_lam_sang = $medical_application_xml->kham_can_lam_sang;
        if(!empty($kham_can_lam_sang->chu_ky)) {
            $originValue = $kham_can_lam_sang->ket_qua . $kham_can_lam_sang->danh_gia . $kham_can_lam_sang->bac_si_ky . $kham_can_lam_sang->thoi_diem_ky;
            $certificate = Certificate::findOrFail($kham_can_lam_sang->chung_thu_ky);

            if($this->checkCertNotBelongToUser($kham_can_lam_sang->bac_si_ky, $kham_can_lam_sang->chung_thu_ky))
                return 'Chứng thư số dùng để ký có ID '.$kham_can_lam_sang->chung_thu_ky.' không thuộc về bác sĩ '.User::findOrFail($kham_can_lam_sang->bac_si_ky)->name.'!';

            if($certificate->status != 0)
                return 'Chứng thư số dùng để ký có ID '.$kham_can_lam_sang->chung_thu_ky.' đã bị thu hồi!';

            if($this->checkCertificateExpired($certificate))
                return 'Chứng thư số dùng để ký có ID '.$kham_can_lam_sang->chung_thu_ky.' đã hết hạn!';

            if(! $this->checkSignature($originValue, $kham_can_lam_sang->chu_ky, $certificate))
                return 'Đơn khám đã bị sửa đổi trái phép!';
        }

        $ket_luan = $medical_application_xml->ket_luan;
        if(!empty($ket_luan->chu_ky)) {
            $originValue = $ket_luan->phan_loai . $ket_luan->benh_neu_co . $ket_luan->bac_si_ky . $ket_luan->thoi_diem_ky;
            $certificate = Certificate::findOrFail($ket_luan->chung_thu_ky);

            if($this->checkCertNotBelongToUser($ket_luan->bac_si_ky, $ket_luan->chung_thu_ky))
                return 'Chứng thư số dùng để ký có ID '.$ket_luan->chung_thu_ky.' không thuộc về bác sĩ '.User::findOrFail($ket_luan->bac_si_ky)->name.'!';

            if($certificate->status != 0)
                return 'Chứng thư số dùng để ký có ID '.$ket_luan->chung_thu_ky.' đã bị thu hồi!';

            if($this->checkCertificateExpired($certificate))
                return 'Chứng thư số dùng để ký có ID '.$ket_luan->chung_thu_ky.' đã hết hạn!';

            if(! $this->checkSignature($originValue, $ket_luan->chu_ky, $certificate))
                return 'Đơn khám đã bị sửa đổi trái phép!';
        }

        return 'Đơn khám hợp lệ!';
    }

    public function checkMedicalTestApplication($id) {
        $medical = MedicalTestApplication::findOrFail($id);

        if($medical->status != 0)
            return 'Trạng thái của xét nghiệm chưa hoàn thành!';
        
        $method = config('encrypt.method');
        $global_key = base64_decode(config('encrypt.key'));
        $iv = base64_decode(config('encrypt.iv'));

        try {
            $contents = Storage::get($medical->url);
        } catch (\Exception $e) {
            return "Không tìm thấy file xét nghiệm";
        }
        $key = MedicalTestApplication::where('id', $id)->first()->xml_key;
        $key = openssl_decrypt($key, $method, $global_key, OPENSSL_RAW_DATA, $iv);
        $contents = openssl_decrypt($contents, $method, $key, OPENSSL_RAW_DATA, $iv);
          
        $medical_application_xml = simplexml_load_string($contents);

        if($medical->xetnghiem != 4) {
            $kham_the_luc = $medical_application_xml->kham_the_luc;
            if(!empty($kham_the_luc->chu_ky)) {
                $originValue = $kham_the_luc->chieu_cao . $kham_the_luc->can_nang . $kham_the_luc->huyet_ap . $kham_the_luc->nhan_vien_ky . $kham_the_luc->thoi_diem_ky;
                $certificate = Certificate::findOrFail($kham_the_luc->chung_thu_ky);

                if($this->checkCertNotBelongToUser($kham_the_luc->nhan_vien_ky, $kham_the_luc->chung_thu_ky))
                    return 'Chứng thư số dùng để ký có ID '.$kham_the_luc->chung_thu_ky.' không thuộc về nhân viên '.User::findOrFail($kham_the_luc->nhan_vien_ky)->name.'!';

                if($certificate->status != 0)
                    return 'Chứng thư số dùng để ký có ID '.$kham_the_luc->chung_thu_ky.' đã bị thu hồi!';

                if($this->checkCertificateExpired($certificate))
                    return 'Chứng thư số dùng để ký có ID '.$kham_the_luc->chung_thu_ky.' đã hết hạn!';

                if(! $this->checkSignature($originValue, $kham_the_luc->chu_ky, $certificate))
                    return 'Phiếu xét nghiệm đã bị sửa đổi trái phép!';
            }
        } else {
            $phe_dung = $medical_application_xml->phe_dung;
            if(!empty($phe_dung->chu_ky)) {
                $originValue = $phe_dung->FVC . $phe_dung->FEV1 . $phe_dung->PEF . $phe_dung->nhan_vien_ky . $phe_dung->thoi_diem_ky;
                $certificate = Certificate::findOrFail($phe_dung->chung_thu_ky);

                if($this->checkCertNotBelongToUser($phe_dung->nhan_vien_ky, $phe_dung->chung_thu_ky))
                    return 'Chứng thư số dùng để ký có ID '.$phe_dung->chung_thu_ky.' không thuộc về nhân viên '.User::findOrFail($phe_dung->nhan_vien_ky)->name.'!';

                if($certificate->status != 0)
                    return 'Chứng thư số dùng để ký có ID '.$phe_dung->chung_thu_ky.' đã bị thu hồi!';

                if($this->checkCertificateExpired($certificate))
                    return 'Chứng thư số dùng để ký có ID '.$phe_dung->chung_thu_ky.' đã hết hạn!';

                if(! $this->checkSignature($originValue, $phe_dung->chu_ky, $certificate))
                    return 'Phiếu xét nghiệm đã bị sửa đổi trái phép!';
            }
        }

        return 'Phiếu xét nghiệm hợp lệ!';
    }
}
