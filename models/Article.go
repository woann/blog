package models

import (
	"blog/common"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"strings"
)

type Article struct {
	Id int
	Category *Category 		`orm:"rel(one)"`
	Cover string
	Title string
	Author string
	Des string
	View int
	Tags string
	Content string
	CreatedAt string
	Recommend int
	Top int
	State int
}

type ArticleShow struct {
	Article
	TagSlice []map[string]string
}

/**
 *首页获取文章列表
 */
func ArticleListByTime(page int,pagesize int,wd string) []ArticleShow {
	var list []Article
	o := orm.NewOrm()
	db := o.QueryTable(new(Article))
	conn := orm.NewCondition()
	conn1 := orm.NewCondition()
	offset := (page - 1) * pagesize
	conn = conn.And("state", 0)
	if wd != ""{
		conn1 = conn1.Or("tags__icontains", wd).Or("title__icontains", wd)
		conn = conn.AndCond(conn1)
	}
	_, _ = db.SetCond(conn).Limit(pagesize, offset).OrderBy("-created_at").RelatedSel().All(&list)
	var res []ArticleShow
	for _,v := range list{
		v.Cover = common.Asset(v.Cover)
		tagSlice := strings.Split(v.Tags, ",")
		var tagMap []map[string]string
		for l,j := range tagSlice{
			color := TagColor(l)
			tagMap = append(tagMap, map[string]string{"name":j, "color":color})
		}
		row := ArticleShow{v,tagMap}
		res = append(res, row)
	}
	return res
}
func ArticleListByCategory(categoryId int,page int,pagesize int) []ArticleShow {
	var list []Article
	o := orm.NewOrm()
	db := o.QueryTable(new(Article))
	offset := (page - 1) * pagesize
	db.Filter("state", 0).Filter("category_id", categoryId).Limit(pagesize, offset).OrderBy("-created_at").RelatedSel().All(&list)
	var res []ArticleShow
	for _,v := range list{
		v.Cover = common.Asset(v.Cover)
		tagSlice := strings.Split(v.Tags, ",")
		var tagMap []map[string]string
		for l,j := range tagSlice{
			color := TagColor(l)
			tagMap = append(tagMap, map[string]string{"name":j, "color":color})
		}
		row := ArticleShow{v,tagMap}
		res = append(res, row)
	}
	return res
}
/**
 * 文章总数
 */
func ArticleTotal(categoryId int) int64 {
	o := orm.NewOrm()
	db := o.QueryTable(new(Article))
	var res int64
	if categoryId == 0{
		res, _ = db.Filter("state", 0).Count()
	}else{
		res, _ = db.Filter("state", 0).Filter("category_id", categoryId).Count()
	}
	return res
}

func ArticleTop() []Article {
	var list []Article
	o := orm.NewOrm()
	db := o.QueryTable(new(Article))
	db.Filter("top", 1).Filter("state", 0).RelatedSel().All(&list,"id", "title", "des")
	return list
}

func ArticleSadeBar(method string) []Article {
	var list []Article
	o := orm.NewOrm()
	db := o.QueryTable(new(Article))
	if method == "recommend" {
		db.Filter("recommend", 1).Filter("state", 0).OrderBy("-created_at").Limit(5).All(&list,"id", "cover", "title", "created_at")
	}else{
		db.Filter("state", 0).OrderBy("-view").Limit(5).All(&list,"id", "cover", "title", "created_at")
	}
	for k,v := range list{
		list[k].Cover = common.Asset(v.Cover)
	}
	return list
}

func ArticleOne(id int) (ArticleShow, error){
	var article Article
	var res ArticleShow
	o := orm.NewOrm()
	db := o.QueryTable(new(Article))
	err := db.Filter("state", 0).Filter("id", id).RelatedSel().One(&article)
	article.Cover = common.Asset(article.Cover)
	tagSlice := strings.Split(article.Tags, ",")
	var tagMap []map[string]string
	for l,j := range tagSlice{
		color := TagColor(l)
		tagMap = append(tagMap, map[string]string{"name":j, "color":color})
	}
	res	 = ArticleShow{article,tagMap}
	return res,err
}

func ArticleAbout (tag []map[string]string) []Article{
	var list []Article
	if len(tag) < 1 {
		return list
	}
	o := orm.NewOrm()
	db := o.QueryTable(new(Article))
	cond := orm.NewCondition()
	cond1 := orm.NewCondition()
	for _,v := range tag{
		cond1 = cond1.Or("tags__icontains", v["name"])
	}
	cond = cond.And("state", 0).AndCond(cond1)
	_, _ = db.SetCond(cond).All(&list,"id", "title")
	return list
}

func ArticleIncrViews(id int) bool{
	o := orm.NewOrm()
	//article := Article{Id:id}
	_, err := o.QueryTable(new(Article)).Filter("id", id).Update(orm.Params{
		"view": orm.ColValue(orm.ColAdd, 1),
	})
	//if o.Read(&article) == nil {
	//	article.View = article.View + 1
	//	if _, err := o.Update(&article); err == nil {
	//		return true
	//	}
	//	return false
	//}
	if err != nil{
		return false
	}
	return true
}
func TagColor(i int) string {
	s := []string{"727577", "a77676", "5d5252", "5a5a7d", "bf8835", "929266"}
	if i < 6{
		return s[i]
	}else{
		a := i % 6 - 1
		return s[a]
	}
}
func init(){
	orm.RegisterModelWithPrefix(beego.AppConfig.String("prefix"), new(Article))
}
