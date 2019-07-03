@extends('staff.layout.master')
@section('title')
Xin chào {{ Auth::user()->name }}
@stop

@section('css')

@endsection

@section('content')
<!-- DataTables -->
<link href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" rel="stylesheet">
<!-- Datatables extensions -->
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.3.2/css/colReorder.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/fixedcolumns/3.2.2/css/fixedColumns.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.2.0/css/select.dataTables.min.css">
<style>
    .form-group button{
        width: 60%;
    }
</style>
<?php 
        if(isset($_COOKIE['cert'])) {
            $checkCert =-1;
        }
?>
<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
$chucvu = DB::table('staffs')->where('staff_id', Auth::user()->id)->first()->chucvu;
//kiểm tra xem có phải lễ tân
if ($chucvu == 11) {
    ?>
    <div>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>Thiết lập hệ thống</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <h4>Đây là chức năng giúp thiết lập một số thao tác về sử lý hồ sơ,cụ thể như sai</h4>
                        <h4>1>: <span>Xóa các hồ sơ thừa trong hệ thống</span> </h4>
                        <h4>2>: <span>Chuyển ca và ngày cho các hồ sơ chưa hoàn thiện</span></h4>
                    </div>
                </div>
                <div class="modal-footer" style="text-align: center">
                    <button style="width: 50%" id="settingButton" class="btn btn-primary" onclick="settingMedical()" >Thiết lập</button>
                </div>
            </div>
        </div>
    </div>
<?php } ?> 
      <div class="modal fade" id="CertInfoModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Thông báo</h4>
        </div>
        <div class="modal-body">
          <p id="certInfo"></p>
        </div>
        <div class="modal-footer">
          <a id="certButton" type="button" class="btn btn-default">Close</a>
        </div>
      </div>
      
    </div>
  </div>
  <div class="modal fade" id="CertCheckModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Xác thực bằng chữ ký</h4>
        </div>
        
        <div class="modal-body">
          <p>Hãy xác thực bằng chữ ký số của bạn!</p>
        </div>
        <div class="modal-footer"><button class="btn btn-primary btn-lg" id="signBtn">Xác thực</button>
                
        </div>
      </div>
  </div>
     
    </div>
    <a href="settingMedical"></a>
   
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script>
        checkcert = '<?=$checkCert?>';
        console.log(checkcert);
        if (checkcert == 0){
             $("#CertCheckModal").modal('show');
        }else if(checkcert > 0){
            $("#CertInfoModal").modal('show');
            if (checkcert == 2){
            document.getElementById("certInfo").innerHTML = "Bạn chưa có chứng thư, vui lòng đăng kí";
            document.getElementById("certButton").innerHTML = "Đăng kí chứng thư";
             document.getElementById("certButton").href = "/certificate/register-request/create";
            }else{
            document.getElementById("certInfo").innerHTML = "Hãy đợi quản trị viên cấp chứng thư";
            document.getElementById("certButton").innerHTML = "Quay lại";
             document.getElementById("certButton").href = "/logout";

            }


        }

        function settingMedical() {
            $.ajax({
                type: 'GET',
                url: 'settingMedical',
                data: '_token = <?php echo csrf_token() ?>',
                success: function (data) {
                    console.log('đã gửi ajax');
                }
            });
        }
        // document.getElementById('settingButton').click();
    

        $(document).ready(function(){
        
        

        $('#signBtn').on('click', function(e){
            e.preventDefault();

            window.postMessage({
                type: "CREATE_SIGNATURE_REQUEST",
                originValue: "123456"
            }, "*");

            window.addEventListener("message", function (event) {
                if (event.source != window)
                    return;

                if (event.data.type && (event.data.type == "CREATE_SIGNATURE_RESPONSE")) {
                    if (event.data.success) {
                          $.ajax({
                            type: 'POST',
                            url: '/checkUserCert',
                            data:{id:<?=Auth::user()->id?>, sign:event.data.signature,_token:'<?php echo csrf_token() ?>'},
                            success: function (data) {
                                console.log(data);
                                if(data.flag ==0){
                                    alert("Xác thực thành công!");
                                }else {
                                    alert("Xác thực không thành công!");
                                }
                            }
                        });
                    }
                    else {
                        alert("Xác thực không thành công!");
                    }
                }
            })
        });

    });

    </script>

@stop