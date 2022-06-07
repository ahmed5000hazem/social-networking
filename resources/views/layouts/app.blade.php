<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Scripts -->
    

    <!-- Fonts -->

    <!-- Styles -->
    <link rel="icon" href="images/fav.png" type="image/png" sizes="16x16"> 
    
    <link rel="stylesheet" href="{{url("css/main.min.css")}}">
    <link rel="stylesheet" href="{{url("css/style.css")}}">
    <link rel="stylesheet" href="{{url("css/color.css")}}">
    <link rel="stylesheet" href="{{url("css/responsive.css")}}">
    <link rel="stylesheet" href="{{url("css/custom.css")}}">
</head>
<body>

    @yield('content')
    <script src="js/main.min.js"></script>
	<script src="js/script.js"></script>
</body>
</html>
