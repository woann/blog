package models

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"time"
	"math"
	"strconv"
	"blog/common"
	"html/template"
)

type Url struct {
	Id int
	Title string
	Url string
	Cover string
	DataId string
	From string
	CreatedAt int64
}
type ShowUrl struct {
	Url
	Time string
	RealUrl template.URL
}

func UrlTotal() int64 {
	o := orm.NewOrm()
	db := o.QueryTable(new(Url))
	var res int64
	res, _ = db.Count()
	return res
}
func UrlList(page,pagesize int)[]ShowUrl{
	var list []Url
	var res []ShowUrl
	o := orm.NewOrm()
	db := o.QueryTable(new(Url))
	offset := (page - 1) * pagesize
	db.Limit(pagesize, offset).OrderBy("-created_at").All(&list)
	for _,v := range list{
		res = append(res, ShowUrl{v,StrTime(v.CreatedAt),template.URL(v.Url)})
	}
	return res
}
func StrTime (atime int64) string{
	var byTime = []int64{365*24*60*60,24*60*60,60*60,60,1}
	var unit = []string{"年前","天前","小时前","分钟前","秒钟前"}
	now := time.Now().Unix()
	ct := now - atime
	if ct < 0{
		return ""
	}
	var res string
	for i := 0;i < len(byTime);i++{
		if ct < byTime[i]{
			continue
		}
		var temp = math.Floor(float64(ct / byTime[i]))
		ct = ct % byTime[i];
		if temp > 0 {
			var tempStr string
			tempStr = strconv.FormatFloat(temp,'f',-1,64)
			res = common.MergeString(tempStr,unit[i])
		}
		break
	}

	return res

}

func init(){
	orm.RegisterModelWithPrefix(beego.AppConfig.String("prefix"), new(Url))
}