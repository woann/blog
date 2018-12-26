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
        $(document).ready(function(){
            $(window).scroll(function(){
                sTop = $(window).scrollTop();
                if (sTop < 604){
                    $('#mulu').css({"position":"relative","top":""})
                }else{
                    $('#mulu').css({"position":"fixed","top":"20px"})
                }
            })
        })
    })

</script>