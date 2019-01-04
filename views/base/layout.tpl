<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>{{ .website_title }}</title>
    <link rel="shortcut icon" href="{{ .favicon_icon }}" />
    <meta name="description" content="{{ .description }}" />
    <meta name="keywords" content="{{ .keywords }}" />
    <meta name="author" content="吴先生的博客,304550409@qq.com">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta http-equiv="Cache-Control" content="no-transform" />
    <link rel="dns-prefetch" href="http://apps.bdimg.com" />
    <meta http-equiv="X-UA-Compatible" content="IE=11,IE=10,IE=9,IE=8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0" />
    <meta name="apple-mobile-web-app-title" content="{{ .website_title }}" />
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/css/animate.min.css" rel="stylesheet" />
    <link href="/static/css/main.css" rel="stylesheet" />
    <link href="/static/lib/iconfonts/mdi/css/materialdesignicons.min.css" rel="stylesheet" />
    {{ .Header }}
</head>
<body class="home blog nav_fixed list-comments-r site-layout-2">
<header class="header">
    <div class="container">
        <h1 class="logo animated rotateIn"> <a href="/" title="{{ .title }}"> {{ .title }} </a> </h1>
        <ul class="site-nav site-navbar">
            <li id="menu-item-0" class="menu-item menu-item-object-custom  menu-item-type-taxonomy menu-item-0 {{ if not .category_id  }} current-menu-item {{ end }}" >
                <a  href="/"><i class="fa fa-home"></i>首页</a>
            </li>
            {{ range $index,$val := .categorys }}
            <li id="menu-item-{{ $index }}" class="menu-item menu-item-object-custom  menu-item-type-taxonomy {{ if $val.Active}}  current-menu-item {{ end }} menu-item-{{ $index }} ">
                <a  href="/category/{{ $val.Id }}">
                    <i class="{{ $val.Icon }}"></i> {{ $val.Name }} {{ if gt ($val.Child | len) 0 }} <i class="fa fa-angle-down"></i> {{ end }}
                </a>
                {{ if gt ($val.Child | len) 0 }}
                <ul class="sub-menu">
                    {{ range $k,$v := $val.Child }}
                    <li id="menu-item-{{ $v.Id }}" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-home menu-item-{{ $v.Id }}  {{ if $.category_id }}  {{ if  eq $.category_id  $v.Id }} current-menu-item  {{ end }}{{ end }}">
                        <a  href="/category/{{ $v.Id }}">{{ $v.Name }}</a>
                    </li>
                    {{ end }}
                </ul>
                {{ end }}
            </li>
            {{ end }}
            <li id="menu-item-999" class="menu-item menu-item-object-custom  menu-item-type-taxonomy  {{ if $.category_id }}  {{ if  eq $.category_id  999 }} current-menu-item  {{ end }}{{ end }}">
                <a href="/news">
                    <i class="mdi mdi-package-down"></i> 资讯
                </a>
            </li>
            <li class="navto-search">
                <a href="javascript:;" class="search-show active"><i class="fa fa-search"></i></a>
            </li>
        </ul>
        <i class="fa fa-bars m-icon-nav"></i>
    </div>
</header>
<div class="site-search">
    <div class="container">
        <form method="get" class="site-search-form" action="/">
            <input class="search-input" name="wd" type="text" placeholder="输入关键字" value="" />
            <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
        </form>
    </div>
</div>
<section class="container animated fadeIn">
    {{.LayoutContent}}
    {{.SideBar}}
</section>
<footer class="footer">
    <div class="container">
        <p> <a href="#" target="_blank">吴先生的博客</a> | <a href="https://github.com/woann/yamecent-admin" target="_blank">yamecent-admin</a> | <a href="https://github.com/woann/Light-php" target="_blank">Light-php</a> </p>
        <p> <a href="#">吴先生的博客</a> 2018 &copy; <a href="#"> woann.cn</a> Powered by 吴先生的博客(Golang) | <a href="http://www.miitbeian.gov.cn">辽ICP备17016318号</a> </p>
        <p> 本站已稳定运行 <strong id="htmer_time" style="color: blue"></strong></p>
    </div>
</footer>
<script>
    window.jsui={
    };
</script>
<script src="https://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="https://apps.bdimg.com/libs/bootstrap/3.2.0/js/bootstrap.min.js?ver=5.1"></script>
<script src="/static/js/loader.js"></script>
<script src="/static/js/main.js"></script>
<script>
    function secondToDate(second) {
        if (!second) {
            return 0
        }
        var time = new Array(0, 0, 0, 0, 0);
        if (second >= 365 * 24 * 3600) {
            time[0] = parseInt(second / (365 * 24 * 3600));
            second %= 365 * 24 * 3600
        }
        if (second >= 24 * 3600) {
            time[1] = parseInt(second / (24 * 3600));
            second %= 24 * 3600
        }
        if (second >= 3600) {
            time[2] = parseInt(second / 3600);
            second %= 3600
        }
        if (second >= 60) {
            time[3] = parseInt(second / 60);
            second %= 60
        }
        if (second > 0) {
            time[4] = second
        }
        return time
    }
    function setTime() {
        var create_time = Math.round(new Date(Date.UTC(2018, 11, 19, 0, 0, 0)).getTime() / 1000);
        var timestamp = Math.round((new Date().getTime() + 8 * 60 * 60 * 1000) / 1000);
        currentTime = secondToDate((timestamp - create_time));
        currentTimeHtml = "";
        if (currentTime[0] > 0) {
            currentTimeHtml += currentTime[0] + "年"
        }
        if (currentTime[1] > 0) {
            currentTimeHtml += currentTime[1] + "天"
        }
        if (currentTime[2] > 0) {
            currentTimeHtml += currentTime[2] + "时"
        }
        if (currentTime[3] > 0) {
            currentTimeHtml += currentTime[3] + "分"
        }
        currentTimeHtml += currentTime[4] + "秒";
        document.getElementById("htmer_time").innerHTML = currentTimeHtml
    };
    setInterval(setTime, 1000);
    function IsPC() {
        var userAgentInfo = navigator.userAgent;
        var Agents = ["Android", "iPhone",
            "SymbianOS", "Windows Phone",
            "iPad", "iPod"];
        var flag = true;
        for (var v = 0; v < Agents.length; v++) {
            if (userAgentInfo.indexOf(Agents[v]) > 0) {
                flag = false;
                break;
            }
        }
        return flag;
    }
    function includeJs(filename) {
        var head = document.getElementsByTagName('head')[0];
        var script = document.createElement('script');
        script.src = filename;
        script.type = 'text/javascript';
        script.setAttribute("opacity", "0.7");
        script.setAttribute("zindex", "-2");
        script.setAttribute("count", "150");
        head.appendChild(script)
    }
    if (IsPC()) {
        includeJs("https://cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js")
    }else {
        $('.footer').css('z-index','-1');
    }
</script>
{{ .Script }}
</body>
</html>