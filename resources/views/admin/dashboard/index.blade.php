@extends('admin.layout')
@section('content')
    @php
        $logo = \App\Models\KonfigurasiMedia::where('jenis_data', 'logo website')->first();
    @endphp

    <div class="page-content">
        <section class="section d-flex flex-column gap-3">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="card bg-warning text-white ">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="card-title mb-1">{{ $kuning }}</h3>
                                <p class="card-text mb-0">Booking</p>
                            </div>
                        </div>
                        <div class="card-footer bg-warning border-0 p-0">
                            <a href="{{ route('booking.unit') }}"
                                class="btn btn-link text-white text-decoration-none w-100 py-2 rounded-0">
                                <small>Detail Data <i class="bi bi-arrow-right-circle"></i></small>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="card bg-success text-white ">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="card-title mb-1">{{ $hijau }}</h3>
                                <p class="card-text mb-0">Akad</p>
                            </div>
                        </div>
                        <div class="card-footer bg-success border-0 p-0">
                            <a href="{{ route('akad.unit') }}"
                                class="btn btn-link text-white text-decoration-none w-100 py-2 rounded-0">
                                <small>More info <i class="bi bi-arrow-right-circle"></i></small>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="card bg-secondary text-white ">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="card-title mb-1">{{ $totalLunas }}</h3>
                                <p class="card-text mb-0">Kavling Lunas</p>
                            </div>
                        </div>
                        <div class="card-footer bg-secondary border-0 p-0">
                            <a href="{{ route('lunas.unit') }}"
                                class="btn btn-link text-white text-decoration-none w-100 py-2 rounded-0">
                                <small>More info <i class="bi bi-arrow-right-circle"></i></small>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="card bg-info text-white ">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="card-title mb-1">{{ $totalLokasiReady }}</h3>
                                <p class="card-text mb-0">Kavling Ready</p>
                            </div>
                        </div>
                        <div class="card-footer bg-info border-0 p-0">
                            <a href="{{ route('kavlingReady.unit') }}"
                                class="btn btn-link text-white text-decoration-none w-100 py-2 rounded-0">
                                <small>More info <i class="bi bi-arrow-right-circle"></i></small>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    {{-- Card Container: Ditambah border-0 dan overflow-hidden agar rounded corner rapi --}}
                    <div class="card shadow-sm border-0 overflow-hidden mb-4">

                        {{-- Header Bagian Atas (Pengganti widget-user-header) --}}
                        <div class="card-header bg-primary text-white p-3">
                            <div class="d-flex align-items-center">
                                {{-- Bagian Gambar/Logo --}}
                                <div class="flex-shrink-0 me-3">
                                    <img class="rounded-circle border border-2 border-white"
                                        style="width: 65px; height: 65px; object-fit: cover;"
                                        src="{{ asset('config_media/' . ($logo->nama_file ?? 'default.png')) }}"
                                        alt="User Avatar">
                                </div>

                                {{-- Bagian Teks Judul --}}
                                <div class="flex-grow-1">
                                    <h4 class="mb-0 fw-bold">Statistik Penjualan per Lokasi</h4>
                                    <p class="mb-0 text-white-50 small">
                                        <i class="bi bi-calendar-event me-1"></i> Per {{ $dateNow }}
                                    </p>
                                </div>
                            </div>
                        </div>

                        {{-- Body Card: Berisi Tabel --}}
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                {{-- Ditambah table-striped dan table-hover untuk estetika --}}
                                <table class="table table-bordered table-striped table-hover mb-0 align-middle">
                                    <thead>
                                        <tr>
                                            <th class="text-center" width="5%">No</th>
                                            <th width="30%">Nama Lokasi</th>
                                            <th width="7%" class="text-center">KODE</th>
                                            <th width="6%" class="text-center">Jumlah</th>
                                            <th width="7%" class="text-center">HOLD</th>

                                            @foreach ($kolomStatus as $status)
                                                <th class="text-center">{{ strtoupper($status->short_name) }}</th>
                                            @endforeach
                                            <th class="text-center">ACTION</th>
                                            <th class="text-center">CASH</th>
                                            <th class="text-center">KREDIT</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($dataLokasi as $lokasi)
                                            <tr>
                                                <td class="text-center">{{ $loop->iteration }}</td>
                                                <td class="fw-bold">{{ $lokasi['nama'] }}</td>
                                                <td align="center">
                                                    <span class="badge bg-secondary">{{ $lokasi['nama_singk_1'] }}</span>
                                                </td>
                                                <td align="center" class="table-warning fw-bold">{{ $lokasi['jumlah'] }}
                                                </td>
                                                <td align="center">{{ $lokasi['hold'] }}</td>

                                                @foreach ($kolomStatus as $status)
                                                    @php
                                                        $key = strtolower(str_replace(' ', '_', $status->short_name));
                                                    @endphp
                                                    <td align="center">{{ $lokasi[$key] ?? 0 }}</td>
                                                @endforeach

                                                <td align="center" class="table-primary">
                                                    <a href="{{ route('dashboard.lokasi-penjualan-show', $lokasi['id']) }}"
                                                        class="btn btn-primary btn-sm px-3 rounded-pill">
                                                        Detail
                                                    </a>
                                                </td>
                                                <td align="center">{{ $lokasi['cash'] }}</td>
                                                <td align="center">{{ $lokasi['kredit'] }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                    <tfoot class="table-dark">
                                        <tr class="fw-bold border-top border-2">
                                            <td colspan="2" class="text-end pe-3">TOTAL</td>
                                            <td></td>
                                            <td align="center">{{ $totalLokasi['jumlah'] }}</td>
                                            <td align="center">{{ $totalLokasi['hold'] }}</td>

                                            @foreach ($kolomStatus as $status)
                                                @php $key = strtolower(str_replace(' ', '_', $status->short_name)); @endphp
                                                <td align="center">{{ $totalLokasi[$key] }}</td>
                                            @endforeach

                                            <td align="center" class="bg-warning text-dark">{{ $totalData }}</td>
                                            <td align="center">{{ $totalLokasi['cash'] }}</td>
                                            <td align="center">{{ $totalLokasi['kredit'] }}</td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {{-- <div class="row">
                <div class="card shadow-sm border-0 overflow-hidden mb-4">
                    <div class="card-header bg-primary text-white p-3">
                        <div class="d-flex align-items-center">
                            <div class="flex-shrink-0 me-3">
                                <img class="rounded-circle border border-2 border-white"
                                    style="width: 65px; height: 65px; object-fit: cover;"
                                    src="{{ asset('config_media/' . ($logo->nama_file ?? 'default.png')) }}"
                                    alt="User Avatar">
                            </div>

                            <div class="flex-grow-1">
                                <h4 class="mb-0 fw-bold">Statistik Unit Ready per Perumahan</h4>
                                <p class="mb-0 text-white-50 small">
                                    <i class="bi bi-calendar-event me-1"></i> Per {{ $dateNow }}
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-hover mb-0 align-middle">
                                <thead>
                                    <tr>
                                        <th class="text-center" width="5%">No</th>
                                        <th width="30%">Nama Perumahan</th>
                                        <th width="6%" class="text-center">Jumlah</th>

                                        @foreach ($kolomStatusReady as $status)
                                            <th class="text-center">{{ strtoupper($status->keterangan) }}</th>
                                        @endforeach
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($dataLokasiReady as $lokasi)
                                        <tr>
                                            <td class="text-center">{{ $loop->iteration }}</td>

                                            <td class="fw-bold">{{ $lokasi['nama'] }}</td>

                                            <td align="center" class="table-warning fw-bold">{{ $lokasi['jumlah'] }}
                                            </td>

                                            @foreach ($kolomStatusReady as $status)
                                                @php
                                                    $key = strtolower(str_replace(' ', '_', $status->keterangan));
                                                @endphp
                                                <td align="center" width="5%">{{ $lokasi[$key] ?? 0 }}</td>
                                            @endforeach
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div> --}}

            <div class="row">
                {{-- WIDGET 1: Statistik Status Progres --}}
                <div class="col-md-6">
                    <div class="card shadow-sm border-0 overflow-hidden mb-4">

                        {{-- Header: bg-warning --}}
                        <div class="card-header bg-warning text-white p-3">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0 me-3">
                                    <img class="rounded-circle border border-2 border-white"
                                        style="width: 65px; height: 65px; object-fit: cover;"
                                        src="{{ asset('config_media/' . ($logo->nama_file ?? 'default.png')) }}"
                                        alt="User Avatar">
                                </div>
                                <div class="flex-grow-1">
                                    <h4 class="mb-0 fw-bold">Statistik Status Progres</h4>
                                    <p class="mb-0 text-white-50 small">
                                        <i class="bi bi-calendar-event me-1"></i> Per {{ $dateNow }}
                                    </p>
                                </div>
                            </div>
                        </div>

                        {{-- Body --}}
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover mb-0 align-middle">
                                    <thead>
                                        <tr>
                                            <th class="text-center" width="5%">No</th>
                                            <th width="45%">Jenis Progres</th>
                                            <th class="text-end" width="15%">Jumlah</th>
                                            <th class="text-end" width="15%">Persentase</th>
                                            <th class="text-center" width="20%">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($dataProgres as $item)
                                            <tr>
                                                <td class="text-center">{{ $item['no'] }}</td>
                                                <td class="fw-bold">{{ $item['status_progres'] }}</td>
                                                <td class="text-end">{{ $item['jumlah'] }}</td>
                                                <td class="text-end">{{ $item['persentase'] }} %</td>
                                                <td class="text-center">
                                                    <a href="{{ route('dashboard.customer-status-progres-show', $item['id_status_progres']) }}"
                                                        class="btn btn-warning btn-sm text-white rounded-pill px-3">
                                                        Detail
                                                    </a>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card shadow-sm border-0 overflow-hidden mb-4">

                        {{-- Header: bg-success (Hijau) --}}
                        <div class="card-header bg-success text-white p-3">
                            <div class="d-flex align-items-center">
                                {{-- Bagian Gambar/Avatar --}}
                                <div class="flex-shrink-0 me-3">
                                    <img class="rounded-circle border border-2 border-white"
                                        style="width: 65px; height: 65px; object-fit: cover;"
                                        src="{{ asset('config_media/' . ($logo->nama_file ?? 'default.png')) }}"
                                        alt="User Avatar">
                                </div>

                                {{-- Bagian Judul --}}
                                <div class="flex-grow-1">
                                    <h4 class="mb-0 fw-bold">Statistik Penjualan Marketing</h4>
                                    <p class="mb-0 text-white-50 small">
                                        <i class="bi bi-calendar-event me-1"></i> Per {{ $dateNow }}
                                    </p>
                                </div>
                            </div>
                        </div>

                        {{-- Body: Tabel --}}
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover mb-0 align-middle">
                                    <thead>
                                        <tr>
                                            <th class="text-center" scope="col" width="5%">No</th>
                                            <th scope="col" width="45%">Nama Marketing</th>
                                            <th class="text-end" scope="col" width="15%">Penjualan</th>
                                            <th class="text-end" scope="col" width="15%">Persentase</th>
                                            <th class="text-center" scope="col" width="20%">Detail</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($dataMarketing as $marketing)
                                            <tr>
                                                <td class="text-center">{{ $marketing['no'] }}</td>
                                                <td class="fw-bold">{{ $marketing['marketing'] }}</td>
                                                <td class="text-end">{{ $marketing['jumlah'] }}</td>
                                                <td class="text-end">{{ $marketing['persentase'] }} %</td>
                                                <td class="text-center">
                                                    <a href="{{ route('dashboard.customer-marketing-show', $marketing['id_marketing']) }}"
                                                        class="btn btn-success btn-sm text-white rounded-pill px-3">
                                                        Detail
                                                    </a>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
@push('scripts')
    <script></script>
@endpush
