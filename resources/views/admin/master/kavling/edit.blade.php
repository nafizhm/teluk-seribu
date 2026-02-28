@extends('admin.layout')
@section('content')
    <div class="page-content">
        <section class="section">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-content-center justify-content-between">
                        <h3 class="font-weight-bold text-xl">Edit Kavling</h3>
                    </div>
                </div>
                <form id="formData">
                    @csrf
                    <div class="card-body">
                        <input type="hidden" name="primary_id" id="primary_id" value="{{ $data->id }}">
                        <div class="row mb-3">
                            <label for="id_lokasi" class="col-sm-3 col-form-label">Lokasi / Cluster</label>
                            <div class="col-sm-6">
                                <input type="text" value="{{ $data->lokasi->nama_kavling ?? '-' }}" class="form-control"
                                    disabled>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="kode_kavling" class="col-sm-3 col-form-label">Kode Kavling</label>
                            <div class="col-sm-6">
                                <input type="text" value="{{ $data->kode_kavling }}" name="kode_kavling"
                                    class="form-control" required disabled>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="panjang_kanan" class="col-sm-3 col-form-label">Panjang Kanan</label>
                            <div class="col-sm-2">
                                <input type="number" step="any" name="panjang_kanan" id="panjang_kanan"
                                    value="{{ $data->panjang_kanan }}" class="form-control">
                            </div>

                            <label for="panjang_kiri" class="col-sm-2 col-form-label">Panjang Kiri</label>
                            <div class="col-sm-2">
                                <input type="number" step="any" value="{{ $data->panjang_kiri }}" name="panjang_kiri"
                                    id="panjang_kiri" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="lebar_depan" class="col-sm-3 col-form-label">Lebar Depan</label>
                            <div class="col-sm-2">
                                <input type="number" step="any" value="{{ $data->lebar_depan }}" name="lebar_depan"
                                    id="lebar_depan" class="form-control">
                            </div>

                            <label for="lebar_belakang" class="col-sm-2 col-form-label">Lebar
                                Belakang</label>
                            <div class="col-sm-2">
                                <input type="number" step="any" value="{{ $data->lebar_belakang }}"
                                    name="lebar_belakang" id="lebar_belakang" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="luas_tanah" class="col-sm-3 col-form-label">Luas Tanah</label>
                            <div class="col-sm-2">
                                <input type="number" step="any" value="{{ $data->luas_tanah }}" name="luas_tanah"
                                    id="luas_tanah" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="hrg_meter" class="col-sm-3 col-form-label">Harga Per Meter</label>
                            <div class="col-sm-4">
                                <input type="text" value="{{ number_format($data->hrg_meter, 0, ',', '.') }}"
                                    name="hrg_meter" id="hrg_meter" class="form-control format-number">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="hrg_jual" class="col-sm-3 col-form-label">Harga Jual</label>
                            <div class="col-sm-4">
                                <input type="text" value="{{ number_format($data->hrg_jual, 0, ',', '.') }}"
                                    name="hrg_jual" id="hrg_jual" class="form-control format-number">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="keterangan" class="col-sm-3 col-form-label">Keterangan</label>
                            <div class="col-sm-4">
                                <input type="text" value="{{ $data->keterangan }}" name="keterangan" id="keterangan"
                                    class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="no_sertifikat" class="col-sm-3 col-form-label">NO. Sertifikat</label>
                            <div class="col-sm-4">
                                <input type="text" value="{{ $data->no_sertifikat }}" name="no_sertifikat"
                                    id="no_sertifikat" class="form-control">
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

        $('#formData').on('submit', function(e) {
            e.preventDefault();

            let submitBtn = $('#submitBtn');
            let spinner = submitBtn.find('.spinner-border');
            let btnText = submitBtn.find('.button-text');

            spinner.removeClass('d-none');
            btnText.text('Menyimpan...');
            submitBtn.prop('disabled', true);

            let id = $('#primary_id').val();
            let url = '{{ route('kavling.update', ['kavling' => ':id']) }}'.replace(':id',
                id);
            let method = 'PUT';

            $('.is-invalid').removeClass('is-invalid');
            $('.invalid-feedback').remove();

            let formData = new FormData(this);
            formData.append('_method', method);

            $.ajax({
                url: url,
                method: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                success: function(res) {
                    if (res.success) {
                        audio.play();
                        let msg = "Data berhasil diupdate!";
                        toastr.success(msg, "BERHASIL", {
                            progressBar: true,
                            timeOut: 3500,
                            positionClass: "toast-bottom-right",
                            onHidden: function() {
                                window.location.href =
                                    '{{ route('kavling.index') }}';
                            }
                        });
                    } else {
                        audio.play();
                        let msg = res.message || "Terjadi kesalahan server!";
                        toastr.error(msg, "ERROR!", {
                            progressBar: true,
                            timeOut: 3500,
                            positionClass: "toast-bottom-right",
                        });
                    }
                },
                error: function(xhr) {
                    if (xhr.status === 422) {
                        audio.play();
                        toastr.error("Ada inputan yang salah!", "GAGAL!", {
                            progressBar: true,
                            timeOut: 3500,
                            positionClass: "toast-bottom-right",
                        });

                        let errors = xhr.responseJSON.errors;
                        $.each(errors, function(key, val) {
                            let input = $('#' + key);
                            input.addClass('is-invalid');
                            input.parent().find('.invalid-feedback').remove();
                            input.parent().append(
                                '<span class="invalid-feedback" role="alert"><strong>' +
                                val[0] + '</strong></span>'
                            );
                        });
                    } else {
                        audio.play();
                        let msg = xhr.responseJSON?.message || "Terjadi kesalahan server!";
                        toastr.error(msg, "ERROR!", {
                            progressBar: true,
                            timeOut: 3500,
                            positionClass: "toast-bottom-right",
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
