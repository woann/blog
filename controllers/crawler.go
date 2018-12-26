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
	"strings"
	"time"
)

type CrawlerController struct {
	beego.Controller
}

func (this *CrawlerController)Index(){
	this.EnableRender = false //关闭模板渲染
	var urls = []string{"https://segmentfault.com/t/golang","https://segmentfault.com/t/php","https://segmentfault.com/t/laravel"}
	for _,v := range urls{
		go segmentfault(v)
	}
	var juejinUrls = []string{"https://juejin.im/welcome/backend","https://juejin.im/welcome/article"}
	for _,v := range juejinUrls{
		go juejin(v)
	}
}

func segmentfault(url_v string){
	res, err := http.Get(url_v)
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
		now := time.Now().Unix()
		row := models.Url{Title:title,DataId:dataId,Url:url,CreatedAt:now,From:"segmentfault"}
		list = append(list, row)
		_ = redis.SAdd("crawler", dataId)
		count ++
		return true
	})
	o := orm.NewOrm()
	_, _ = o.InsertMulti(count, list)
}

func juejin(url_v string){
	res, err := http.Get(url_v)
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
	doc.Find(".entry-list").Children().EachWithBreak(func(i int, s *goquery.Selection) bool {
		url, _ := s.Find(".title-row .title").Attr("href")
		var urlSlice []string
		urlSlice = strings.Split(url,"/")
		if i == 20{
			return false
		}
		dataId := urlSlice[2]
		isExist := redis.SIsMember("crawler", dataId)
		if isExist{
			return false
		}
		url = common.MergeString("https://juejin.im",url)
		title := s.Find(".info-row .title").Text()
		cover, _ := s.Find(".info-box").Next().Attr("data-src")
		now := time.Now().Unix()
		row := models.Url{Title:title,DataId:dataId,Url:url,Cover:cover,CreatedAt:now,From:"掘金"}
		list = append(list, row)
		_ = redis.SAdd("crawler", dataId)
		count ++
		return true
	})
	o := orm.NewOrm()
	_, _ = o.InsertMulti(count, list)
}


