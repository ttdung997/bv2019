@extends('doctor.cert.layout')
@section('title')
   Kiểm tra chứng thư 
@stop
@section('content')

    <div class="container-fluid">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Upload chứng thư muốn kiểm tra</h5>
        </div>
        {!! Form::open(['method' => 'POST', 'route' => 'check-cert', 'files' => 'true']) !!}
            <div class="modal-body">
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile" name="file">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
                
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
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <input type="submit" class="btn btn-primary" value="Kiểm tra"/>
            </div>
        {!! Form::close() !!}
        </div>
    </div>
</div>

@stop
@section('scripts')
    {{ Html::script('assets/js/dataTables/jquery.dataTables.min.js') }}
    {{ Html::script('assets/js/dataTables/dataTables.responsive.min.js') }}
    {{ Html::script('assets/js/dataTables/dataTables.bootstrap4.min.js') }}
@endsection
