<script src="/static/lib/editor.md-master/lib/marked.min.js"></script>
<script src="/static/lib/editor.md-master/lib/prettify.min.js"></script>
<script src="/static/lib/editor.md-master/editormd.min.js"></script>
<script type="text/javascript" charset="utf-8" src="https://changyan.itc.cn/js/lib/jquery.js"></script>
<script type="text/javascript" charset="utf-8" src="https://changyan.sohu.com/js/changyan.labs.https.js?appid=cyteQSJSE"></script>
<script>
    $(function(){
        var testEditormdView;
        testEditormdView = editormd.markdownToHTML("test-editormd-view", {
            htmlDecode      : "style,script,iframe",
            emoji           : false,
            taskList        : true,
            tex             : true,
            flowChart       : false,
            sequenceDiagram : false,
            tocm            : true,
            tocContainer    : "#custom-toc-container",
        });
        $(window).scroll(function(){
            sTop = $(window).scrollTop();
            if (sTop < 604){
                $('#mulu').css({"position":"relative","top":""})
            }else{
                $('#mulu').css({"position":"fixed","top":"20px"})
            }
        });
        $('a[href*=#],area[href*=#]').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                this.hash = decodeURIComponent(this.hash);
                var a = decodeURIComponent(this.hash);
                var $target = $(a);
                $target = $target.length && $target || $('[name="' + a.slice(1) + '"]');
                if ($target.length) {
                    var targetOffset = $target.offset().top;
                    $('html,body').animate({
                            scrollTop: targetOffset - 80
                        },
                        1000);
                    return false;
                }
            }
        });
    })

</script>