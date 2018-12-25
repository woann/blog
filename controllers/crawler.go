package controllers

import (
	"blog/common"
	"blog/common/redis"
	"blog/models"
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"net/http"
	"time"
)

type CrawlerController struct {
	beego.Controller
}

func (this *CrawlerController)Index(){
	this.EnableRender = false //关闭模板渲染
	segmentfault()
}

func segmentfault(){
	var urls = []string{"https://segmentfault.com/t/golang","https://segmentfault.com/t/php"}
	for _,v := range urls{
		res, err := http.Get(v)
		if err != nil {
			fmt.Println(err)
		}
		defer res.Body.Close()
		if res.StatusCode != 200 {
			fmt.Printf("status code error: %d %s", res.StatusCode, res.Status)
		}
		doc, err := goquery.NewDocumentFromReader(res.Body)
		if err != nil {
			fmt.Println(err)
		}
		var count int
		var list []models.Url
		doc.Find(".news-item").EachWithBreak(func(i int, s *goquery.Selection) bool {
			dataId, _ := s.Attr("data-id")
			isExist := redis.SIsMember("crawler", dataId)
			if isExist{
				return false
			}
			title := s.Find(".news__item-title a").Text()
			url, _ := s.Find(".news__item-title a").Attr("href")
			url = common.MergeString("https://segmentfault.com",url)
			timeStr:=time.Now().Format("2006-01-02 15:04:05")
			row := models.Url{Title:title,DataId:dataId,Url:url,CreatedAt:timeStr,From:"segmentfault"}
			list = append(list, row)
			redis.SAdd("crawler",dataId)
			count ++
			return true
		})
		o := orm.NewOrm()
		o.InsertMulti(count,list)
		return
	}

}

