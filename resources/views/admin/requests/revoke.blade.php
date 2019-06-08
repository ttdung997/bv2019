@extends('admin.layout.master')

@section('title')
Danh sách chữ ký số
@stop

@section('css')
<!-- DataTables -->
<link href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" rel="stylesheet">
<!-- Datatables extensions -->
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.3.2/css/colReorder.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/fixedcolumns/3.2.2/css/fixedColumns.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.2.0/css/select.dataTables.min.css">
<style type="text/css">

</style>
@endsection

@section('content')
    <div class="container emp-profile">
        <div class="row">
            <div class="col-md-9 mt-4">
                <div class="profile-img">
                    <h1 class="text-center">Thông tin chứng thư</h1>
                </div>
            </div>
            <div class="col-md-2 mt-4 pt-1">
                <a class="btn btn-info" href="{{ route('adminCertIndex') }}">Quay lại</a>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-md-10">
            {!! Form::open(['method' => 'POST', 'route' => ['revoke.update', $certRequest->id, $certificate->id]]) !!}
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active mt-3" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Thông tin</a>
                    </li>
                </ul>
                {!! Form::hidden('message', 'Chứng thư đã được thu hồi') !!}
                {!! Form::hidden('user_id', $certRequest->user_id) !!}
                <div class="row">
                    <h5 class="mt-5 ml-4 pl-2">Subject Name</h5>
                </div>
                <div class="row">
                    <div class="col-md-3 mt-3 ml-5">
                        <span><strong>C (Country):</strong></span>
                    </div>
                    <div class="col-md-6 mt-3">
                        <p>{{ openssl_x509_parse($certificate->certificate)['subject']['C'] }}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mt-3 ml-5">
                        <span><strong>ST (State):</strong></span>
                    </div>
                    <div class="col-md-6 mt-3">
                        <p>{{ openssl_x509_parse($certificate->certificate)['subject']['ST'] }}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mt-3 ml-5">
                        <span><strong>L (Locality):</strong></span>
                    </div>
                    <div class="col-md-6 mt-3">
                        <p>{{ openssl_x509_parse($certificate->certificate)['subject']['L'] }}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mt-3 ml-5">
                        <span><strong>O (Organization):</strong></span>
                    </div>
                    <div class="col-md-6 mt-3">
                        <p>{{ openssl_x509_parse($certificate->certificate)['subject']['O'] }}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mt-3 ml-5">
                        <span><strong>CN (Common Name):</strong></span>
                    </div>
                    <div class="col-md-6 mt-3">
                        <p>{{ openssl_x509_parse($certificate->certificate)['subject']['CN'] }}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mt-3 ml-5">
                        <span><strong>EMAIL (Email Address):</strong></span>
                    </div>
                    <div class="col-md-6 mt-3">
                        <p>{{ openssl_x509_parse($certificate->certificate)['subject']['emailAddress'] }}</p>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <h5 class="mt-3 ml-4 pl-2">Issued Certificate</h5>
                </div>
                <div class="row">
                    <div class="col-md-3 mt-3 ml-5">
                        <span><strong>Version:</strong></span>
                    </div>
                    <div class="col-md-6 mt-3">
                        <p>{{ openssl_x509_parse($certificate->certificate)['version'] }}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mt-3 ml-5">
                        <span><strong>Serial Number:</strong></span>
                    </div>
                    <div class="col-md-6 mt-3">
                        <p>{{ serialNumberHex($certificate->serial_number) }}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mt-3 ml-5">
                        <span><strong>Not Valid Before:</strong></span>
                    </div>
                    <div class="col-md-6 mt-3">
                        <p>{{ $certificate->valid_from_time }}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mt-3 ml-5">
                        <span><strong>Not Valid After:</strong></span>
                    </div>
                    <div class="col-md-6 mt-3">
                        <p>{{ $certificate->valid_to_time }}</p>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <h5 class="mt-3 ml-4 pl-2">Lý do muốn thu hồi</h5>
                </div>
                <div class="row">
                    <div class="col-md-3 mt-3 ml-5">
                        <strong><p class="help-block validated">{{ ucfirst($certRequest->request_of_user['reason']) }}</p></strong>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <h5 class="mt-3 ml-4 pl-2">Status</h5>
                </div>
                <div class="custom-control custom-radio custom-control-inline ml-5">
                    @if ($certRequest->status == 3)
                        <span class="mr-5">
                            <input type="radio" id="customRadioInline1" name="status" class="custom-control-input" {{ $certificate->status == 0 ? 'checked' : '' }} value="0">
                            <label class="custom-control-label" for="customRadioInline1">{{ setActive(0) }}</label>

                        </span>
                        <span class="mr-5">
                            <input type="radio" id="customRadioInline2" name="status" class="custom-control-input" {{ $certificate->status == 1 ? 'checked' : '' }} value="1">
                            <label class="custom-control-label" for="customRadioInline2">{{ setActive(1) }}</label>
                        </span>
                    @else
                        {{ setActive($certificate->status) }}
                    @endif
                </div>
                <div class="row">
                    <div class="col-md-10 mt-5 pt-1 ml-5">
                        @if ($certRequest->status == 3)
                            <input type="submit" value="Đồng ý" class="btn btn-info mr-5">
                        @endif
                        <a href="{{ route('admin-request-index') }}" class="btn btn-secondary">
                            Cancel
                        </a>
                    </div>
                </div>
            {!! Form::close() !!}
            </div>
        </div>
    </div>
@endsection
