@extends('layouts.app')
@section('title', 'Siteplan Penjualan - Teluk Seribu')

@php
    $logo = DB::table('konfigurasi_media')
        ->where('jenis_data', 'logo website')
        ->value('nama_file');
@endphp

@push('styles')
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif !important;
            background: url('{{ asset('config_media/booking-bg.png') }}') no-repeat center center fixed !important;
            background-size: cover !important;
            min-height: 100vh;
        }

        .siteplan-container {
            max-width: 90%;
            margin: 0 auto;
            padding: 30px 15px 50px;
        }

        .siteplan-card {
            border: none;
            border-radius: 16px;
            overflow: hidden;
        }
        .siteplan-body {
            padding: 20px 30px 30px;
        }
        /* SVG Container */
        .svg-card-wrapper {
            border-radius: 12px;
            border: 1px solid #e5e7eb;
            overflow: hidden;
            margin-top: 20px;
            box-shadow: inset 0 2px 4px rgba(0,0,0,0.02);
        }

        .svg-view-container {
            width: 100%;
            height: 90vh;
            min-height: 500px;
            overflow: hidden;
            position: relative;
            background: #f8fafc;
        }

        .svg-view-container svg {
            width: 100%;
            height: 100%;
            cursor: grab;
            transition: transform 0.1s ease-out;
            touch-action: none;
             transform-origin: center center;
            will-change: transform;
            user-select: none;
            -webkit-user-drag: none;
        }

        /* Floating Components */
        .legend-box {
            position: fixed;
            bottom: 30px;
            right: 30px;
            padding: 15px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.15);
            width: 210px;
            z-index: 1000;
            transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            border: 1px solid #e5e7eb;
        }

        .legend-box.hidden {
            transform: translateX(250px);
        }

        .legend-toggle {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 45px;
            height: 45px;
            background: #1e5fa8;
            color: #fff;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            cursor: pointer;
            z-index: 999;
            border: none;
        }

        .legend-title {
            font-weight: 700;
            font-size: 0.85rem;
            color: #111827;
            margin-bottom: 12px;
            padding-bottom: 8px;
            border-bottom: 1px solid #f3f4f6;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 8px;
        }

        .legend-color {
            width: 16px;
            height: 16px;
            border-radius: 4px;
            border: 1px solid rgba(0,0,0,0.1);
            flex-shrink: 0;
        }

        .legend-label {
            font-size: 0.75rem;
            color: #4b5563;
            font-weight: 500;
        }

        /* Popup Box */
        #popupOverlay {
            position: fixed;
            z-index: 9999;
            display: none;
            pointer-events: none;
        }

        #popupBox {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            width: 300px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.3);
            position: relative;
            pointer-events: all;
            border: 1px solid #e5e7eb;
        }

        #popupClose {
            position: absolute;
            top: 10px;
            right: 12px;
            background: #f3f4f6;
            border: none;
            width: 24px;
            height: 24px;
            border-radius: 50%;
            font-size: 16px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #6b7280;
        }

        .popup-title {
            font-weight: 700;
            font-size: 0.95rem;
            color: #1e5fa8;
            margin-bottom: 15px;
        }

        .popup-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            font-size: 0.8rem;
        }

        .popup-label {
            color: #6b7280;
        }

        .popup-value {
            font-weight: 600;
            color: #111827;
            text-align: right;
        }

        .popup-price {
            margin-top: 12px;
            padding-top: 12px;
            border-top: 1px dashed #e5e7eb;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .popup-price .value {
            font-size: 1rem;
            font-weight: 800;
            color: #1e5fa8;
        }

        .btn-reset {
            position: absolute;
            top: 15px;
            left: 15px;
            z-index: 10;
            background: rgba(255,255,255,0.9);
            border: 1px solid #d1d5db;
            border-radius: 6px;
            padding: 6px 12px;
            font-size: 0.75rem;
            font-weight: 600;
            color: #374151;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            transition: all 0.2s;
        }

        .btn-reset:hover {
            background: #fff;
            border-color: #1e5fa8;
            color: #1e5fa8;
        }

        .text-white-svg text {
            fill: #ffffff !important;
        }

        @media (max-width: 768px) {
            .siteplan-container {
                padding: 15px 10px;
            }
            .siteplan-header {
                padding: 20px;
            }
            .siteplan-body {
                padding: 15px;
            }
            .svg-view-container {
                height: 50vh;
            }
            .legend-box {
                bottom: 80px;
                right: 20px;
            }
            .legend-toggle {
                bottom: 20px;
                right: 20px;
            }
        }
        .logo-fixed {
            position: fixed;
            top: 0;
            background: white;
            padding-top: 20px;
            padding-bottom: 20px;
            border-bottom-right-radius: 100%;
            border-bottom-left-radius: 100%;
            height: 90px;
            width: 90px;
            box-shadow: #11182728 0px 3px 0;
            object-fit: contain;
            z-index: 9999;
        }
        .legend-color {
            width: 20px;
            height: 20px;
            border: 1px solid #ccc;
        }
        .kavling-active path,
        .kavling-active polygon {
            stroke: #00e0ff !important;
            stroke-width: 3 !important;
            filter: drop-shadow(0 0 6px rgba(0, 224, 255, 0.8));
        }

        .kavling-active {
            animation: pulseKav 1.5s infinite;
        }

        @keyframes pulseKav {
            0% { filter: brightness(1); }
            50% { filter: brightness(1.3); }
            100% { filter: brightness(1); }
        }
        @keyframes pulseKav {
            0% { filter: brightness(1); }
            50% { filter: brightness(1.3); }
            100% { filter: brightness(1); }
        }
        .popup-arrow {
            position: absolute;
            width: 0;
            height: 0;
        }
        .popup-arrow.arrow-bottom {
            bottom: -10px;
            border-left: 10px solid transparent;
            border-right: 10px solid transparent;
            border-top: 10px solid #fff;
        }
        .popup-arrow.arrow-top {
            top: -10px;
            border-left: 10px solid transparent;
            border-right: 10px solid transparent;
            border-bottom: 10px solid #fff;
        }
        .siteplan-title {
            text-align: center;
            font-size: 1.5rem;
            font-weight: 700;
            position: relative;
            bottom: 20px;
            color: #fff;
            margin-bottom: 20px;
            letter-spacing: 0.5px;
        }
    </style>
