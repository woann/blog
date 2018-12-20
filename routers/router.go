package routers

import (
	"blog/controllers"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.IndexController{},"get:Index")
	beego.Router("/category/:id:int", &controllers.IndexController{},"get:List")
	beego.Router("/article/:id:int", &controllers.IndexController{},"get:Article")
	beego.Router("/tag", &controllers.IndexController{},"get:Tag")
}
