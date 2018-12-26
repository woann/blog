<aside class="sidebar">
<div class="widget widget_meta">
    <h3>精彩推荐</h3>
    <ul>
        {{ range $k,$v := .recommend }}
            <li>
                <a href="/article/{{ $v.Id }}">
                {{ $v.Title }}
                </a>
            </li>
        {{ end }}
    </ul>
</div>
<div class="widget widget_meta">
    <h3>热门文章</h3>
    <ul>
        {{ range $k,$v := .hot }}
            <li>
                <a href="/article/{{ $v.Id }}">
                    {{ $v.Title }}
                </a>
            </li>
        {{ end }}
    </ul>
</div>
<div class="widget widget_meta affix-top" id="mulu" style="width: 360px">
    <h3>索引目录</h3>
    <div id="sidebar"  style="max-height: 600px;overflow: hidden">
        <div class="markdown-body editormd-preview-container" id="custom-toc-container"></div>
    </div>
</div>
</aside>