@endpush

@section('content')
    <div class="siteplan-container">
        <div class="siteplan-card">
            <div class="siteplan-header">
                <img
                    class="logo-fixed"
                    src="{{ asset('config_media/' . $logo) }}"
                    alt="{{ $namaPerusahaan ?? 'Logo Perusahaan' }}">
            </div>
            <div class="siteplan-body">
               <div class="siteplan-title">
                    {{ $lokasiKavling->first()->nama_kavling ?? '' }}
                </div>

                <div class="tab-content" id="siteplan-tabContent">
                    @foreach ($lokasiKavling as $index => $kav)
                        <div class="tab-pane fade {{ $index == 0 ? 'show active' : '' }}" id="pane-{{ $kav->id }}"
                            role="tabpanel">

                            <div class="svg-card-wrapper">
                                <div class="svg-view-container svg-container" id="svg-container-{{ $kav->id }}">
                                    <button class="btn btn-reset reset-button">
                                        <i class="mr-1 fas fa-sync-alt"></i> Reset Siteplan
                                    </button>

                                    {{-- SVG Render --}}
                                    @if ($kav->masterSvg)
                                        {!! str_replace(['[[lebar]]', '[[tinggi]]'], ['100%', '100%'], $kav->masterSvg->header_svg) !!}

                                        @php
                                            if (!function_exists('adjustBrightness')) {
                                                function adjustBrightness($hex, $steps) {
                                                    $steps = max(-255, min(255, $steps));

                                                    $hex = str_replace('#', '', $hex);

                                                    $r = hexdec(substr($hex, 0, 2));
                                                    $g = hexdec(substr($hex, 2, 2));
                                                    $b = hexdec(substr($hex, 4, 2));

                                                    $r = max(0, min(255, $r + $steps));
                                                    $g = max(0, min(255, $g + $steps));
                                                    $b = max(0, min(255, $b + $steps));

                                                    return '#' .
                                                        str_pad(dechex($r), 2, '0', STR_PAD_LEFT) .
                                                        str_pad(dechex($g), 2, '0', STR_PAD_LEFT) .
                                                        str_pad(dechex($b), 2, '0', STR_PAD_LEFT);
                                                }
                                            }
                                        @endphp

                                        @foreach ($kav->kavlingPeta as $pt)

                                            @php
                                                $warna = '#ffffff';

                                                $customer = $pt->customer->first();

                                                if ($customer) {

                                                    $isLunas = $customer->piutangs->where('sisa_bayar', 0)->count() > 0;

                                                    if ($isLunas) {
                                                        $warna = '#3b3b3b'; // SOLD
                                                    }

                                                    elseif ($customer->id_status_progres == 1) {
                                                        $warna = '#919191'; // BOOKING
                                                    }
                                                }

                                                if ($warna === '#ffffff') {

                                                    preg_match('/^[A-Z]+/', $pt->kode_kavling, $match);
                                                    $blok = $match[0] ?? 'X';

                                                    $palette = [
                                                        '#e5e52a',
                                                        '#b39ddb',
                                                        '#e53935',
                                                        '#2ecc71',
                                                        '#2e6da4',
                                                        '#f97316',
                                                    ];

                                                    $blokIndex = ord($blok[0]) - ord('A');

                                                    $baseColor = $palette[$blokIndex % count($palette)];

                                                    $urutan = intval(preg_replace('/[^0-9]/', '', $pt->kode_kavling));

                                                    $shade = floor(($urutan - 1) / 8) % 2;

                                                    if ($shade == 1) {
                                                        $warna = adjustBrightness($baseColor, 0);
                                                    } else {
                                                        $warna = $baseColor;
                                                    }
                                                }
                                            @endphp

                                            <a href="javascript:void(0);"
                                                class="detail-button
                                                {{ $pt->siteplan_text_color === '#ffffff' ? 'text-white-svg' : '' }}
                                                {{ $warna === '#ffffff' ? 'kavling-white' : '' }}"
                                                data-url="{{ route('public.siteplan.show', $pt->id) }}">

                                                {!! str_replace(
                                                    ['[[1]]', '[[2]]', '[[3]]', '[[4]]'],
                                                    [$pt->map, $warna, $pt->matrik, $pt->kode_kavling],
                                                    $pt->jenis_map == 'polygon'
                                                        ? $kav->masterSvg->polygon_svg
                                                        : $kav->masterSvg->path_svg,
                                                ) !!}

                                            </a>

                                        @endforeach

                                        {!! $kav->masterSvg->footer_svg !!}
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>

    {{-- Legend --}}
    <button class="legend-toggle" onclick="toggleLegend()">
        <i class="fas fa-info-circle"></i>
    </button>
    <div class="hidden legend-box" id="legendBox">
    <div class="legend-title">Keterangan Status</div>

         <div class="legend-item">
            <div class="legend-color" style="background-color: #ffffff;"></div>
            <div class="legend-label">Ready</div>
        </div>

        <div class="legend-item">
            <div class="legend-color" style="background-color: #919191;"></div>
            <div class="legend-label">Booking Fee</div>
        </div>

        <div class="legend-item">
            <div class="legend-color" style="background-color: #3b3b3b;"></div>
            <div class="legend-label">Terjual</div>
        </div>

        <button class="mt-3 btn btn-xs btn-block text-muted" onclick="toggleLegend()">Tutup</button>
    </div>

    {{-- Detail Popup --}}
