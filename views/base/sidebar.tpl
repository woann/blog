<aside class="sidebar animated fadeIn">
    <div class="widget widget_ui_textasb">
        <a class="style02" target="_blank"><strong><i class="fa fa-cc"></i> 声明</strong>
            <h2></h2> <p>{{ .notice }}</p>
        </a>
    </div>
    <div class="widget widget_ui_textasb">
        <a class="style01" onclick="javascript:void(0);" target="_blank"><strong> <i class="fa fa-heart"></i> 寄语</strong>
           {{  .word }}
        </a>
    </div>
    {{ if gt (.recommend | len)  0 }}
        <div class="widget widget_ui_textasb">
        <a class="style03" onclick="javascript:void(0);"><strong><i class="fa fa-paper-plane"></i> 推荐</strong></a>
        <div class="widget_ui_posts">
            <ul>
                {{ range $k,$v := .recommend }}
                    <li>
                        <a href="/article/{{ $v.Id }}" class="no-border" style="border: 0;">
                            <span class="thumbnail">
                            <img src="{{ $v.Cover }}" alt="{{ $v.Title }}" class="thumb" />
                            </span>
                            <span class="text">{{ $v.Title }}</span>
                            <span class="muted">{{ $v.CreatedAt }}</span>
                        </a>
                    </li>
                {{ end }}
            </ul>
        </div>
    </div>
    {{ end }}
    {{ if gt (.hot | len)  0 }}
    <div class="widget widget_ui_textasb">
        <a class="style04" onclick="javascript:void(0);" style="border: 0;"><strong><i class="fa fa-fire"></i> 热门</strong></a>
        <div class="widget_ui_posts">
            <ul>
            {{ range $k,$v := .hot }}
                <li>
                    <a href="/article/{{ $v.Id }}" class="no-border" style="border: 0;">
                            <span class="thumbnail">
                            <img src="{{ $v.Cover }}" alt="{{ $v.Title }}" class="thumb" />
                            </span>
                        <span class="text">{{ $v.Title }}</span>
                        <span class="muted">{{ $v.CreatedAt }}</span>
                    </a>
                </li>
            {{ end }}
            </ul>
        </div>
    </div>
    {{ end }}
</aside>