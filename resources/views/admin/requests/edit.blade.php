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
                    <h1 class="text-center">Thông tin yêu cầu</h1>
                </div>
            </div>
            <div class="col-md-3 mt-4">
                <a class="btn btn-info" href="{{ route('admin-request-index') }}">Trang chủ</a>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-md-10">
            {!! Form::model($certRequest, ['method' => 'PUT', 'route' => ['admin-request-update', $certRequest->id]]) !!}
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active mt-3" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Thông tin</a>
                    </li>
                </ul>
                {!! Form::hidden('user_id', $certRequest->user_id) !!}
                {!! Form::hidden('message', $certRequest->request_of_user['message']) !!}
                {!! Form::hidden('type', $certRequest->request_of_user['type']) !!}
                <div class="row">
                    <div class="col-md-2 mt-5 pt-1 ml-5">
                        <span><strong>Tên người dùng</strong></span>
                    </div>
                    <div class="col-md-6 mt-5">
                        <input type="text" class="form-control" name="username" value="{{ $certRequest->request_of_user['username'] }}" disabled>
                    </div>
                    {!! Form::hidden('username', $certRequest->request_of_user['username']) !!}
                </div>
                {!! Form::hidden('password', $certRequest->request_of_user['password']) !!}
                <div class="row">
                    <div class="col-md-2 mt-5 pt-1 ml-5">
                        <span><strong>Email</strong></span>
                    </div>
                    <div class="col-md-6 mt-5">
                        <input type="email" class="form-control" name="email" value="{{ $certRequest->request_of_user['email'] }}" disabled>
                        {!! Form::hidden('email', $certRequest->request_of_user['email']) !!}
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 mt-5 pt-1 ml-5">
                        <span><strong>Tên gọi chung</strong></span>
                    </div>
                    <div class="col-md-6 mt-5">
                        @if ($certRequest->status == 0)
                            @if (empty($certificate))
                                <input type="text" class="form-control" name="common_name" value="{{ $certRequest->request_of_user['common_name'] }}" required>
                            @else
                                <input type="text" class="form-control" name="common_name" value="{{ $certRequest->request_of_user['common_name'] }}">
                            @endif
                        @else
                            <input type="text" class="form-control" name="common_name" value="{{ $certRequest->request_of_user['common_name'] }}" disabled>
                        @endif
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 mt-5 pt-1 ml-5">
                        <span><strong>Cơ quan</strong></span>
                    </div>
                    <div class="col-md-6 mt-5">
                        @if ($certRequest->status == 0)
                            <input type="text" class="form-control" name="organization" value="{{ $certRequest->request_of_user['organization'] }}" required>
                        @else
                            <input type="text" class="form-control" name="organization" value="{{ $certRequest->request_of_user['organization'] }}" disabled>
                        @endif
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 mt-5 pt-1 ml-5">
                        <span><strong>Quốc gia</strong></span>
                    </div>
                    <div class="col-md-6 mt-5">
                        @if ($certRequest->status == 0)
                            <input type="text" class="form-control" name="country" value="{{ $certRequest->request_of_user['country'] }}" required>
                        @else
                            <input type="text" class="form-control" name="country" value="{{ $certRequest->request_of_user['country'] }}" disabled>
                        @endif
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 mt-5 pt-1 ml-5">
                        <span><strong>Quận/Huyện</strong></span>
                    </div>
                    <div class="col-md-6 mt-5">
                        @if ($certRequest->status == 0)
                            <input type="text" class="form-control" name="locality" value="{{ $certRequest->request_of_user['locality'] }}" required>
                        @else
                            <input type="text" class="form-control" name="locality" value="{{ $certRequest->request_of_user['locality'] }}" disabled>
                        @endif
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 mt-5 pt-1 ml-5">
                        <span><strong>Tỉnh/TP</strong></span>
                    </div>
                    <div class="col-md-6 mt-5">
                        @if ($certRequest->status == 0)
                            <input type="text" class="form-control" name="province" value="{{ !empty($certRequest->request_of_user['province']) ? $certRequest->request_of_user['province'] : '' }}" required>
                        @else
                            <input type="text" class="form-control" name="province" value="{{ !empty($certRequest->request_of_user['province']) ? $certRequest->request_of_user['province'] : '' }}" disabled>
                        @endif
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 mt-5 pt-1 ml-5">
                        <span><strong>Vai trò</strong></span>
                    </div>
                    <div class="col-md-6 mt-5 pt-1">
                        @if ($certRequest->status == 0)
                            <select name="roles[]" class="browser-default custom-select select2-multi" multiple="multiple">
                                @foreach ($roles->role as $role)
                                    @if (in_array($role->oid, $certRequest->request_of_user['roles']))
                                        <option value="{{ $role->oid }}" selected>{{ $role->name }}</option>
                                    @else
                                    <option value="{{ $role->oid }}">{{ $role->name }}</option>
                                    @endif
                                @endforeach
                            </select>
                        @else
                            @foreach ($roles->role as $role)
                                @if (in_array($role->oid, $certRequest->request_of_user['roles']))
                                    <span class="badge badge-primary">{{ $role->name }}</span>
                                @endif
                            @endforeach
                        @endif
                    </div>
                </div>
                @if ($certRequest->status == 0)
                    <div class="row">
                        <div class="col-md-2 mt-5 pt-1 ml-5">
                            <span><strong>Trạng thái</strong></span>
                        </div>
                        <div class="col-md-6 mt-5">
                            <div class="custom-control custom-radio custom-control-inline">
                                <span class="mr-5">
                                    <input type="radio" id="customRadioInline1" name="status" class="custom-control-input" {{ $certRequest->status == 0 ? 'checked' : '' }} value="0">
                                    <label class="custom-control-label" for="customRadioInline1">Đang chờ</label>

                                </span>
                                <span class="mr-5">
                                    <input type="radio" id="customRadioInline2" name="status" class="custom-control-input" {{ $certRequest->status == 1 ? 'checked' : '' }} value="1">
                                    <label class="custom-control-label" for="customRadioInline2">Đã xử lý</label>
                                </span>
                                <span class="mr-5">
                                    <input type="radio" id="customRadioInline3" name="status" class="custom-control-input" {{ $certRequest->status == 2 ? 'checked' : '' }} value="2">
                                    <label class="custom-control-label" for="customRadioInline3">Hủy yêu cầu</label>
                                </span>
                            </div>
                        </div>
                    </div>
                @endif
                <div class="row">
                    <div class="col-md-10 mt-5 pt-1 ml-5">
                        @if ($certRequest->status == 0)
                            <input type="submit" value="Chấp nhận" class="btn btn-success mr-5">
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
@section('scripts')
    {!! Html::script('assets/js/select2.min.js') !!}
    <script type="text/javascript">
        $('.select2-multi').select2();
    </script>
@endsection