<div id="popupOverlay">
    <div id="popupBox">
        <div class="popup-arrow"></div>
        <button id="popupClose" onclick="closePopup()">&times;</button>

        <div class="popup-title">Detail Kavling</div>

        <div class="popup-row">
            <span class="popup-label">Perumahan</span>
            <span class="popup-value" id="p_nama_kavling">-</span>
        </div>
        <div class="popup-row">
            <span class="popup-label">Kode Kavling</span>
            <span class="popup-value" id="p_kode_kavling">-</span>
        </div>
        <div class="popup-row">
            <span class="popup-label">Tipe</span>
            <span class="popup-value" id="p_tipe_bangunan">-</span>
        </div>
        <div class="popup-row">
            <span class="popup-label">Luas Tanah</span>
            <span class="popup-value"><span id="p_luas_tanah">-</span> m²</span>
        </div>
        <div class="popup-row">
            <span class="popup-label">Luas Bangunan</span>
            <span class="popup-value"><span id="p_luas_bangunan">-</span> m²</span>
        </div>

        <div class="popup-price">
            <span class="popup-label font-weight-bold">Harga Jual</span>
            <span class="value">Rp <span id="p_hrg_jual">0</span></span>
        </div>

        {{-- Sold badge, tersembunyi secara default --}}
        <div id="mark_sold_container" style="display:none; margin-top:12px; text-align:center;">
            <span class="px-3 py-2 badge badge-danger" style="font-size:0.85rem;">
                Kavling Sudah Terjual
            </span>
        </div>
    </div>
