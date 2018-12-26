package controllers

import (
	"blog/common"
	"blog/models"
	"github.com/astaxie/beego"
	"html/template"
	"strconv"
)

type IndexController struct {
	beego.Controller
}
/**
 * 公共部分
 */
func  public(this *IndexController, categoryId int){
	//获取博客标题，声明，寄语
	config := models.GetConfig("blog_title", "blog_avatar", "favicon_icon", "notice", "word", "keywords", "description", "website_title")
	if value, ok := config.(map[string]string); ok {
		this.Data["title"] = value["blog_title"]
		this.Data["avatar"] = common.Asset(value["blog_avatar"])
		this.Data["favicon_icon"] = common.Asset(value["favicon_icon"])
		this.Data["notice"] = value["notice"]
		this.Data["word"] = template.HTML(value["word"])
		this.Data["keywords"] = value["keywords"]
		this.Data["description"] = value["description"]
		this.Data["website_title"] = value["website_title"]
	}
	this.Data["categorys"] = models.CategoryList(categoryId)
	this.Data["top"] = models.ArticleTop()
	this.Data["recommend"] = models.ArticleSadeBar("recommend")
	this.Data["hot"] = models.ArticleSadeBar("hot")
}

/**
 * 首页
 */
func (this *IndexController) Index () {
	public(this,0)
	//获取搜索关键字
	wd := this.GetString("wd")
	//获取轮播列表
	this.Data["banners"] = models.BannerList()
	//分页
	page,_ := this.GetInt("page")
	if page == 0{
		page = 1
	}
	total := models.ArticleTotal(0)
	pagesize := 10
	this.Data["paginator"] = common.Paginator(page,pagesize,total)
	//获取文章列表
	this.Data["list"] = models.ArticleListByTime(page, pagesize, wd)
	this.Layout = "base/layout.tpl"
	this.TplName = "index.tpl"
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["SideBar"] = "base/sidebar.tpl"
	this.LayoutSections["Script"] = "script/index_js.tpl"
}


/**
 * 列表页
 */
func (this *IndexController) List() {
	cid := this.Ctx.Input.Param(":id")//获取分类id
	categoryId, _ := strconv.Atoi(cid)//转为int
	category,err := models.CategoryOne(categoryId)//获取分类信息
	//如果分类不存在->404
	if err != nil {
		this.Abort("404")
	}
	//加载公共数据
	public(this, categoryId)
	this.Data["category_id"] = categoryId
	this.Data["category"] = category
	//分页
	page,_ := this.GetInt("page")
	if page == 0{
		page = 1
	}
	total := models.ArticleTotal(categoryId)
	pagesize := 10
	this.Data["paginator"] = common.Paginator(page,pagesize,total)
	//分类下文章列表数据
	this.Data["list"] = models.ArticleListByCategory(categoryId, page, pagesize)
	//模板渲染
	this.Layout = "base/layout.tpl"
	this.TplName = "list.tpl"
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["SideBar"] = "base/sidebar.tpl"
}
/**
 * 文章详情
 */
func (this *IndexController) Article() {
	articleId := this.Ctx.Input.Param(":id")//获取文章id
	id, _ := strconv.Atoi(articleId)//转为int
	article, err := models.ArticleOne(id)//获取文章数据
	//阅读数+1
	models.ArticleIncrViews(id)
	//如果文章不存在跳到404页
	if err != nil{
		this.Abort("404")
	}
	//加载公共数据
	public(this, 0)
	//将标签添加到keywords
	keywords := ""
	for k,v := range article.TagSlice{
		keywords = common.MergeString(keywords,v["name"])
		if k != len(article.TagSlice) - 1{
			keywords = common.MergeString(keywords,",")
		}
	}
	this.Data["keywords"] = keywords
	this.Data["description"] = article.Title
	this.Data["website_title"] = article.Title
	preArticle, err := models.ArticleOne(id - 1)
	nextArticle, err := models.ArticleOne(id + 1)
	this.Data["article"] = article//文章详情
	this.Data["about"] = models.ArticleAbout(article.TagSlice)//相关文章
	this.Data["pre_article"] = preArticle//上一篇
	this.Data["next_article"] = nextArticle//下一篇
	//渲染模板
	this.Layout = "base/layout.tpl"
	this.TplName = "article.tpl"
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["SideBar"] = "base/sidebar_2.tpl"
	this.LayoutSections["Script"] = "script/article_js.tpl"
}

func (this *IndexController) Tag() {
	public(this,0)
	//获取参数
	name := this.GetString("name")
	color := this.GetString("color")
	this.Data["color"] = color
	this.Data["name"] = name
	//分页
	page,_ := this.GetInt("page")
	if page == 0{
		page = 1
	}
	total := models.ArticleTotal(0)
	pagesize := 10
	this.Data["paginator"] = common.Paginator(page,pagesize,total)
	//获取文章列表
	this.Data["list"] = models.ArticleListByTime(page, pagesize, name)
	//渲染页面
	this.Layout = "base/layout.tpl"
	this.TplName = "tag.tpl"
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["SideBar"] = "base/sidebar.tpl"
}

/**
 * 爬虫页
 */
func (this *IndexController) News() {

	//加载公共数据
	public(this, 0)
	this.Data["category_id"] = 999
	//分页
	page,_ := this.GetInt("page")
	if page == 0{
		page = 1
	}
	total := models.UrlTotal()
	pagesize := 20
	this.Data["paginator"] = common.Paginator(page,pagesize,total)
	//分类下文章列表数据
	this.Data["list"] = models.UrlList(page, pagesize)
	//模板渲染
	this.Layout = "base/layout.tpl"
	this.TplName = "url.tpl"
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["SideBar"] = "base/sidebar.tpl"
	this.LayoutSections["Header"] = "header/url_header.tpl"

}



