package main

import (
	"blog/controllers"
	_ "blog/routers"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	"time"
)
func init() {
	orm.Debug = true
	orm.RegisterDriver("mysql",orm.DRMySQL)
	mysqluser := beego.AppConfig.String("mysqluser")
	mysqlpass := beego.AppConfig.String("mysqlpass")
	mysqlhost := beego.AppConfig.String("mysqlhost")
	mysqlport := beego.AppConfig.String("mysqlport")
	mysqldb := beego.AppConfig.String("mysqldb")
	charset := beego.AppConfig.String("charset")
	orm.RegisterDataBase("default","mysql",mysqluser+":"+mysqlpass+"@tcp("+mysqlhost+":"+mysqlport+")/"+mysqldb+"?charset="+charset)
	orm.DefaultTimeLoc = time.UTC
}

func main() {
	beego.ErrorController(&controllers.ErrorController{})
	beego.Run()
}