</div>
@endsection

@push('scripts')
    <script>
         let currentTargetElement = null;
        let popupUpdateInterval = null;

        function toggleLegend() {
            $('#legendBox').toggleClass('hidden');
        }

        function updatePopupPosition() {
            if (!currentTargetElement || !$('#popupOverlay').is(':visible')) return;

            const targetRect = currentTargetElement.getBoundingClientRect();
            const popupBox = document.getElementById('popupBox');
            const popupWidth = popupBox.offsetWidth;
            const popupHeight = popupBox.offsetHeight;
            const arrow = $('.popup-arrow');

            const targetCenterX = targetRect.left + (targetRect.width / 2);
            const targetCenterY = targetRect.top + (targetRect.height / 2);

            let left = targetCenterX - (popupWidth / 2);
            let top = targetCenterY - popupHeight - 15;

            const margin = 15;
            const winW = $(window).width();
            const winH = $(window).height();

            // Clamp horizontal position
            if (left < margin) left = margin;
            else if (left + popupWidth > winW - margin) left = winW - popupWidth - margin;

            // Calculate arrow offset so it points to the target center
            let arrowLeft = targetCenterX - left;
            arrowLeft = Math.max(20, Math.min(arrowLeft, popupWidth - 20));

            if (top < margin) {
                // Show popup below the target, arrow on top
                top = targetCenterY + 15;
                arrow.removeClass('arrow-bottom').addClass('arrow-top');
            } else {
                // Show popup above the target, arrow on bottom
                arrow.removeClass('arrow-top').addClass('arrow-bottom');
            }

            arrow.css({ left: arrowLeft + 'px', transform: 'translateX(-50%)' });
            $('#popupOverlay').css({ left: left + 'px', top: top + 'px' });
        }


        $(document).on('click', '.detail-button', function (e) {
            e.preventDefault();
            e.stopPropagation();

            // Hapus highlight sebelumnya, tambah ke yang diklik
            $('.detail-button.kavling-active').removeClass('kavling-active');
            $(this).addClass('kavling-active');

            let url = $(this).data('url');
            currentTargetElement = this;

            $.get(url, function (res) {
                if (!res.success) return;

                const d = res.data;

                $('#p_nama_kavling').text(d.lokasi.nama_kavling);
                $('#p_kode_kavling').text(d.kode_kavling);
                $('#p_tipe_bangunan').text(d.tipe_bangunan);
                $('#p_luas_tanah').text(d.luas_tanah);
                $('#p_luas_bangunan').text(d.luas_bangunan);

                const harga = parseFloat(d.hrg_jual || 0);
                $('#p_hrg_jual').text(harga.toLocaleString('id-ID'));

                // Tampilkan badge terjual jika status == 2
                if (parseInt(d.status) === 2) {
                    $('#mark_sold_container').show();
                    $('.popup-price').hide();
                } else {
                    $('#mark_sold_container').hide();
                    $('.popup-price').show();
                }

                $('#popupOverlay').css('display', 'block').fadeIn(200, function () {
                    updatePopupPosition();
                });

                if (popupUpdateInterval) clearInterval(popupUpdateInterval);
                popupUpdateInterval = setInterval(updatePopupPosition, 50);

            }).fail(function () {
                alert('Gagal memuat data kavling. Silakan coba lagi.');
            });
        });

        function closePopup() {
            $('#popupOverlay').fadeOut(200);
            // Remove kavling highlight
            $('.detail-button.kavling-active').removeClass('kavling-active');
            currentTargetElement = null;
            if (popupUpdateInterval) clearInterval(popupUpdateInterval);
        }

        $(document).on('click', function(e) {
            if ($(e.target).closest('#popupBox').length === 0 && !$(e.target).hasClass('detail-button')) {
                closePopup();
            }
        });

        $(window).on('resize scroll', updatePopupPosition);
        $('a[data-toggle="pill"]').on('shown.bs.tab', closePopup);

        // Auto-update position on SVG zoom/pan
        if (window.MutationObserver) {
            const observer = new MutationObserver(() => {
                if ($('#popupOverlay').is(':visible')) updatePopupPosition();
            });
            $(document).ready(() => {
                $('svg').each(function() {
                    observer.observe(this, { attributes: true, attributeFilter: ['transform', 'style'] });
                });
            });
        }

    </script>
    <script id="pinchZoomSvg">
        document.querySelectorAll('.svg-container').forEach(container => {
            const svg = container.querySelector('svg');
            if (!svg) return;

            let scale = 1;
            let translateX = 0;
            let translateY = 0;

            let startDistance = 0;
            let isPinching = false;
            let isDragging = false;

            let lastTouchX = 0;
            let lastTouchY = 0;

            function getDistance(touches) {
                const dx = touches[0].clientX - touches[1].clientX;
                const dy = touches[0].clientY - touches[1].clientY;
                return Math.sqrt(dx * dx + dy * dy);
            }

            function updateTransform() {
                svg.style.transform = `translate(${translateX}px, ${translateY}px) scale(${scale})`;
            }

            container.addEventListener('touchstart', function(e) {
                if (e.touches.length === 2) {
                    isPinching = true;
                    startDistance = getDistance(e.touches);
                } else if (e.touches.length === 1 && scale > 1) {
                    isDragging = true;
                    lastTouchX = e.touches[0].clientX;
                    lastTouchY = e.touches[0].clientY;
                }
            }, { passive: false });

            container.addEventListener('touchmove', function(e) {
                if (isPinching && e.touches.length === 2) {
                    e.preventDefault();

                    const newDistance = getDistance(e.touches);
                    const zoomFactor = newDistance / startDistance;

                    let newScale = scale * zoomFactor;
                    newScale = Math.max(0.5, Math.min(newScale, 5));

                    scale = newScale;
                    startDistance = newDistance;

                    updateTransform();
                }

                else if (isDragging && e.touches.length === 1) {
                    e.preventDefault();

                    const touch = e.touches[0];
                    const dx = touch.clientX - lastTouchX;
                    const dy = touch.clientY - lastTouchY;

                    translateX += dx;
                    translateY += dy;

                    lastTouchX = touch.clientX;
                    lastTouchY = touch.clientY;

                    updateTransform();
                }

            }, { passive: false });

            container.addEventListener('touchend', function() {
                isPinching = false;
                isDragging = false;
            });
        });
        </script>
    <script src="{{ asset('assets/svg_1.js') }}"></script>
@endpush
