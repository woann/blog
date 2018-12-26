<div class="content-wrap">
    <div class="content">
        <div class="title" style="height: 30px;">
            <h3 >{{ .category_name }}</h3>
        </div>
        {{ range $k,$v := .list }}
            <article class="excerpt excerpt-9 article-box">
                <div class="content-box" style="float: left;width: 80%">
                    <header>
                        <h2> <a target="_blank" href="{{  $v.RealUrl }}" title="{{ $v.Title }}">{{ $v.Title }}</a> </h2>
                    </header>
                    <p class="meta"> <time><i class="fa fa-clock-o"></i>{{ $v.Time }}</time> <span class="author"><i class="fa fa-user"></i>{{ $v.From }} </span></p>
                </div>
                <div class="cover-box">
                    {{ if $v.Cover }}
                    <img src="{{ $v.Cover }}" alt="{{ $v.Title }}">
                    {{ end }}
                </div>
            </article>
        {{ end }}
        <div class="pagination">
            <ul>
                <li class="prev-page"><a href="{{ if  eq $.paginator.currpage 1}}javascript:;{{ else }}?page={{.paginator.prepage}}{{ end }}">上一页</a></li>
            {{ if gt $.paginator.currpage 5 }}
                <li><a href="?page=1">1</a></li>
            {{ end }}
            {{ range $k,$v := .paginator.pages }}
            {{ if and ( gt $.paginator.currpage 5 ) (eq $k 0) }}
                <li><span> ... </span></li>
            {{ else }}
                <li>
                {{ if eq $v $.paginator.currpage }}
                    <span  class="active">{{ $v }}</span>
                {{ else }}
                    <a href="?page={{ $v }}">{{ $v }}</a>
                {{ end }}
                </li>
            {{ end }}
            {{ end }}
                <li class="next-page"><a href="{{ if or  (eq $.paginator.currpage .paginator.totalpages) (eq .paginator.totalpages 0) }}javascript:;{{ else }}?page={{.paginator.nextpage}}{{ end }}">下一页</a></li>
                <li><span>共 {{ .paginator.totalpages }} 页</span></li>
            </ul>
        </div>
    </div>
</div>
