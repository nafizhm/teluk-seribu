@extends('admin.layout')
@section('content')
    <div class="page-content">
        <section class="section">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-content-center justify-content-between">
                        <h3 class="font-weight-bold text-xl">Data Kavling Ready</h3>
                        <div class="d-flex align-items-center">
                            <a href="{{ route('dashboard') }}" class="btn btn-secondary align-items-center d-flex btn-sm"><i
                                    class="fas fa-arrow-left mr-2"></i>
                                Kembali</a>
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
                                    <th width="5%">No</th>
                                    <th>Perumahan</th>
                                    <th>Kode Kavling</th>
                                    <th>Panjang</th>
                                    <th>Lebar</th>
                                    <th>Luas</th>
                                    <th>Harga Jual</th>
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
        $(function() {
            let table = $('.data-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ route('total.unit') }}",
                columns: [{
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        orderable: false,
                        searchable: false,
                        className: 'text-center'
                    },
                    {
                        data: 'lokasi',
                        name: 'lokasi'
                    },
                    {
                        data: 'panjang',
                        name: 'panjang'
                    },
                    {
                        data: 'lebar',
                        name: 'lebar'
                    },
                    {
                        data: 'luas',
                        name: 'luas'
                    },
                    {
                        data: 'harga_jual',
                        name: 'harga_jual'
                    }
                ]
            });
        });

        function reloadTable() {
            table.ajax.reload(null, false);
        }
    </script>
@endpush
