@extends('admin.layout')
@section('content')
    <div class="page-content">
        <section class="section">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-content-center justify-content-between">
                        <h3 class="font-weight-bold text-xl">Data Kavling</h3>
                        <div class="d-flex align-items-center">
                            <a href="{{ route('kavling.cetakPdf', 0) }}" target="_blank"
                                class="btn btn-danger btn-rounded btn-sm ms-2" title="Cetak PDF">
                                <i class="bi bi-file-earmark-pdf"></i> Cetak PDF
                            </a>
                            <a href="{{ route('kavling.cetakExcel', 0) }}" target="_blank"
                                class="btn btn-success btn-rounded btn-sm ms-2" title="Cetak Excel">
                                <i class="bi bi-file-earmark-excel"></i> Cetak Excel
                            </a>
                            <a href="javascript:void(0);" onclick="reloadTable()"
                                class="btn btn-light btn-rounded btn-sm ms-2" title="Reload Tabel">
                                <i class="bi bi-arrow-clockwise"></i> Reload
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table data-table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th width="50px">No</th>
                                    <th>Nama Cluster</th>
                                    <th>Lokasi</th>
                                    <th>Panjang</th>
                                    <th>Lebar</th>
                                    <th>Luas</th>
                                    <th>Harga</th>
                                    <th>Keterangan</th>
                                    <th width="150px" class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
@push('scripts')
    <script>
        var permissions = @json($permissions);
        var showActionColumn = (permissions['edit'] == 1);

        $(function() {
            var table = $('.data-table').DataTable({
                processing: false,
                serverSide: true,
                ordering: false,
                responsive: true,
                ajax: "{{ route('kavling.index') }}",
                columns: [{
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        orderable: false,
                        searchable: false,
                        className: 'text-center'
                    },
                    {
                        data: 'nama_cluster',
                        name: 'nama_cluster',
                        orderable: false,
                        searchable: true
                    },
                    {
                        data: 'lokasi',
                        name: 'lokasi'
                    },
                    {
                        data: 'panjang',
                        name: 'panjang',
                        orderable: true,
                        searchable: false
                    },
                    {
                        data: 'lebar',
                        name: 'lebar',
                        orderable: true,
                        searchable: false
                    },
                    {
                        data: 'luas',
                        name: 'luas',
                        orderable: true,
                        searchable: false
                    },
                    {
                        data: 'harga',
                        name: 'harga',
                        orderable: true,
                        searchable: false
                    },
                    {
                        data: 'keterangan',
                        name: 'keterangan',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false,
                        visible: showActionColumn,
                        className: 'text-center'
                    }
                ],
                columnDefs: [{
                    targets: 0,
                    render: function(data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                }]
            });
        });

        function reloadTable() {
            table.ajax.reload(null, false);
        }
    </script>
@endpush
