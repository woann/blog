package models

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

type Url struct {
	Id int
	Title string
	Url string
	DataId string
	From string
	CreatedAt string
}


func UrlTotal() int64 {
	o := orm.NewOrm()
	db := o.QueryTable(new(Url))
	var res int64
	res, _ = db.Count()
	return res
}
func UrlList(page,pagesize int)[]Url{
	var list []Url
	o := orm.NewOrm()
	db := o.QueryTable(new(Url))
	offset := (page - 1) * pagesize
	db.Limit(pagesize, offset).OrderBy("-created_at").All(&list)
	return list
}

func init(){
	orm.RegisterModelWithPrefix(beego.AppConfig.String("prefix"), new(Url))
}