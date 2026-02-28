@extends('admin.layout')
@section('content')
    <div class="page-content">
        <section class="section">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-content-center justify-content-between">
                        <h3 class="font-weight-bold text-xl">Data Customer</h3>
                        <div class="d-flex align-items-center">
                            @if (isset($permissions['tambah']) && $permissions['tambah'] == 1)
                                <a href="{{ route('customer.create') }}" class="btn btn-primary btn-sm">
                                    <i class="bi bi-plus-lg"></i> Tambah Customer
                                </a>
                            @endif
                            <button class="btn btn-info btn-sm mx-2" data-bs-toggle="modal" data-bs-target="#modalPrint">
                                <i class="bi bi-printer"></i> Cetak Data
                            </button>
                            <a href="javascript:void(0);" onclick="reloadTable()" class="btn btn-light btn-rounded btn-sm"
                                title="Reload Tabel">
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
                                    <th>Tanggal</th>
                                    <th>Nama Nasabah</th>
                                    <th>Marketing</th>
                                    <th>Perumahan</th>
                                    <th>Status Progres</th>
                                    <th class="text-center" width="15%">Action</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <div class="modal fade" id="modalPrint" tabindex="-1" aria-labelledby="modalPrintLabel" aria-hidden="true"
        data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title text-white" id="modalPrintLabel">Form Cetak Transaksi</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <form id="formPrint" action="{{ route('customer.cetak') }}" method="GET" target="_blank">
                    @csrf
                    <div class="modal-body">
                        <input type="hidden" id="primary_id" name="primary_id">

                        <div class="container-fluid">
                            <div class="row mb-3">
                                <label for="lokasi" class="col-sm-3 col-form-label">Lokasi</label>
                                <div class="col-sm-6">
                                    <select name="lokasi" class="form-control select-lokasi" id="lokasi">
                                        <option value=""></option>
                                        @foreach ($lokasi as $l)
                                            <option value="{{ $l->id }}">{{ $l->nama_kavling }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">
                            <span class="button-text">Batal</span>
                        </button>
                        <button type="submit" class="btn btn-primary ms-1" id="submitBtn">
                            <span class="spinner-border spinner-border-sm me-2 d-none" role="status"
                                aria-hidden="true"></span>
                            <span class="button-text">Simpan</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
@push('scripts')
    <script>
        var permissions = @json($permissions);
        var showActionColumn = (permissions['hapus'] == 1);
        var audio = new Audio('{{ asset('audio/notification.ogg') }}');

        $(document).ready(function() {
            $('.select-lokasi').select2({
                dropdownParent: $('#modalPrint'),
                width: '100%',
                placeholder: 'Pilih Jenis',
                minimumResultsForSearch: Infinity,
            });

            if ($('body').hasClass('dark')) {
                $('.select2-container').addClass('select2-dark');
            }
        });

        $(function() {
            var table = $('.data-table').DataTable({
                processing: false,
                serverSide: true,
                ordering: false,
                responsive: true,
                autoWidth: false,
                ajax: "{{ route('customer.index') }}",
                columns: [{
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        orderable: false,
                        searchable: false,
                        className: 'text-center'
                    },
                    {
                        data: 'tgl_terima',
                        name: 'tgl_terima',
                        searchable: false
                    },
                    {
                        data: 'nama_lengkap',
                        name: 'nama_lengkap'
                    },
                    {
                        data: 'id_marketing',
                        name: 'id_marketing',
                        searchable: false
                    },
                    {
                        data: 'id_lokasi',
                        name: 'id_lokasi',
                        searchable: false
                    },
                    {
                        data: 'id_status_progres',
                        name: 'id_status_progres',
                        className: 'text-center',
                        searchable: false
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false,
                        visible: showActionColumn
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

        // Hapus data
        $(document).on('click', '.delete-button', function(e) {
            e.preventDefault();

            const form = $(this).closest('form');

            Swal.fire({
                title: 'Apakah Anda yakin?',
                text: 'Data ini akan dihapus secara permanen!',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '<span class="swal-btn-text">Ya, Hapus</span>',
                cancelButtonText: 'Batal',
                showLoaderOnConfirm: false,
                buttonsStyling: false,
                customClass: {
                    confirmButton: 'btn btn-danger mx-2',
                    cancelButton: 'btn btn-secondary'
                },
                preConfirm: () => {
                    return new Promise((resolve) => {
                        const confirmBtn = Swal.getConfirmButton();
                        const btnText = confirmBtn.querySelector('.swal-btn-text');

                        btnText.innerHTML =
                            `<span class="spinner-border spinner-border-sm mx-2" role="status" aria-hidden="true"></span> Menghapus...`;
                        confirmBtn.disabled = true;

                        $.ajax({
                            url: form.attr('action'),
                            method: 'POST',
                            data: form.serialize(),
                            success: function(res) {
                                if (res.success) {
                                    audio.play();
                                    toastr.success("Data berhasil dihapus!",
                                        "BERHASIL", {
                                            progressBar: true,
                                            timeOut: 3500,
                                            positionClass: "toast-bottom-right"
                                        });

                                    $('.data-table').DataTable().ajax.reload(null,
                                        false);
                                    Swal.close();
                                }
                            },
                            error: function() {
                                audio.play();
                                toastr.error("Gagal menghapus Pengguna.",
                                    "GAGAL!", {
                                        progressBar: true,
                                        timeOut: 3500,
                                        positionClass: "toast-bottom-right"
                                    });

                                btnText.innerHTML = `Ya, Hapus`;
                                confirmBtn.disabled = false;
                            }
                        });
                    });
                }
            });
        });
    </script>
@endpush
