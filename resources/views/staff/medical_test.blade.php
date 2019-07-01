@extends('staff.layout.master')

@section('title')
Phiếu đo dung phế
@stop

@section('content')

@if(1)
<div class="form-group pull-right" >
    <button class="btn btn-default " data-toggle="modal" data-target="#myShare">Chia sẻ</button>
</div>
@endif

<div id="myShare" class="modal fade" role="dialog">
    <div class="modal-dialog" style="z-index:10241;width: 800px" >

        <!-- Modal content-->
        @if(1)
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Chia sẻ với</h4>
            </div>
            <div class="modal-body">
                <form role="form" action="{{ route('doctor-share') }}" method="POST">
                    <input type="hidden" name="_token" value="{!! csrf_token() !!}" />
                    @foreach($role_data as $item)
                    @if(in_array($item['id'], $roles))
                    <div class="form-group">
                        <label>
                            <input name="role[]" type="checkbox" value="{{ $item['id'] }}" checked="">{{$item['name']}}
                        </label>
                    </div>   
                    @else
                    <div class="form-group">
                        <label>
                            <input name="role[]" type="checkbox" value="{{ $item['id'] }}">{{$item['name']}}
                        </label>
                    </div>
                    @endif
                    @endforeach
                    <input type="hidden" name="resource_id" value="{!!$medical_id!!}" />

                    <div>
                        <button class="btn btn-default" type="submit">Lưu thay đổi</button>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
        @endif

    </div>
</div>

<div class="col-lg-12  ">
    @if(Session::has('flash_message'))
    <div class="alert alert-danger {!! Session::get('flash_level') !!}">
        {!! Session::get('flash_message') !!}
    </div>
    @elseif(Session::has('flash_message_success'))
    <div class="alert alert-success {!! Session::get('flash_level') !!}">
        {!! Session::get('flash_message_success') !!}
    </div>
    @endif
</div>

