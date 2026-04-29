<!DOCTYPE html>
<html lang="id">
@php
    use Illuminate\Support\Facades\DB;

    $namaPerusahaan = DB::table('konfigurasi')->value('nama_perusahaan');

    $favicon = DB::table('konfigurasi_media')
        ->where('jenis_data', 'fav icon')
        ->value('nama_file');

    $logo = DB::table('konfigurasi_media')
        ->where('jenis_data', 'logo website')
        ->value('nama_file');

    $backgroundLogin = DB::table('konfigurasi_media')
        ->where('jenis_data', 'background login')
        ->value('nama_file');
@endphp

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ $namaPerusahaan ?? 'BK Land' }} - Login</title>
    <link rel="shortcut icon" href="{{ asset('config_media/' . ($favicon ?? 'default-fav.png')) }}" type="image/x-icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Barlow:wght@400;500;600;700;800&family=Barlow+Condensed:wght@600;700;800&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('template/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css') }}">

    <style>
        *, *::before, *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        :root {
            --orange: #E8490F;
            --blue: #1A3B8B;
            --blue-light: #2D5FD4;
            --white: #FFFFFF;
            --gray-50: #F8F9FB;
            --gray-200: #E2E6ED;
            --gray-500: #8A93A3;
            --gray-700: #3D4557;
            --shadow: 0 24px 64px rgba(26, 59, 139, 0.18);
            --danger: #D92D20;
        }

        html,
        body {
            min-height: 100%;
            font-family: 'Barlow', sans-serif;
            background: var(--gray-50);
            color: var(--gray-700);
        }

        .page {
            display: grid;
            grid-template-columns: minmax(0, 1fr) 480px;
            min-height: 100vh;
        }

        .hero {
            position: relative;
            overflow: hidden;
            background: #0d1a35;
        }

        .hero-bg {
            position: absolute;
            inset: 0;
            background-image:
                linear-gradient(135deg, rgba(13, 26, 53, 0.78), rgba(26, 59, 139, 0.52)),
                url('{{ $backgroundLogin ? asset('config_media/' . $backgroundLogin) : asset('assets/img/bageee.webp') . '?v=1.0' }}');
            background-size: cover;
            background-position: center;
            opacity: 0.96;
            transform: scale(1.04);
            animation: slowZoom 18s ease-in-out infinite alternate;
        }

        @keyframes slowZoom {
            to {
                transform: scale(1);
            }
        }

        .hero::before {
            content: '';
            position: absolute;
            bottom: -80px;
            right: -80px;
            width: 340px;
            height: 340px;
            background: var(--orange);
            opacity: 0.12;
            border-radius: 50%;
            filter: blur(60px);
        }

        .hero::after {
            content: '';
            position: absolute;
            top: -60px;
            left: -60px;
            width: 280px;
            height: 280px;
            background: var(--blue-light);
            opacity: 0.15;
            border-radius: 50%;
            filter: blur(70px);
        }

        .hero-content {
            position: relative;
            z-index: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
            padding: 52px 56px;
        }

        .hero-logo {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .hero-logo img,
        .card-logo img {
            display: block;
            object-fit: contain;
        }

        .hero-logo img {
            width: 56px;
            height: 56px;
        }

        .hero-logo-mark,
        .card-logo-mark {
            flex-shrink: 0;
        }

        .hero-logo-mark svg {
            width: 52px;
            height: 52px;
        }

        .hero-logo-text,
        .card-logo-text {
            font-family: 'Barlow Condensed', sans-serif;
            font-weight: 800;
            letter-spacing: 0.04em;
            text-transform: uppercase;
        }

        .hero-logo-text {
            font-size: 2rem;
            color: var(--white);
        }

        .hero-logo-text span,
        .card-logo-text span {
            color: var(--orange);
        }

        .hero-body {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .hero-tag {
            display: inline-block;
            width: fit-content;
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 0.18em;
            text-transform: uppercase;
            color: var(--orange);
            background: rgba(232, 73, 15, 0.15);
            border: 1px solid rgba(232, 73, 15, 0.35);
            padding: 5px 14px;
            border-radius: 2px;
            margin-bottom: 28px;
        }

        .hero-headline {
            font-family: 'Barlow Condensed', sans-serif;
            font-size: clamp(2.6rem, 4vw, 3.6rem);
            font-weight: 800;
            line-height: 1.05;
            color: var(--white);
            text-transform: uppercase;
            letter-spacing: 0.01em;
        }

        .hero-headline em {
            font-style: normal;
            color: var(--orange);
        }

        .hero-sub {
            margin-top: 20px;
            font-size: 1rem;
            color: rgba(255, 255, 255, 0.66);
            line-height: 1.65;
            max-width: 420px;
        }

        .hero-pattern {
            display: flex;
            gap: 6px;
            margin-top: 52px;
        }

        .tri {
            width: 0;
            height: 0;
            border-left: 18px solid transparent;
            border-right: 18px solid transparent;
        }

        .tri-up {
            border-bottom: 31px solid;
        }

        .tri-down {
            border-top: 31px solid;
        }

        .hero-stats {
            display: flex;
            gap: 40px;
            padding-top: 40px;
            border-top: 1px solid rgba(255, 255, 255, 0.12);
        }

        .stat-num {
            font-family: 'Barlow Condensed', sans-serif;
            font-size: 2rem;
            font-weight: 800;
            color: var(--white);
        }

        .stat-num span {
            color: var(--orange);
        }

        .stat-lbl {
            font-size: 0.78rem;
            font-weight: 600;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: rgba(255, 255, 255, 0.46);
            margin-top: 2px;
        }

        .panel {
            background: var(--gray-50);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 64px 52px;
            position: relative;
        }

        .panel::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 120px;
            height: 120px;
            background: linear-gradient(135deg, var(--orange) 0%, transparent 70%);
            opacity: 0.12;
            clip-path: polygon(100% 0, 0 0, 100% 100%);
        }

        .card {
            width: 100%;
            max-width: 380px;
            animation: slideUp 0.55s cubic-bezier(.22, 1, .36, 1) both;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(28px);
            }

            to {
                opacity: 1;
                transform: none;
            }
        }

        .card-logo {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 36px;
        }

        .card-logo img {
            width: 40px;
            height: 40px;
        }

        .card-logo-mark svg {
            width: 38px;
            height: 38px;
        }

        .card-logo-text {
            font-size: 1.45rem;
            color: var(--blue);
        }

        .card-title {
            font-family: 'Barlow Condensed', sans-serif;
            font-size: 2rem;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.02em;
            color: var(--gray-700);
            line-height: 1.1;
        }

        .card-sub {
            font-size: 0.88rem;
            color: var(--gray-500);
            margin-top: 6px;
            margin-bottom: 36px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 0.78rem;
            font-weight: 700;
            letter-spacing: 0.09em;
            text-transform: uppercase;
            color: var(--gray-700);
            margin-bottom: 8px;
        }

        .input-wrap {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray-500);
            pointer-events: none;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 13px 14px 13px 42px;
            border: 1.5px solid var(--gray-200);
            border-radius: 6px;
            font-family: 'Barlow', sans-serif;
            font-size: 0.95rem;
            color: var(--gray-700);
            background: var(--white);
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s, background-color 0.2s;
        }

        input:focus {
            border-color: var(--blue-light);
            box-shadow: 0 0 0 3px rgba(45, 95, 212, 0.12);
        }

        input::placeholder {
            color: var(--gray-500);
        }

        input.is-invalid {
            border-color: var(--danger);
            box-shadow: 0 0 0 3px rgba(217, 45, 32, 0.12);
        }

        .invalid-feedback {
            display: block;
            margin-top: 8px;
            font-size: 0.82rem;
            color: var(--danger);
        }

        .row-between {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 28px;
            margin-top: -4px;
            gap: 16px;
        }

        .check-label {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.84rem;
            color: var(--gray-500);
            cursor: pointer;
            text-transform: none;
            letter-spacing: 0;
            font-weight: 500;
            margin-bottom: 0;
        }

        input[type="checkbox"] {
            accent-color: var(--blue);
            width: 16px;
            height: 16px;
        }

        .link {
            font-size: 0.84rem;
            color: var(--blue-light);
            font-weight: 600;
            text-decoration: none;
            transition: color 0.2s;
        }

        .link:hover {
            color: var(--orange);
        }

        .btn-login {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 6px;
            font-family: 'Barlow Condensed', sans-serif;
            font-size: 1.05rem;
            font-weight: 700;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            background: var(--blue);
            color: var(--white);
            transition: background 0.25s, transform 0.15s, opacity 0.2s;
        }

        .btn-login::before {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(90deg, transparent 0%, rgba(232, 73, 15, 0.35) 100%);
            opacity: 0;
            transition: opacity 0.3s;
        }

        .btn-login:hover {
            background: #162f75;
            transform: translateY(-1px);
        }

        .btn-login:hover::before {
            opacity: 1;
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .btn-login:disabled {
            cursor: not-allowed;
            opacity: 0.9;
            transform: none;
        }

        .btn-content {
            position: relative;
            z-index: 1;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .spinner {
            width: 16px;
            height: 16px;
            border: 2px solid rgba(255, 255, 255, 0.35);
            border-top-color: #fff;
            border-radius: 50%;
            animation: spin 0.7s linear infinite;
        }

        .spinner.d-none {
            display: none;
        }

        @keyframes spin {
            to {
                transform: rotate(360deg);
            }
        }

        .accent-bar {
            height: 3px;
            background: linear-gradient(90deg, var(--blue) 0%, var(--orange) 100%);
            border-radius: 2px;
            margin-top: 6px;
        }

        .footer-text {
            text-align: center;
            font-size: 0.82rem;
            color: var(--gray-500);
            margin-top: 24px;
        }

        .copyright {
            position: absolute;
            bottom: 24px;
            font-size: 0.72rem;
            color: var(--gray-500);
            letter-spacing: 0.05em;
            text-align: center;
        }

        @media (max-width: 900px) {
            .page {
                grid-template-columns: 1fr;
            }

            .hero {
                display: none;
            }

            .panel {
                background: var(--white);
                padding: 40px 24px 72px;
            }

            .copyright {
                left: 24px;
                right: 24px;
            }
        }

        @media (max-width: 420px) {
            .card-title {
                font-size: 1.7rem;
            }

            .row-between {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</head>

<body>
    <div class="page">
        <div class="hero">
            <div class="hero-bg"></div>
            <div class="hero-content">
                <div class="hero-logo">
                    @if ($logo)
                        <img src="{{ asset('config_media/' . $logo) }}" alt="{{ $namaPerusahaan ?? 'Logo Perusahaan' }}">
                    @else
                        <div class="hero-logo-mark">
                            <svg viewBox="0 0 52 52" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <polygon points="26,4 46,16 46,22 26,10" fill="#E8490F" />
                                <polygon points="26,4 6,16 6,22 26,10" fill="#1A3B8B" />
                                <polygon points="6,22 26,34 26,28 6,28" fill="#2D5FD4" />
                                <polygon points="46,22 26,34 26,28 46,28" fill="#E8490F" opacity=".7" />
                                <polygon points="6,28 26,40 46,28 46,34 26,46 6,34" fill="#1A3B8B" />
                            </svg>
                        </div>
                    @endif
                    <div class="hero-logo-text">{{ $namaPerusahaan ?? 'BK' }} <span>Land</span></div>
                </div>

                <div class="hero-body">
                    <div class="hero-tag">Portal Manajemen Properti</div>
                    <h1 class="hero-headline">
                        Bangun Masa<br>Depan<br><em>Bersama Kami</em>
                    </h1>
                    <p class="hero-sub">
                        Platform terpadu untuk memantau penjualan<br>
                        kavling Teluk Seribu secara real-time.
                    </p>

                    <div class="hero-pattern">
                        <div class="tri tri-up" style="border-bottom-color: var(--orange)"></div>
                        <div class="tri tri-down" style="border-top-color: var(--blue-light)"></div>
                        <div class="tri tri-up" style="border-bottom-color: rgba(255, 255, 255, .2)"></div>
                        <div class="tri tri-down" style="border-top-color: var(--orange); opacity: .5"></div>
                        <div class="tri tri-up" style="border-bottom-color: var(--blue-light); opacity: .6"></div>
                        <div class="tri tri-down" style="border-top-color: rgba(255, 255, 255, .15)"></div>
                    </div>
                </div>

                <div class="hero-stats">
                    <div>
                        <div class="stat-num">312<span></span></div>
                        <div class="stat-lbl">Total Kavling</div>
                    </div>
                    {{-- <div>
                        <div class="stat-num">48<span></span></div>
                        <div class="stat-lbl">Kavling Terjual</div>
                    </div>
                    <div>
                        <div class="stat-num"><span>15</span></div>
                        <div class="stat-lbl">Kavling Ready</div>
                    </div> --}}
                </div>
            </div>
        </div>

        <div class="panel">
            <div class="card">
                <div class="card-logo">
                    @if ($logo)
                        <img src="{{ asset('config_media/' . $logo) }}" alt="{{ $namaPerusahaan ?? 'Logo Perusahaan' }}">
                    @else
                        <div class="card-logo-mark">
                            <svg viewBox="0 0 38 38" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <polygon points="19,2 35,11 35,16 19,7" fill="#E8490F" />
                                <polygon points="19,2 3,11 3,16 19,7" fill="#1A3B8B" />
                                <polygon points="3,16 19,25 19,20 3,20" fill="#2D5FD4" />
                                <polygon points="35,16 19,25 19,20 35,20" fill="#E8490F" opacity=".7" />
                                <polygon points="3,20 19,29 35,20 35,25 19,34 3,25" fill="#1A3B8B" />
                            </svg>
                        </div>
                    @endif
                    <div class="card-logo-text">{{ $namaPerusahaan ?? 'BK' }} <span>Land</span></div>
                </div>

                <h2 class="card-title">Selamat<br>Datang Kembali</h2>
                <p class="card-sub">Masuk ke akun Anda untuk melanjutkan</p>

                <form id="formLogin">
                    @csrf
                    <div class="form-group">
                        <label for="username">Email / Username</label>
                        <div class="input-wrap">
                            <svg class="input-icon" width="16" height="16" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
                                <circle cx="12" cy="7" r="4" />
                            </svg>
                            <input type="text" id="username" name="username" placeholder="Masukkan username"
                                autocomplete="username">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <div class="input-wrap">
                            <svg class="input-icon" width="16" height="16" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="3" y="11" width="18" height="11" rx="2" ry="2" />
                                <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                            </svg>
                            <input type="password" id="password" name="password" placeholder="Masukkan password"
                                autocomplete="current-password">
                        </div>
                    </div>

                    <button type="submit" id="submitBtn" class="btn-login">
                        <span class="btn-content">
                            <span class="spinner d-none" aria-hidden="true"></span>
                            <span class="button-text">Masuk ke Sistem</span>
                        </span>
                    </button>
                    <div class="accent-bar"></div>
                </form>

                <p class="footer-text">
                    Belum punya akun? Hubungi Admin
                </p>
            </div>

            <div class="copyright">&copy; {{ date('Y') }} {{ $namaPerusahaan ?? 'BK Land' }}. All rights reserved.</div>
        </div>
    </div>

    <script src="{{ asset('template/plugins/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('template/plugins/sweetalert2/sweetalert2.min.js') }}"></script>
    <script src="{{ asset('template/plugins/toastr/toastr.min.js') }}"></script>

    <script>
        var audio = new Audio('{{ asset('audio/notification.ogg') }}');

        $(document).ready(function() {
            function refreshCsrfToken(callback) {
                $.get('{{ route('refresh.csrf') }}', function(data) {
                    $('meta[name="csrf-token"]').attr('content', data.token);
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': data.token
                        }
                    });

                    if (typeof callback === 'function') {
                        callback();
                    }
                });
            }

            $('#formLogin').on('submit', function(e) {
                e.preventDefault();

                let form = this;

                refreshCsrfToken(function() {
                    let url = '{{ route('admin.loginPost') }}';
                    let formData = new FormData(form);

                    $('.is-invalid').removeClass('is-invalid');
                    $('.invalid-feedback').remove();

                    let submitBtn = $('#submitBtn');
                    let spinner = submitBtn.find('.spinner');
                    let btnText = submitBtn.find('.button-text');

                    spinner.removeClass('d-none');
                    btnText.text('Masuk...');
                    submitBtn.prop('disabled', true);

                    $.ajax({
                        url: url,
                        method: 'POST',
                        data: formData,
                        contentType: false,
                        processData: false,
                        success: function() {
                            window.location.href = "{{ route('beranda') }}";
                        },
                        error: function(xhr) {
                            if (xhr.status === 422) {
                                audio.play();
                                let errors = xhr.responseJSON.errors;

                                $.each(errors, function(key, val) {
                                    let input = $('#' + key);
                                    input.addClass('is-invalid');
                                    input.closest('.input-wrap').after(
                                        '<span class="invalid-feedback" role="alert"><strong>' +
                                        val[0] + '</strong></span>'
                                    );
                                });
                            } else {
                                alert('Terjadi kesalahan pada server. Silakan coba lagi.');
                            }
                        },
                        complete: function() {
                            spinner.addClass('d-none');
                            btnText.text('Masuk ke Sistem');
                            submitBtn.prop('disabled', false);
                        }
                    });
                });
            });
        });
    </script>
</body>

</html>
