<div class="content-wrap">
        <div class="content">
            <div class="title" style="height: 30px;">
                <h3 >{{ .category.Name }}</h3>
            </div>
            {{ range $k,$v := .list }}
                <article class="excerpt excerpt-{{ $v.Id }}">
                    <a class="focus" href="/article/{{ $v.Id }}"> <img src="{{ $v.Cover }}" alt="{{ $v.Title }}" class="thumb" width="220" height="150" /> </a>
                    <header>
                        <a class="cat" href="/category/{{ $v.Category.Id }}">{{ $v.Category.Name }}<i></i></a>
                        <h2> <a href="/article/{{ $v.Id }}" title="{{ $v.Title }}">{{ $v.Title }}</a> </h2>
                    </header>
                    <p class="meta"> <time><i class="fa fa-clock-o"></i>{{ $v.CreatedAt }}</time> <span class="author"><i class="fa fa-user"></i>{{ $v.Author }} </span><span class="pv"><i class="fa fa-eye"></i>阅读({{ $v.View }})</span> </p>
                    <p class="note note_space"> {{ $v.Des }} </p>
                    <p class="tags">
                        {{ range $key,$val := $v.TagSlice }}
                            <a class="tag" target="_black" style="background:#{{ index $val "color" }}" title="{{ index $val "name" }}" href="/tag?name={{ index $val "name" }}&color={{ index $val "color" }}" rel="tag">{{ index $val "name" }}</a>
                        {{ end }}
                    </p>
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