<form class="form-horizontal" action="{{ route('update-COPD-test-medical-info') }}" enctype="multipart/form-data" method="post" id="COPDForm">
    <h2 class="col-md-offset-3"> Thông tin bệnh nhân</h2>
    <div class="form-group">
        <label class="col-md-2 control-label" style="font-size: 16px"> Họ tên  :</label>
        <div class="col-md-10">
            <p class="form-control-static" style="font-size: 16px"><?php echo($ten_benh_nhan); ?></p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-2 control-label" style="font-size: 16px"> Ngày sinh  :</label>
        <div class="col-md-10">
            <p class="form-control-static" style="font-size: 16px"><?php echo($ngay_sinh); ?></p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-2 control-label" style="font-size: 16px"> Hộ khẩu thường trú  :</label>
        <div class="col-md-10">
            <p class="form-control-static" style="font-size: 16px"><?php echo($ho_khau); ?></p>
        </div>
    </div>
    <?php
    $roomID = DB::table('staffs')->where('staff_id', Auth::user()->id)->first()->phongban;
    $room = DB::table('user_room')->where('id', $roomID)->first();
    $roomName = $room->name;
    $roomNumber = $room->room_number;
    ?>
    <h2  class="col-md-offset-1">Danh sách các thiết bị ở phòng <?= $roomName . ' (' . $roomNumber . ')' ?></h2>

    <!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalDevice">test</button>-->
    <div id="divice-list">

    </div>

     <h2  class="col-md-offset-2">Cập nhật dữ liệu từ thiết bị di động</h2>
     

    <div class="form-group">
     <div class="col-md-offset-1 col-md-7">
             <button type="button" class="btn btn-primary form-control" onclick="getDataFromMobile()">nhận dữ liệu</button>
    

        </div></div>
     <br>
     <h2>Phiếu xét ngiểm tổng hợp</h2>
     <h3 class="col-md-offset-3">Kết quả Nhiệt độ</h3>
    <div id = "theluc" class="">
        <div class="form-group">
            <label for="input_tem" class="col-md-2 control-label">Nhiệt độ :</label>
            <div class="col-md-6">
                <input type="text" name="FVC" class="form-control" id="input_tem" value="" >
            </div>
        </div>
    </div>
    <h3 class="col-md-offset-3">Kết quả Đo phế dung phổi</h3>
    <div id = "theluc" class="">
        <div class="form-group">
        <input type="hidden" name="id" class="form-control" id="123" value="{{$benhnhan_id}}" >
        <input type="hidden" name="name" class="form-control" id="123" value="{{$ten_benh_nhan}}" >
        <input type="hidden" name="birthday" class="form-control" id="123" value="{{$ngay_sinh}}" >
            <label for="input_fev" class="col-md-2 control-label">FEV :</label>
            <div class="col-md-6">
                <input type="text" name="FVC" class="form-control" id="input_fev" value="" >
            </div>
        </div>
        <div class="form-group">
            <label for="input_pef" class="col-md-2 control-label">PEF :</label>
            <div class="col-md-6">
                <input type="text" name="FEV1" class="form-control" id="input_pef" value="" >
            </div>
        </div>
    </div>
    <h3 class="col-md-offset-3">Kết quả đo nồng độ máu</h3>
    <div id = "theluc" class="">
        <div class="form-group">
            <label for="input_systolic" class="col-md-2 control-label">Systolic BP :</label>
            <div class="col-md-6">
                <input type="text" name="FVC" class="form-control" id="input_systolic" value="" >
            </div>
        </div>
         <div class="form-group">
            <label for="input_diastolic" class="col-md-2 control-label">Diastolic BP :</label>
            
            <div class="col-md-6">
                <input type="text" name="FVC" class="form-control" id="input_diastolic" value="" >
            </div>
        </div>
        <div class="form-group">
            <label for="input_diastolic" class="col-md-2 control-label">Pulse BP :</label>
            
            <div class="col-md-6">
                <input type="text" name="pulse" class="form-control" id="input_pulse" value="" >
            </div>
        </div>
    </div> 
    <h3 class="col-md-offset-3">Kết quả đo nhịp thở</h3>
    <div id = "theluc" class="">
        <div class="form-group">
            <label for="input_air" class="col-md-2 control-label">Air :</label>
            <div class="col-md-6">
                <input type="text" name="FVC" class="form-control" id="input_air" value="" >
            </div>
        </div>
         <div class="form-group">
            <label for="input_ppm" class="col-md-2 control-label">PPM :</label>
            
            <div class="col-md-6">
                <input type="text" name="FVC" class="form-control" id="input_ppm" value="" >
            </div>
        </div>
    </div>
     <h3 class="col-md-offset-3">Kết quả đo nồng độ Oxy trong máu</h3>
    <div id = "theluc" class="">
        <div class="form-group">
            <label for="input_o2" class="col-md-2 control-label">%SpO2 :</label>
            <div class="col-md-6">
                <input type="text" name="FVC" class="form-control" id="input_o2" value="" >
            </div>
        </div>
         <div class="form-group">
            <label for="input_bpm" class="col-md-2 control-label">PRbmp :</label>
            
            <div class="col-md-6">
                <input type="text" name="FVC" class="form-control" id="input_bpm" value="" >
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalDevice" tabindex="-1" role="dialog" aria-labelledby="myTestLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button onclick="check(3)" type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Máy test</h4>
                </div>
                <div class="modal-body">
                    <h1>kết quả</h1>
                    <div class="form-group">
                        <label for="input_FVC"  class="col-md-2 ">Chỉ số 1 :</label>
                        <div class="col-md-6">
                            <span id="chiso1">Đang cập nhật</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_FVC"  class="col-md-2 ">Chỉ số 2 :</label>
                        <div class="col-md-6">
                            <span id="chiso2">Đang cập nhật</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_FVC"  class="col-md-2">Chỉ số 3:</label>
                        <div class="col-md-6">
                            <span id="chiso3">Đang cập nhật</span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" id="testStep">
                    <button onclick="check(1)" type="button" class="btn btn-warning">Kết nối thiết bị</button>
                    <button onclick="check(2)" type="button" class="btn btn-primary disabled">Đo kết quả</button>
                    <button onclick="check(3)" type="button" class="btn btn-success disabled" data-dismiss="modal">Ngắt thiết bị</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Thoát</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>


    <div class="form-group">
        <input type="hidden" name="medicalID" value="<?php echo($medical_id); ?>">
        <input type="hidden" name="_token" value="{{ csrf_token() }}">
        <input type="hidden" id="signatureValue" name="signatureValue">
        <input type="hidden" id="signDatetime" name="signDatetime">
        <input type="hidden" id="certificate" name="certificate">
        <div class="col-md-offset-4">
            <label>Hoàn thiện</label><input type="checkbox" value="1" name="checkSubmit" id="checkSubmit">
            <!--<button type="button" onclick="getApi()" class="btn btn-success btn-lg">Bắt đầu đo kết quả</button>-->
            <button class="btn btn-primary btn-lg" id="signBtn">Ký số phiếu đo</button>
            <button class="btn btn-primary btn-lg" disabled id="saveBtn">Lưu kết quả </button>


        </div>
    </div>

