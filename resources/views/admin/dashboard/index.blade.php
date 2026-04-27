@extends('admin.layout')
@section('content')
    @php
        $logo = \App\Models\KonfigurasiMedia::where('jenis_data', 'logo website')->first();

        $bgCard1 = DB::table('konfigurasi_media')->where('jenis_data', 'Background Card1')->value('nama_file');
        $bgCard2 = DB::table('konfigurasi_media')->where('jenis_data', 'Background Card2')->value('nama_file');
        $bgCard3 = DB::table('konfigurasi_media')->where('jenis_data', 'Background Card3')->value('nama_file');
        $bgCard4 = DB::table('konfigurasi_media')->where('jenis_data', 'Background Card4')->value('nama_file');
        $bgHeaderCard = DB::table('konfigurasi_media')->where('jenis_data', 'Background Header Card')->value('nama_file');

    @endphp

    <div class="page-content">
        <section class="gap-3 section d-flex flex-column">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="text-white card"
                        style="
                            background-image: {{ $bgCard1 ? "url('" . asset('config_media/' . $bgCard1) . "')" : 'none' }};
                            background-color: {{ $bgCard1 ? 'transparent' : '' }};
                            {{ $bgCard1 ? 'background-size: cover; background-position: center; background-repeat: no-repeat;' : '' }}
                            {{ !$bgCard1 ? 'background-color: #ffc107;' : '' }}
                        ">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="mb-1 card-title">{{ $jumlahKavling }}</h3>
                                <p class="mb-0 card-text">Jumlah Kavling</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="text-white card"
                        style="
                            background-image: {{ $bgCard2 ? " url('" . asset('config_media/' . $bgCard2) . "')" : 'none' }};
                            background-size: cover; background-position: center; background-repeat: no-repeat;
                            {{ !$bgCard2 ? 'background-color: #198754;' : '' }}
                        ">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="mb-1 card-title">{{ $sudahLaku }}</h3>
                                <p class="mb-0 card-text">Sudah Laku</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="text-white card"
                        style="
                            background-image: {{ $bgCard3 ? "linear-gradient(rgba(108, 117, 125, 0.75), rgba(108, 117, 125, 0.75)), url('" . asset('config_media/' . $bgCard3) . "')" : 'none' }};
                            background-size: cover; background-position: center; background-repeat: no-repeat;
                            {{ !$bgCard3 ? 'background-color: #6c757d;' : '' }}
                        ">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="mb-1 card-title">{{ $sisaLaku }}</h3>
                                <p class="mb-0 card-text">Sisa</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="text-white card position-relative"
                        style="
                            background-image: {{ $bgCard4 ? "linear-gradient(rgba(13, 202, 240, 0.75), rgba(13, 202, 240, 0.75)), url('" . asset('config_media/' . $bgCard4) . "')" : 'none' }};
                            background-size: cover; background-position: center; background-repeat: no-repeat;
                            {{ !$bgCard4 ? 'background-color: #0dcaf0;' : '' }}
                        ">
                        <a href="{{ route('dashboard.detail-penjualan') }}" class="stretched-link"></a>
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="mb-1 card-title">
                                    <i class="bi bi-arrow-right-circle"></i>
                                </h3>
                                <p class="mb-0 card-text">Detail Penjualan</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="mb-4 overflow-hidden border-0 shadow-sm card">
                       <div class="p-3 overflow-hidden text-white bg-danger position-relative"
                        style="border-radius: inherit;">

                        @if($bgHeaderCard ?? null)
                            <div style="
                                position: absolute;
                                top: 0;
                                left: 0;
                                right: 0;
                                bottom: 0;
                                margin: 0;
                                background-image: url('{{ asset('config_media/' . $bgHeaderCard) }}');
                                object-fit: fill;
                                background-position: center;
                                background-repeat: no-repeat;
                                mix-blend-mode: overlay;
                                opacity: 0.5;
                                z-index: 0;
                            "></div>
                        @endif

                        <div class="d-flex align-items-center position-relative" style="z-index: 1;">
                            <div class="flex-shrink-0 me-3">
                                <img class="border border-2 border-white rounded-circle"
                                    style="width: 65px; height: 65px; object-fit: cover;"
                                    src="{{ asset('config_media/' . ($logo->nama_file ?? 'default.png')) }}"
                                    alt="User Avatar">
                            </div>

                            <div class="flex-grow-1">
                                <h4 class="mb-0 text-white fw-bold">Statistik Penjualan per Lokasi</h4>
                                <p class="mb-0 text-white-50 small">
                                    <i class="bi bi-calendar-event me-1"></i> Per {{ $dateNow }}
                                </p>
                            </div>
                        </div>

                    </div>

                        <div class="p-0 card-body">
                            <div class="table-responsive">
                                <table class="table mb-0 align-middle table-bordered table-striped table-hover">
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
                                                        class="px-3 btn btn-primary btn-sm rounded-pill">
                                                        Detail
                                                    </a>
                                                </td>
                                                <td align="center">{{ $lokasi['cash'] }}</td>
                                                <td align="center">{{ $lokasi['kredit'] }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                    <tfoot class="table-dark">
                                        <tr class="border-2 fw-bold border-top">
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

            <div class="row">
                <div class="col-md-6">
                    <div class="mb-4 overflow-hidden border-0 shadow-sm card">
                        <div class="p-3 text-white card-header bg-primary">
                             @if($bgHeaderCard ?? null)
                            <div style="
                                position: absolute;
                                top: 0;
                                left: 0;
                                right: 0;
                                bottom: 0;
                                margin: 0;
                                background-image: url('{{ asset('config_media/' . $bgHeaderCard) }}');
                                object-fit: fill;
                                background-position: center;
                                background-repeat: no-repeat;
                                mix-blend-mode: overlay;
                                opacity: 0.5;
                                z-index: 0;
                            "></div>
                        @endif
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0 me-3">
                                    <img class="border border-2 border-white rounded-circle"
                                        style="width: 65px; height: 65px; object-fit: cover;"
                                        src="{{ asset('config_media/' . ($logo->nama_file ?? 'default.png')) }}"
                                        alt="Avatar">
                                </div>
                                <div class="flex-grow-1">
                                    <h4 class="mb-0 text-white fw-bold">Grafik Penjualan</h4>
                                    <p class="mb-0 text-white-50 small">
                                        <i class="bi bi-calendar-event me-1"></i> Per {{ $dateNow }}
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="mt-3 mb-4 row">
                                <div class="col-5">
                                    <select class="form-control select-tahun" name="tahun" id="tahun">
                                        <option value="0">Semua Tahun</option>
                                        @foreach ($years as $year)
                                            <option value="{{ $year }}"
                                                {{ $year == now()->year ? 'selected' : '' }}>
                                                {{ $year }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <canvas id="barChart" height="120"></canvas>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="mb-4 overflow-hidden border-0 shadow-sm card">
                        <div class="p-3 text-white card-header bg-success">
                             @if($bgHeaderCard ?? null)
                            <div style="
                                position: absolute;
                                top: 0;
                                left: 0;
                                right: 0;
                                bottom: 0;
                                margin: 0;
                                background-image: url('{{ asset('config_media/' . $bgHeaderCard) }}');
                                object-fit: fill;
                                background-position: center;
                                background-repeat: no-repeat;
                                mix-blend-mode: overlay;
                                opacity: 0.5;
                                z-index: 0;
                            "></div>
                        @endif
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0 me-3">
                                    <img class="border border-2 border-white rounded-circle"
                                        style="width: 65px; height: 65px; object-fit: cover;"
                                        src="{{ asset('config_media/' . ($logo->nama_file ?? 'default.png')) }}"
                                        alt="Avatar">
                                </div>
                                <div class="flex-grow-1">
                                    <h4 class="mb-0 text-white fw-bold">Grafik Penjualan Marketing</h4>
                                    <p class="mb-0 text-white-50 small">
                                        <i class="bi bi-calendar-event me-1"></i> Per {{ $dateNow }}
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="mt-3 mb-4 row">
                                <div class="col-5">
                                    <select class="form-control select-tahun" name="tahun_2" id="tahun_2">
                                        <option value="0">Semua Tahun</option>
                                        @foreach ($years as $year)
                                            <option value="{{ $year }}"
                                                {{ $year == now()->year ? 'selected' : '' }}>
                                                {{ $year }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-7">
                                    <select class="form-control select-marketing" name="marketing" id="marketing">
                                        <option value="0">Semua Marketing</option>
                                        @foreach ($marketingList as $marketing)
                                            <option value="{{ $marketing->id }}">{{ $marketing->nama_marketing }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <canvas id="lineChart" height="120"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="mb-4 overflow-hidden border-0 shadow-sm card">
                        <div class="p-3 text-white card-header bg-primary">
                             @if($bgHeaderCard ?? null)
                            <div style="
                                position: absolute;
                                top: 0;
                                left: 0;
                                right: 0;
                                bottom: 0;
                                margin: 0;
                                background-image: url('{{ asset('config_media/' . $bgHeaderCard) }}');
                                object-fit: fill;
                                background-position: center;
                                background-repeat: no-repeat;
                                mix-blend-mode: overlay;
                                opacity: 0.5;
                                z-index: 0;
                            "></div>
                        @endif
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0 me-3">
                                    <img class="border border-2 border-white rounded-circle"
                                        style="width: 65px; height: 65px; object-fit: cover;"
                                        src="{{ asset('config_media/' . ($logo->nama_file ?? 'default.png')) }}"
                                        alt="User Avatar">
                                </div>
                                <div class="flex-grow-1">
                                    <h4 class="mb-0 text-white fw-bold">Statistik Status Progres</h4>
                                    <p class="mb-0 text-white-50 small">
                                        <i class="bi bi-calendar-event me-1"></i> Per {{ $dateNow }}
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="p-0 card-body">
                            <div class="table-responsive">
                                <table class="table mb-0 align-middle table-bordered table-striped table-hover">
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
                                        @forelse ($dataProgres as $item)
                                            <tr>
                                                <td class="text-center">{{ $item['no'] }}</td>
                                                <td class="fw-bold">{{ $item['status_progres'] }}</td>
                                                <td class="text-end">{{ $item['jumlah'] }}</td>
                                                <td class="text-end">{{ $item['persentase'] }} %</td>
                                                <td class="text-center">
                                                    <a href="{{ route('dashboard.customer-status-progres-show', $item['id_status_progres']) }}"
                                                        class="px-3 text-white btn btn-primary btn-sm rounded-pill">
                                                        Detail
                                                    </a>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="5" class="py-2 text-center text-muted">
                                                    Belum ada data
                                                </td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="mb-4 overflow-hidden border-0 shadow-sm card">
                        <div class="p-3 text-white card-header bg-success">
                             @if($bgHeaderCard ?? null)
                            <div style="
                                position: absolute;
                                top: 0;
                                left: 0;
                                right: 0;
                                bottom: 0;
                                margin: 0;
                                background-image: url('{{ asset('config_media/' . $bgHeaderCard) }}');
                                object-fit: fill;
                                background-position: center;
                                background-repeat: no-repeat;
                                mix-blend-mode: overlay;
                                opacity: 0.5;
                                z-index: 0;
                            "></div>
                        @endif  
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0 me-3">
                                    <img class="border border-2 border-white rounded-circle"
                                        style="width: 65px; height: 65px; object-fit: cover;"
                                        src="{{ asset('config_media/' . ($logo->nama_file ?? 'default.png')) }}"
                                        alt="User Avatar">
                                </div>

                                <div class="flex-grow-1">
                                    <h4 class="mb-0 text-white fw-bold">Statistik Penjualan Marketing</h4>
                                    <p class="mb-0 text-white-50 small">
                                        <i class="bi bi-calendar-event me-1"></i> Per {{ $dateNow }}
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="p-0 card-body">
                            <div class="table-responsive">
                                <table class="table mb-0 align-middle table-bordered table-striped table-hover">
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
                                        @forelse ($dataMarketing as $marketing)
                                            <tr>
                                                <td class="text-center">{{ $marketing['no'] }}</td>
                                                <td class="fw-bold">{{ $marketing['marketing'] }}</td>
                                                <td class="text-end">{{ $marketing['jumlah'] }}</td>
                                                <td class="text-end">{{ $marketing['persentase'] }} %</td>
                                                <td class="text-center">
                                                    <a href="{{ route('dashboard.customer-marketing-show', $marketing['id_marketing']) }}"
                                                        class="px-3 text-white btn btn-success btn-sm rounded-pill">
                                                        Detail
                                                    </a>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="5" class="py-2 text-center text-muted">
                                                    Belum ada data
                                                </td>
                                            </tr>
                                        @endforelse
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
    <script>
        const months = [
            'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
            'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
        ];

        let barChart;
        let lineChart;

        function loadChart1() {
            $.get("{{ route('dashboard.chart1') }}", {
                tahun: $('#tahun').val()
            }, function(response) {
                if (barChart) barChart.destroy();

                barChart = new Chart(document.getElementById('barChart'), {
                    type: 'bar',
                    data: {
                        labels: months,
                        datasets: [{
                            label: 'Total Penjualan',
                            data: response,
                            backgroundColor: '#435ebe',
                            borderRadius: 6
                        }]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            });
        }

        function loadChart2() {
            $.get("{{ route('dashboard.chart2') }}", {
                tahun: $('#tahun_2').val(),
                marketing: $('#marketing').val()
            }, function(response) {
                if (lineChart) lineChart.destroy();

                lineChart = new Chart(document.getElementById('lineChart'), {
                    type: 'line',
                    data: {
                        labels: months,
                        datasets: [{
                            label: 'Penjualan Marketing',
                            data: response,
                            borderColor: '#198754',
                            backgroundColor: 'rgba(25, 135, 84, 0.2)',
                            fill: true,
                            tension: 0.4,
                            pointRadius: 4
                        }]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            });
        }

        $(document).ready(function() {
            $('.select-tahun').select2({
                dropdownParent: $('body'),
                width: '100%'
            });
            $('.select-marketing').select2({
                dropdownParent: $('body'),
                width: '100%'
            });

            loadChart1();
            loadChart2();

            $('#tahun').on('change', loadChart1);
            $('#tahun_2, #marketing').on('change', loadChart2);
        });
    </script>
@endpush
