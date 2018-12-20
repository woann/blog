package common

import (
	"bytes"
	"github.com/astaxie/beego"
	"math"
)


func MergeString (args ...string) string {
	buffer := bytes.Buffer{}
	for i:=0; i<len(args); i++ {
		buffer.WriteString(args[i])
	}
	return buffer.String()
}

func Asset (path string) string {
	return MergeString(beego.AppConfig.String("resources_url"), path)
}
func Paginator(page, pagesize int, nums int64) map[string]interface{} {

	var prepage int //前一页地址
	var nextpage int  //后一页地址
	//根据nums总数，和pagesize每页数量 生成分页总数
	totalpages := int(math.Ceil(float64(nums) / float64(pagesize))) //page总数
	if page > totalpages {
		page = totalpages
	}
	if page <= 0 {
		page = 1
	}
	var pages []int
	switch {
	case page >= totalpages-8 && totalpages > 8: //最后8页
		start := totalpages - 8 + 1
		prepage = page - 1
		nextpage = int(math.Min(float64(totalpages), float64(page+1)))
		pages = make([]int, 8)
		for i, _ := range pages {
			pages[i] = start + i
		}
	case page >= 5 && totalpages > 8:
		start := page - 5 + 1
		pages = make([]int, 8)
		prepage = page - 5
		for i, _ := range pages {
			pages[i] = start + i
		}
		prepage = page - 1
		nextpage = page + 1
	default:
		pages = make([]int, int(math.Min(8, float64(totalpages))))
		for i, _ := range pages {
			pages[i] = i + 1
		}
		prepage = int(math.Max(float64(1), float64(page-1)))
		nextpage = page + 1
		//fmt.Println(pages)
	}
	paginatorMap := make(map[string]interface{})
	paginatorMap["pages"] = pages
	paginatorMap["totalpages"] = totalpages
	paginatorMap["prepage"] = prepage
	paginatorMap["nextpage"] = nextpage
	paginatorMap["currpage"] = page
	return paginatorMap
}