</form>
<script>
    $(document).ready(function(){

        $('#signBtn').on('click', function(e){
            e.preventDefault();

            var originValue = '';
            $('#COPDForm :input:not([type=hidden]):not([readonly])').each(function (index) {
                originValue += $(this).val();
            });
            originValue += {{ Auth::user()->id }};
            var currentdate = new Date();
            var time = currentdate.getHours() + ":"
                + currentdate.getMinutes() + ":"
                + currentdate.getSeconds()
                + ' '
                + currentdate.getDate() + "/"
                + (currentdate.getMonth()+1)  + "/"
                + currentdate.getFullYear();
            originValue += time;
            //console.log(originValue);

            window.postMessage({
                type: "CREATE_SIGNATURE_REQUEST",
                originValue: originValue
            }, "*");

            window.addEventListener("message", function (event) {
                if (event.source != window)
                    return;

                if (event.data.type && (event.data.type == "CREATE_SIGNATURE_RESPONSE")) {
                    if (event.data.success) {
                        if (event.data.signature !== null) {
                            alert("Đã ký phiếu đo!");
                            $('#signatureValue').val(event.data.signature);
                            $('#signDatetime').val(time);
                            $('#certificate').val(event.data.certificate);
                            $('#COPDForm :input:not([type=hidden]):not([readonly])').each(function (index) {
                                $(this).prop("readonly", true);
                            });
                            $('#signBtn').prop("disabled", true);
                            $('#saveBtn').prop("disabled", false);
                        } else {
                            alert("Chứng thư đã chọn không được dùng để ký!");
                        }
                    }
                    else {
                        alert("Ký số phiếu đo không thành công!");
                    }
                }
            })
        });

    });
</script>
<script>
//    function load() {
//        $.ajax({
//            type: 'GET',
//            url: '/staff/medical_test_by_api/<?php echo($medical_id); ?>',
//            data: '_token = <?php echo csrf_token() ?>',
//            success: function (data) {
//                document.getElementById('input_FVC').value = data.FVC[0];
//                document.getElementById('input_FEV1').value = data.FEV1[0];
//                document.getElementById('input_PEF').value = data.PEF[0];
//
//            }
//        });
//    }
    function getAPIConnect() {
        var flag = 0;
        $.ajax({
            type: 'GET',
            url: '/staff/get_API_connect/<?= $roomID ?>',
            async: false,
            data: '_token = <?php echo csrf_token() ?>',
            success: function (data) {
                console.log(data.msg);
                flag = data.flag;
            }
        });
        console.log(flag);
        return flag;
    }

    function getAPIDisconnect(flag) {
        var flag = 0;
        $.ajax({
            type: 'GET',
            url: '/staff/get_API_disconnect/<?= $roomID ?>',
            async: false,
            data: '_token = <?php echo csrf_token() ?>',
            success: function (data) {
                console.log(data.msg);
                flag = data.flag;
            }
        });
        return flag;
    }
    function getAPIResult() {
        $.ajax({
            type: 'GET',
            url: '/staff/get_API_result',
            async: false,
            data: '_token = <?php echo csrf_token() ?>',
            success: function (data) {
                document.getElementById('chiso1').innerHTML = data.FVC;
                document.getElementById('chiso2').innerHTML = data.FEV1;
                document.getElementById('chiso3').innerHTML = data.PEF;
            }
        });
    }
