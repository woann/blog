<script src="/static/lib/editor.md-master/lib/marked.min.js"></script>
<script src="/static/lib/editor.md-master/lib/prettify.min.js"></script>
<script src="/static/lib/editor.md-master/editormd.min.js"></script>
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
    })

</script>