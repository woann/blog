package models

import (
	"blog/common"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

type Banner struct {
	Id int
	ArticleId int
	Url string
	Image string
	Des string
	State int
}

func BannerList() []Banner {
	o := orm.NewOrm()
	db := o.QueryTable(new(Banner))
	var list []Banner
	db.Filter("state", 0).All(&list)
	for k,v := range list{
		list[k].Image = common.Asset(v.Image)
	}
	return list
}

func init(){
	orm.RegisterModelWithPrefix(beego.AppConfig.String("prefix"), new(Banner))
}