//    function getApi() {
//        load();
////        window.setInterval(function () {
////            load();
////        }, 10000);
//    }
    var DV = document.getElementById('divice-list');
    function addDevide() {
        DV = DV + ' <div class="form-group">'
                + '<label for="input_FVC" class="col-md-2 control-label">Thiết bị:</label>'
                + '<div class="col-md-6">'
                + '<button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#modalDevice">test 2</button>'
                + ' </div>'
                + ' </div>';

    }
    function getAPIdevice() {
        $.ajax({
            type: 'GET',
            url: '/staff/get_API_device/<?= $roomID ?>',
            data: '_token = <?php echo csrf_token() ?>',
            success: function (data) {
                var DV = document.getElementById('divice-list');
                var i;
                for (i = 0; i < data.device.length; i++) {
                    DV.innerHTML = DV.innerHTML + ' <div class="form-group">'
                            + '<label for="input_FVC" class="col-md-2 control-label">Thiết bị:</label>'
                            + '<div class="col-md-6">'
                            + '<button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#modalDevice">' + data.device[i] + '</button>'
                            + ' </div>'
                            + ' </div>';

                }
            }
        });
    }
    getAPIdevice();
    function check(checkValue) {
        var step = document.getElementById('testStep').children;
        if (checkValue == 1) {
            var flag = getAPIConnect();
            if (flag == 1) {
                console.log('step 1')
                step[0].classList.add("disabled");
                step[1].classList.remove("disabled");
                step[2].classList.remove("disabled");
                step[3].classList.add("disabled");
            } else
                alert("Không thể kết nối tới thiết bị");
        } else if (checkValue == 2) {
            getAPIResult();
            console.log('step 2');
        } else if (checkValue == 3) {
            console.log('step 3');
            var flag = getAPIDisconnect();
            if (flag == 1) {
                step[0].classList.remove("disabled");
                step[1].classList.add("disabled");
                step[2].classList.add("disabled");
                step[3].classList.remove("disabled");
                document.getElementById('chiso1').innerHTML = "Đang cập nhật";
                document.getElementById('chiso2').innerHTML = "Đang cập nhật";
                document.getElementById('chiso3').innerHTML = "Đang cập nhật";
            } else
                alert("Ngắt kết nối thất bại");
        }
    }
    function getDataFromMobile(){
         $.ajax({
            type: 'GET',
            url: '/staff/get_API_result',
            async: false,
            data: '_token = <?php echo csrf_token() ?>',
            success: function (data) {
                console.log(data.data);
                if(data.flag > 0){
                    document.getElementById('input_tem').value =data.data[0]['temperature'];
                    document.getElementById('input_diastolic').value =data.data[1]['diastolic'];
                    document.getElementById('input_systolic').value =data.data[1]['systolic'];
                    document.getElementById('input_pulse').value =data.data[1]['pulse'];
                    document.getElementById('input_pef').value =data.data[2]['pef'];
                    document.getElementById('input_fev').value =data.data[2]['fev'];
                    document.getElementById('input_air').value =data.data[3]['air'];
                    document.getElementById('input_ppm').value =data.data[3]['ppm'];
                    document.getElementById('input_bpm').value =data.data[4]['bpm'];
                    document.getElementById('input_o2').value =data.data[4]['o2'];
                }else{
                    alert("không thể lấy dữ liệu từ thiết bị")
                }

            }
        });
    }
</script>
</script>
@stop