package controllers

import (
	"blog/common"
	"blog/models"
	"github.com/astaxie/beego"
	"html/template"
)

type ErrorController struct {
	beego.Controller
}

func (this *ErrorController) Error404() {
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
		this.Data["website_title"] = "404"
	}
	this.Data["categorys"] = models.CategoryList(0)
	this.TplName = "system/404.tpl"
	this.Layout = "base/layout.tpl"
}

func (this *ErrorController) Error501() {
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
		this.Data["website_title"] = "404"
	}
	this.Data["categorys"] = models.CategoryList(0)
	this.TplName = "system/404.tpl"
	this.Layout = "base/layout.tpl"
}


func (this *ErrorController) ErrorDb() {
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
		this.Data["website_title"] = "404"
	}
	this.Data["categorys"] = models.CategoryList(0)
	this.TplName = "system/404.tpl"
	this.Layout = "base/layout.tpl"
}