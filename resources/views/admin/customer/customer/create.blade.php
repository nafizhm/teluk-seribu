@extends('admin.layout')
@section('content')
    <div class="page-content">
        <section class="section">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-content-center justify-content-between">
                        <h3 class="font-weight-bold text-xl">Form Data Customer</h3>
                    </div>
                </div>
                <form id="formData">
                    @csrf
                    <div class="card-body">
                        <div class="row mb-3">
                            <label for="tgl_terima" class="col-sm-3 col-form-label">Tanggal</label>
                            <div class="col-sm-3">
                                <input type="date" name="tgl_terima" id="tgl_terima" class="form-control"
                                    value="{{ \Carbon\Carbon::now('Asia/Jakarta')->format('Y-m-d') }}">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="nama_lengkap" class="col-sm-3 col-form-label">Nama Lengkap</label>
                            <div class="col-sm-5">
                                <input type="text" name="nama_lengkap" id="nama_lengkap" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="no_ktp" class="col-sm-3 col-form-label">No. KTP</label>
                            <div class="col-sm-3">
                                <input type="number" name="no_ktp" id="no_ktp" class="form-control">
                            </div>
                            <label for="no_ktp_p" class="col-sm-2 col-form-label">No. KTP Pasangan</label>
                            <div class="col-sm-3">
                                <input type="number" name="no_ktp_p" id="no_ktp_p" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="tempat_lahir" class="col-sm-3 col-form-label">Tempat Lahir</label>
                            <div class="col-sm-3">
                                <input type="text" name="tempat_lahir" id="tempat_lahir" class="form-control">
                            </div>

                            <label for="tgl_lahir" class="col-sm-2 col-form-label">Tanggal Lahir</label>
                            <div class="col-sm-3">
                                <input type="date" name="tgl_lahir" id="tgl_lahir" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="jenis_kelamin" class="col-sm-3 col-form-label">Jenis Kelamin</label>
                            <div class="col-sm-3">
                                <select name="jenis_kelamin" id="jenis_kelamin" class="form-control select-jk">
                                    <option value=""></option>
                                    <option value="Laki-laki">Laki-laki</option>
                                    <option value="Perempuan">Perempuan</option>
                                </select>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="no_telp" class="col-sm-3 col-form-label">No. Telp / WA</label>
                            <div class="col-sm-3">
                                <input type="number" name="no_telp" id="no_telp" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="email" class="col-sm-3 col-form-label">Email</label>
                            <div class="col-sm-3">
                                <input type="email" name="email" id="email" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="npwp" class="col-sm-3 col-form-label">NPWP</label>
                            <div class="col-sm-3">
                                <input type="text" name="npwp" id="npwp" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="alamat" class="col-sm-3 col-form-label">Alamat KTP</label>
                            <div class="col-sm-5">
                                <input type="text" name="alamat" id="alamat" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="alamat_domisili" class="col-sm-3 col-form-label">Alamat Domisili</label>
                            <div class="col-sm-5">
                                <input type="text" name="alamat_domisili" id="alamat_domisili" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="pekerjaan" class="col-sm-3 col-form-label">Pekerjaan</label>
                            <div class="col-sm-3">
                                <input type="text" name="pekerjaan" id="pekerjaan" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="id_lokasi" class="col-sm-3 col-form-label">Lokasi Perumahan</label>
                            <div class="col-sm-3">
                                <select name="id_lokasi" id="id_lokasi" class="form-control select-lokasi">
                                    <option value=""></option>
                                    @foreach ($lokasi as $l)
                                        <option value="{{ $l->id }}">{{ $l->nama_kavling }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="id_kavling" class="col-sm-3 col-form-label">Blok / Kode Kavling</label>
                            <div class="col-sm-5">
                                <select name="id_kavling[]" id="id_kavling" class="form-control select-kavling"
                                    multiple="multiple">
                                </select>
                                <small class="text-muted">Bisa pilih lebih dari satu</small>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="hrg_jual" class="col-sm-3 col-form-label">Harga Jual</label>
                            <div class="col-sm-3">
                                <input type="text" id="hrg_jual" name="hrg_jual_display" class="form-control"
                                    disabled>
                                <input type="text" name="hrg_jual" id="hrg_jual_hidden" hidden>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="discount" class="col-sm-3 col-form-label">Potongan Harga</label>
                            <div class="col-sm-3">
                                <input type="text" name="discount" id="discount" class="form-control format-number"
                                    value="0">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="id_marketing" class="col-sm-3 col-form-label">Marketing</label>
                            <div class="col-sm-3">
                                <select name="id_marketing" id="id_marketing" class="form-control select-marketing">
                                    <option value=""></option>
                                    @foreach ($marketing as $m)
                                        <option value="{{ $m->id }}">{{ $m->nama_marketing }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="id_status_progres" class="col-sm-3 col-form-label">Status Penjualan</label>
                            <div class="col-sm-3">
                                <select name="id_status_progres" id="id_status_progres"
                                    class="form-control select-status-progres">
                                    <option value=""></option>
                                    @foreach ($progres as $p)
                                        <option value="{{ $p->id }}">{{ $p->status_progres }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="ket_cashback" class="col-sm-3 col-form-label">Keterangan</label>
                            <div class="col-sm-5">
                                <input type="text" name="ket_cashback" id="ket_cashback" class="form-control">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="id_bank" class="col-sm-3 col-form-label">Rekening Pembayaran</label>
                            <div class="col-sm-4">
                                <select class="form-select select-bank" name="id_bank" id="id_bank">
                                    <option value=""></option>
                                    @foreach ($bankList as $item)
                                        <option value="{{ $item->id }}">{{ $item->nama }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="jenis_pembelian" class="col-sm-3 col-form-label">Jenis Pembelian</label>
                            <div class="col-sm-3">
                                <select name="jenis_pembelian" id="jenis_pembelian"
                                    class="form-control select-jenis-pembelian">
                                    <option value=""></option>
                                    <option value="Booking">Booking Fee</option>
                                    <option value="Cash Keras">Cash Keras</option>
                                    <option value="Kredit">Kredit</option>
                                </select>
                            </div>
                        </div>

                        <!-- BOOKING ==================================> -->
                        <hr class="hr-transaksi" style="display: none;">
                        <div id="trx_booking" style="display: none;">

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label">Pembayaran Booking</label>
                                <div class="col-sm-3">
                                    <input name="pembayaran_booking" id="pembayaran_booking format-number"
                                        class="form-control format-number" type="text">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label">Tanggal Batas Booking</label>
                                <div class="col-sm-3">
                                    <input name="tgl_batas_booking" id="tgl_batas_booking" class="form-control"
                                        type="date">
                                </div>
                            </div>
                        </div>

                        <!-- CASH ==================================> -->
                        <hr class="hr-transaksi" style="display: none;">
                        <div id="trx_cash" style="display: none;">
                            <div class="row mb-3">
                                <label for="jumlah_pembayaran" class="col-sm-3 col-form-label">Jumlah Pembayaran</label>
                                <div class="col-sm-3">
                                    <input type="text" name="jumlah_pembayaran" id="jumlah_pembayaran"
                                        class="form-control format-number" value="0">
                                </div>
                            </div>
                        </div>

                        <!-- CASH BERTAHAP ==================================> -->
                        <hr class="hr-transaksi" style="display: none;">
                        <div id="trx_cash_bertahap" style="display: none;">
                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label">Termin (x)</label>
                                <div class="col-sm-3">
                                    <input name="jumlah_bulan_x" id="jumlah_bulan_x" class="form-control" type="number"
                                        value="0">
                                </div>
                            </div>
                        </div>

                        <!-- KREDIT ==================================> -->
                        <hr class="hr-transaksi" style="display: none;">
                        <div id="trx_kredit" style="display: none;">
                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label">DP</label>
                                <div class="col-sm-4">
                                    <input type="text" name="dp_kredit" id="dp_kredit"
                                        class="form-control format-number">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label">Tenor (Jumlah Bulan)</label>
                                <div class="col-sm-4">
                                    <input type="number" name="inhouse_tenor" id="inhouse_tenor" class="form-control">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label">Cicilan Per Bulan</label>
                                <div class="col-sm-4">
                                    <input type="text" name="inhouse_perbulan" id="inhouse_perbulan"
                                        class="form-control format-number">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label">Jatuh Tempo</label>
                                <div class="col-sm-4">
                                    <input type="date" name="inhouse_jatuh_tempo" class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-footer d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary" id="submitBtn">
                            <span class="spinner-border spinner-border-sm me-2 d-none" role="status"
                                aria-hidden="true"></span>
                            <span class="button-text">Simpan</span>
                        </button>
                    </div>
                </form>
        </section>
    </div>
@endsection
@push('scripts')
    <script>
        var audio = new Audio('{{ asset('audio/notification.ogg') }}');

        $(document).ready(function() {
            $('.select-jk').select2({
                dropdownParent: $('#formData'),
                width: '100%',
                placeholder: 'Pilih Jenis Kelamin',
                minimumResultsForSearch: Infinity,
            });
            $('.select-lokasi').select2({
                dropdownParent: $('#formData'),
                width: '100%',
                placeholder: 'Pilih Lokasi',
                minimumResultsForSearch: Infinity,
            });
            $('.select-kavling').select2({
                dropdownParent: $('#formData'),
                width: '100%',
                placeholder: 'Pilih Kavling',
                minimumResultsForSearch: 0,
                closeOnSelect: false
            });
            $('.select-marketing').select2({
                dropdownParent: $('#formData'),
                width: '100%',
                placeholder: 'Pilih Marketing',
                minimumResultsForSearch: 0,
            });
            $('.select-bank').select2({
                dropdownParent: $('#formData'),
                width: '100%',
                placeholder: 'Pilih bank',
                minimumResultsForSearch: Infinity,
            })
            $('.select-status-progres').select2({
                dropdownParent: $('#formData'),
                width: '100%',
                placeholder: 'Pilih Status Penjualan',
                minimumResultsForSearch: Infinity,
            });
            $('.select-jenis-pembelian').select2({
                dropdownParent: $('#formData'),
                width: '100%',
                placeholder: 'Pilih Jenis Pembelian',
                minimumResultsForSearch: Infinity,
            });

            if ($('body').hasClass('dark')) {
                $('.select2-container').addClass('select2-dark');
            }

            function hideAllTransactionForms() {
                $('#trx_booking').hide();
                $('#trx_cash').hide();
                $('#trx_cash_bertahap').hide();
                $('#trx_kredit').hide();
                $('.hr-transaksi').hide();
            }

            $('#jenis_pembelian').on('change', function() {
                let selected = $(this).val();
                hideAllTransactionForms();

                switch (selected) {
                    case 'Booking':
                        $('#trx_booking').prev('.hr-transaksi').show();
                        $('#trx_booking').show();
                        break;
                    case 'Cash Keras':
                        $('#trx_cash').prev('.hr-transaksi').show();
                        $('#trx_cash').show();
                        break;
                    case 'Cash Bertahap':
                        $('#trx_cash_bertahap').prev('.hr-transaksi').show();
                        $('#trx_cash_bertahap').show();
                        break;
                    case 'Kredit':
                        $('#trx_kredit').prev('.hr-transaksi').show();
                        $('#trx_kredit').show();
                        break;
                }
            });

            const routeGetKavling = "{{ route('customer.getKavling', ':id') }}";
            const routeGetHarga = "{{ route('customer.getHargaKavling', ':ids') }}";

            $('#id_lokasi').on('change', function() {
                let idLokasi = $(this).val();
                $('#id_kavling').html('<option value="">Loading...</option>').trigger('change');
                $('#hrg_jual').val('');
                $('#hrg_jual_hidden').val('');

                if (idLokasi) {
                    const urlKavling = routeGetKavling.replace(':id', idLokasi);
                    $.get(urlKavling, function(data) {
                        let options = '<option value=""></option>';
                        data.forEach(function(item) {
                            options +=
                                `<option value="${item.id}">${item.kode_kavling}</option>`;
                        });
                        $('#id_kavling').html(options).trigger('change');
                    });
                }
            });

            $('#id_kavling').on('change', function() {
                let idKavling = $(this).val();

                if (idKavling && idKavling.length > 0) {
                    let idsString = idKavling.join(',');

                    let urlHarga = "{{ route('customer.getHargaKavling', ':ids') }}";
                    urlHarga = urlHarga.replace(':ids', idsString);

                    $.get(urlHarga, function(data) {
                        $('#hrg_jual').val(data.formatted);
                        $('#hrg_jual_hidden').val(data.hrg_jual);
                        calculateAll();
                    });
                } else {
                    $('#hrg_jual').val('');
                    $('#hrg_jual_hidden').val('');
                    calculateAll();
                }
            });

            function parseNumber(str) {
                if (!str) return 0;
                return parseInt(str.replace(/[^0-9]/g, '')) || 0;
            }

            function formatNumber(num) {
                return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            }

            function calculateAll() {
                let hrgJual = parseNumber($('#hrg_jual_hidden').val());
                let discount = parseNumber($('#discount').val());
                let netHarga = hrgJual - discount;

                let jenis = $('#jenis_pembelian').val();

                if (jenis === 'Cash Keras') {
                    $('#jumlah_pembayaran').val(formatNumber(netHarga));
                } else if (jenis === 'Kredit') {
                    let dp = parseNumber($('#dp_kredit').val());
                    let tenor = parseInt($('#inhouse_tenor').val()) || 0;
                    if (tenor > 0) {
                        let cicilan = Math.ceil((netHarga - dp) / tenor);
                        $('#inhouse_perbulan').val(formatNumber(cicilan));
                    }
                }
            }

            $(document).on('keyup change', '#discount, #dp_kredit, #inhouse_tenor, #jenis_pembelian', function() {
                calculateAll();
            });
        });

        $('#formData').on('submit', function(e) {
            e.preventDefault();

            let submitBtn = $('#submitBtn');
            let spinner = submitBtn.find('.spinner-border');
            let btnText = submitBtn.find('.button-text');

            spinner.removeClass('d-none');
            btnText.text('Menyimpan...');
            submitBtn.prop('disabled', true);

            let url = '{{ route('customer.store') }}';
            let method = 'POST';

            $('.is-invalid').removeClass('is-invalid');
            $('.invalid-feedback').remove();

            let formData = new FormData(this);
            formData.append('_method', method);

            console.log("Form submitted!");

            $.ajax({
                url: url,
                method: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                success: function(res) {
                    if (res.success) {
                        audio.play();
                        let msg = "Customer berhasil ditambahkan!";
                        toastr.success(msg, "BERHASIL", {
                            progressBar: true,
                            timeOut: 3500,
                            positionClass: "toast-bottom-right",
                            onHidden: function() {
                                window.location.href =
                                    '{{ route('customer.index') }}';
                            }
                        });
                    }
                },
                error: function(xhr) {
                    if (xhr.status === 422) {
                        audio.play();

                        if (xhr.responseJSON.message) {
                            toastr.error(xhr.responseJSON.message, "GAGAL!", {
                                progressBar: true,
                                timeOut: 3500,
                                positionClass: "toast-bottom-right",
                            });
                        } else {
                            toastr.error("Ada inputan yang salah!", "GAGAL!", {
                                progressBar: true,
                                timeOut: 3500,
                                positionClass: "toast-bottom-right",
                            });
                        }

                        let errors = xhr.responseJSON.errors;
                        if (errors) {
                            $.each(errors, function(key, val) {
                                let input = $('#' + key);
                                input.addClass('is-invalid');
                                input.parent().find('.invalid-feedback').remove();
                                input.parent().append(
                                    '<span class="invalid-feedback" role="alert"><strong>' +
                                    val[0] + '</strong></span>'
                                );
                            });
                        }
                    } else {
                        audio.play();
                        toastr.error("Gagal menambahkan data.", "GAGAL!", {
                            progressBar: true,
                            timeOut: 3500,
                            positionClass: "toast-bottom-right"
                        });
                    }
                },
                complete: function() {
                    spinner.addClass('d-none');
                    btnText.text('Simpan');
                    submitBtn.prop('disabled', false);
                }
            });
        });
    </script>
@endpush
