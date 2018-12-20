package models

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

type AdminConfig struct {
	Id int
	Name string
	ConfigKey string
	ConfigValue string
	Type string
}


func GetConfig(key ...string) interface{} {
	var res interface{}
	o := orm.NewOrm()
	db := o.QueryTable(new(AdminConfig))
	if len(key) > 1{
		var list []AdminConfig
		var keys []string
		for _,v := range key{
			keys = append(keys, v)
		}
		_,err := db.Filter("config_key__in", keys).All(&list)
		if err == orm.ErrNoRows{
			res = nil
		}
		m := make(map[string]string)
		for _,val := range list{
			m[val.ConfigKey] = val.ConfigValue
		}
		res = m
	}else{
		config := AdminConfig{}
			err := db.Filter("config_key", key[0]).One(&config)
			if err == orm.ErrNoRows{
				res = nil
			}
			res = config.ConfigValue
	}
	return res
}

func init() {
	orm.RegisterModelWithPrefix(beego.AppConfig.String("prefix"),new(AdminConfig))
}
