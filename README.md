# JSLivePlayer

------



### 映客app直播接口

> * [热门](http://service.inke.com/api/live/gettop)


### 返回值

```json
{
	"city": "",
	"creator": {
		"emotion": "单身",
		"inke_verify": 0,
		"verified": 0,
		"description": " ",
		"gender": 0,
		"profession": "学生",
		"id": 7418133,
		"verified_reason": "",
		"nick": "阿喵酱",
		"location": "",
		"birth": "2008-11-02",
		"hometown": "火星&",
		"portrait": "MTQ3OTY0MTE1MzI1NyMxMyNqcGc=.jpg",
		"gmutex": 0,
		"third_platform": "1",
		"level": 54,
		"rank_veri": 8,
		"veri_info": "辣妹"
	},
	"id": "1479898567726829",
	"image": "",
	"name": "",
	"pub_stat": 1,
	"room_id": 780046530,
	"share_addr": "http://mlive9.inke.cn/share/live.html?uid=7418133&liveid=1479898567726829&ctime=1479898567",
	"slot": 4,
	"status": 1,
	"stream_addr": "http://pull99.a8.com/live/1479898567726829.flv",
	"version": 0,
	"online_users": 19167,
	"group": 1,
	"link": 0,
	"optimal": 0,
	"multi": 0,
	"rotate": 0
}
```


#### 头像/封面url

```http
http://img.meelive.cn/MTQ3OTY0MTE1MzI1NyMxMyNqcGc=.jpg
```

### 注意

需要下载已编译好的第三方库 `IJKMediaFramework.framework`