@extends('admin.layout')
@section('content')
    <div class="page-content">
        <section class="section">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-content-center justify-content-between">
                        <h3 class="font-weight-bold text-xl">Data Pembayaran</h3>
                        <div class="d-flex align-items-center gap-2">
                            <a class="btn btn-warning btn-tambah flex-shrink-0" href="{{ route('pembayaran.jatuhTempo') }}">
                                Jatuh Tempo
                            </a>
                            <div style="min-width: 150px;">
                                <select class="form-control select-1" name="status" id="status">
                                    <option value="">Semua Status</option>
                                    <option value="Lunas">Lunas</option>
                                    <option value="Terhutang">Terhutang</option>
                                </select>
                            </div>

                            <div style="min-width: 200px;">
                                <select class="form-control select-2" name="progres" id="progres">
                                    <option value="">Semua Progres</option>
                                    @foreach ($progreslists as $list)
                                        <option value="{{ $list->id }}">{{ $list->status_progres }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table data-table table-bordered table-striped w-100">
                            <thead>
                                <tr>
                                    <th width="5%">No</th>
                                    <th width="15%">Customer</th>
                                    <th width="40%">Rincian Tagihan</th>
                                    <th width="10%">Status</th>
                                    <th width="18%">Jumlah Tagihan</th>
                                    <th width="10%" class="text-center">Action</th>
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
        $(document).ready(function() {
            $('.select-1').select2({
                dropdownParent: $('body'),
                width: '100%',
                minimumResultsForSearch: Infinity,
            });
            $('.select-2').select2({
                dropdownParent: $('body'),
                width: '100%',
            });

            if ($('body').hasClass('dark')) {
                $('.select2-container').addClass('select2-dark');
            }
        });

        $(function() {
            var permissions = @json($permissions);
            var showActionColumn = (permissions['edit'] == 1 || permissions['hapus'] == 1);

            var table = $('.data-table').DataTable({
                processing: false,
                serverSide: true,
                responsive: true,
                ordering: false,
                ajax: {
                    url: "{{ route('pembayaran.index') }}",
                    data: function(d) {
                        d.status = $('#status').val();
                        d.progres = $('#progres').val();
                    }
                },
                columns: [{
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        orderable: false,
                        searchable: false,
                        className: 'text-center'
                    },
                    {
                        data: 'customer',
                        name: 'customer'
                    },
                    {
                        data: 'rincian_tagihan',
                        name: 'rincian_tagihan',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'status',
                        name: 'status',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'jumlah_tagihan',
                        name: 'jumlah_tagihan',
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

            $('#status, #progres').change(function() {
                table.ajax.reload();
            });
        });
    </script>
@endpush
