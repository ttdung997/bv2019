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
                    <th>Người yêu cầu</th>
                    <th>Yêu cầu</th>
                    <th>Ngày yêu cầu</th>
                    <th>Ngày xử lý</th>
                    <th>Trạng thái</th>
                    <th>Xem chi tiết</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($certRequest as $key => $certRequest)
                    <tr>
                        <td>{{ $key + 1 }}</td>
                        <td>{{ $certRequest->user->name }}</td>
                        <td>{{ $certRequest['request_of_user']['message'] }}</td>
                        <td>{{ date('d-m-Y', strtotime($certRequest->created_at)) }}</td>
                        <td>{{ ($certRequest->status != 0 && $certRequest->status != 3) ? date('d-m-Y', strtotime($certRequest->updated_at)) : 'NULL' }}</td>
                        <td>{{ setStatus($certRequest->status) }}</td>
                        <td>
                            @if (isset($certRequest->request_of_user['type']) && $certRequest->request_of_user['type'] == 1)
                                <a href="{{ route('admin-intro-request-edit', $certRequest->id) }}"><span class="glyphicon glyphicon-eye-open mr-3"></span>Xem</a>
                            @else
                                <a href="{{ route('admin-request-edit', $certRequest->id) }}"><span class="glyphicon glyphicon-eye-open mr-3"></span>Xem</a>
                            @endif
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
@endsection

@section('scripts')
    {{ Html::script('assets/js/dataTables/jquery.dataTables.min.js') }}
    {{ Html::script('assets/js/dataTables/dataTables.responsive.min.js') }}
    {{ Html::script('assets/js/dataTables/dataTables.bootstrap4.min.js') }}
    <script type="text/javascript">
        $(document).ready(function() {
            $('#example').DataTable({
                responsive: true
            });
        } );
    </script>
@endsection
