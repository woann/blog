package models

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

type Category struct {
	Id int
	Pid int
	Name string
	Icon string
	State int
	Sort int
}

type CategoryShow struct {
	Category
	Child []Category
	Active bool
}


func CategoryList(categoryId int) []CategoryShow {
	var list []Category
	o := orm.NewOrm()
	db := o.QueryTable(new(Category))
	db.Filter("state", 0).Filter("pid", 0).OrderBy("-sort").All(&list)
	var res []CategoryShow
	for _, v := range list{
		row := CategoryShow{ Category:v }
		if categoryId == v.Id {
			row.Active = categoryId == v.Id
		}
		db.Filter("state", 0).Filter("pid", v.Id).OrderBy("-sort").All(&row.Child)
		for _,val := range row.Child{
			if categoryId == val.Id {
				row.Active = true
			}
		}
		res = append(res, row)
	}
	return res
}

func CategoryOne(id int) (Category, error) {
	var res Category
	o := orm.NewOrm()
	db := o.QueryTable(new(Category))
	err := db.Filter("id", id).One(&res)
	return res,err
}

func init () {
	orm.RegisterModelWithPrefix(beego.AppConfig.String("prefix"), new(Category))
}