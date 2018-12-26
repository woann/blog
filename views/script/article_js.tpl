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
        $(document).ready(function(){//在文档加载完毕后执行
            $(window).scroll(function(){//开始监听滚动条
                mTop = $('#mulu')[0].offsetTop;
                sideTop = $('.sidebar')[0].offsetTop;
                sTop = $(window).scrollTop();
                result = mTop - sTop;
                result1 = sideTop - sTop;
                console .log(result);
                if (result1 > -612){
                    $('#mulu').css({"position":"relative","top":""})
                }else{
                    $('#mulu').css({"position":"fixed","top":"20px"})
                }
                console .log(result1);
            })
        })
    })

</script>