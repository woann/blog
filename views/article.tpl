<div class="content-wrap">
    <div class="content single">
        <header class="article-header">
            <h1 class="article-title">
                <a href="/article/{{ .article.Id }}"> {{ .article.Title }} </a>
            </h1>
            <div class="article-meta">
                <span class="item">{{ .article.CreatedAt }}</span>
                <span class="item">分类：
                <a href="/category/{{ .article.Category.Id }}" rel="category tag">{{ .article.Category.Name }}</a>
            </span>
                <span class="item post-views">阅读({{ .article.View }})</span>
            </div>
        </header>
        <div class="article-tags">
            标签：
            {{ range $key,$val := .article.TagSlice }}
            <a class="tag" target="_black" style="background:#{{ index $val "color" }}" title="{{ index $val "name" }}" href="/tag?name={{ index $val "name" }}&color={{ index $val "color" }}" rel="tag">{{ index $val "name" }}</a>
            {{ end }}
        </div>
        <article class="article-content" id="test-editormd-view">
            <textarea id="test-editormd-view2" style="display:none;">{{ .article.Content }}</textarea>
        </article>
        <div class="post-copyright">
            <b>{{ .notice }}<br></b>
            文章来源:
            <a href="https://www.woann.cn">{{ .article.Author }}</a> »
            <a href="/article/{{ .article.Id }}">{{ .article.Title }}</a>
        </div>
        <div class="action-share"></div>
        <div class="article-author">
            <img class="avatar avatar-100" width="220" height="150" src="{{ .avatar }}"
                 style="display: block;">
            <h4>
                <i class="fa fa-user" aria-hidden="true"></i>
                <a title="查看更多文章" href="/">{{ .article.Author }}</a>
            </h4>
        </div>
        <div class="text-center">
            <div id="cyReward" role="cylabs" data-use="reward"></div>
        </div>
        <nav class="article-nav">
            {{ if gt .pre_article.Id 0 }}
            <span class="article-nav-prev">上一篇<br><a href='/article/{{ .pre_article.Id }}' rel='prev'>{{ .pre_article.Title }}</a></span>
            {{ end }}
            {{ if gt .next_article.Id 0 }}
            <span class="article-nav-next">下一篇<br><a href='/article/{{ .next_article.Id }}' rel='prev'>{{ .next_article.Title }}</a></span>
            {{ end }}
        </nav>
        <div class="relates">
            <div class="title"><h3>相关推荐</h3></div>
            <ul>
                {{ range $k,$v := .about }}
                <li><a href="/article/{{ $v.Id }}" target="_blank"> {{ $v.Title }} </a></li>
                {{ end }}
            </ul>
        </div>
        <div class="title" id="comments">
            <h3>评论
                <small>抢沙发</small>
            </h3>
        </div>
        <div id="cyReward" role="cylabs" data-use="reward"></div>
        <div id="cyEmoji" role="cylabs" data-use="emoji"></div>
        <div id="respond" class="no_webshot">
            <div id="SOHUCS" sid="{{ .article.Id }}" ></div>
            <script type="text/javascript">
                (function(){
                    var appid = 'cyteQSJSE';
                    var conf = '3f2f5d2cebccf3da667df8a714a98216';
                    var width = window.innerWidth || document.documentElement.clientWidth;
                    if (width < 960) {
                        window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("https://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})}); } })();
               </script>
        </div>
    </div>
</div>
