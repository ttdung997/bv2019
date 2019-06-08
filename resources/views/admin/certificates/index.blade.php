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
        <a class="btn btn-primary" href="/admin/cert/init">Cấp phát chứng thư bệnh viện</a>
    </div>
<div class="container-fluid"><hr>
                
        @if(Session::has('flash_message'))
        <div class="alert alert-danger {!! Session::get('flash_level') !!}">
            {!! Session::get('flash_message') !!}
        </div>
        @elseif(Session::has('flash_message_success'))
        <div class="alert alert-success {!! Session::get('flash_level') !!}">
            {!! Session::get('flash_message_success') !!}
        </div>
        <hr>
        @endif
        <br>
        <table id="example" class="table table-striped table-bordered" style="width:100%">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>SubjectDN</th>
                    <th>Serial Number</th>
                    <th>Ngày tạo</th>
                    <th>Hiệu lực đến</th>
                    <th>Chủ sở hữu</th>
                    <th>Status</th>
                    <th>Xem</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($certificates as $key => $certificate)
                    @php
                        $subjectDN = '';
                        foreach (openssl_x509_parse($certificate->certificate)['subject'] as $k => $value) {
                            if ($k == 'emailAddress') {
                                $subjectDN .= $k . '=' . $value;
                            } else {
                                $subjectDN .= $k . '=' . $value . ', ';
                            }
                        }
                    @endphp
                    <tr>
                        <td>{{ $key + 1 }}</td>
                        <td>{{ $subjectDN }}</td>
                        <td>{{ serialNumberHex($certificate->serial_number) }}</td>
                        <td>{{ date('d-m-Y', strtotime($certificate->created_at)) }}</td>
                        <td>
                            @if (strtotime($certificate->valid_to_time) < time())
                                {!! date('d-m-Y', strtotime($certificate->valid_to_time)) !!}
                                <strong><p class="warning-time">(Hết hiệu lực)</p></strong>
                            @else
                                {!! date('d-m-Y', strtotime($certificate->valid_to_time)) !!}
                            @endif
                        </td>
                        <td>{{ $certificate->user->name }}</td>
                        <td>{{ setActive($certificate->status) }}</td>
                        <td><a href="{{ route('admin-cert-show', $certificate->id) }}"><i class="glyphicon glyphicon-eye-open"></i>Xem</a></td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
@endsection
@section('scripts')
    <script type="text/javascript">
        $(document).ready(function() {
            $('#example').DataTable({
                responsive: true
            });
        } );
    </script>
    {{ Html::script('assets/js/dataTables/jquery.dataTables.min.js') }}
    {{ Html::script('assets/js/dataTables/dataTables.responsive.min.js') }}
    {{ Html::script('assets/js/dataTables/dataTables.bootstrap4.min.js') }}
@endsection
