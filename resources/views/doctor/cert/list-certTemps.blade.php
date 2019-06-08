@extends('doctor.layout')
@section('title')
Danh sách chứng thư
@stop
@section('content')

	<div class="app-page-title">
        <h3 class="text-center">Quản lý chứng thư tạm thời</h3>
    </div>
    <div class="container-fluid">
                
        @if(Session::has('flash_message'))
        <div class="alert alert-danger {!! Session::get('flash_level') !!}">
            {!! Session::get('flash_message') !!}
        </div>
        @elseif(Session::has('flash_message_success'))
        <div class="alert alert-success {!! Session::get('flash_level') !!}">
            {!! Session::get('flash_message_success') !!}
        </div>
        @endif
        <table id="example" class="table table-striped table-bordered" style="width:100%">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Certificate</th>
                    <th>Ngày tạo</th>
                    <th>Hiệu lực đến</th>
                    <th>Status</th>
                    <th class="text-center">Download</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($certificates as $key => $certificate)
                    <tr>
                        <td>{{ $key + 1 }}</td>
                        <td>
                            <a data-toggle="modal" data-target="#cert_{{ $certificate->id }}" href="{{ route('register-request.show', $certificate->id) }}">Certificate_temporary_{{ $key + 1 }}</a>
                        </td>
                        <td>{{ date('d-m-Y', strtotime($certificate->created_at)) }}</td>
                        <td>
                            @if (strtotime($certificate->valid_to_time) < time())
                                {!! date('d-m-Y', strtotime($certificate->valid_to_time)) !!}
                                <strong><span class="warning-time">(Hết hiệu lực)</span></strong>
                            @else
                                {!! date('d-m-Y', strtotime($certificate->valid_to_time)) !!}
                            @endif
                        </td>
                        <td>{{ setActive($certificate->status) }}</td>
                        @if ($certificate->status == 0)
                            <td class="text-center"><a href="{{ route('download-cert', $certificate->id) }}"><i class="fas fa-cloud-download-alt"></i> Certificate</a></td>
                        @endif
                    </tr>
                    @include('page.show-cert')
                @endforeach
            </tbody>
        </table>
    </div>
@stop
@section('scripts')
    {{ Html::script('assets/js/dataTables/jquery.dataTables.min.js') }}
    {{ Html::script('assets/js/dataTables/dataTables.responsive.min.js') }}
    {{ Html::script('assets/js/dataTables/dataTables.bootstrap4.min.js') }}
@endsection
