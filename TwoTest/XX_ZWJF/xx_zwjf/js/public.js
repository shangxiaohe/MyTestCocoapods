function getDonmin(){
//	var donmin="http://xzfw.xinxing.gov.cn/";//正式
//	var donmin="http://192.168.1.136:8080/xx_znyd/";//云龙本地
	var donmin="http://xzfw.xinxing.gov.cn:8115/DY_XX_ZNYYGLPT/";//测试
	return donmin;
}

(function(){
	var eventManger={
		init:function(){
			this.rem()
			this.containerHeight()
		},
		rem:function () {
            if ((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i))) {
				//在移动端
                (function (doc, win) {
					// html
                    var docEl = doc.documentElement,
                        resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize', recalc = function() {
                            var clientWidth = docEl.clientWidth;
                            if (!clientWidth) return;
                            clientWidth = (clientWidth > 768 ) ? 768 : clientWidth ; docEl.style.fontSize = 50 * (clientWidth / 375 ) + 'px';//这个10可以根据自己使用的数据来调整
                        };
                    if (!doc.addEventListener) return; win.addEventListener(resizeEvt, recalc, false);
                    recalc();

                })(document, window);
			//移动端 文字适配
            }
            else {       //如果是pc端我们可以像微信公众号那样，设置最大宽度为750px
				// window.location.href="prompt.html"
                document.documentElement.style.maxWidth="100%";
                document.documentElement.style.margin="0 auto"
				//PC端
            }
        },
        containerHeight:function () {
        	let docH=document.documentElement.clientHeight
        	$('#container').css('height',docH-$('header').height()+'px')
        }
	}
	eventManger.init()
})(this)

function GetQueryString(name) {//获取当前网址?后面的值
    var str = window.location.search;
    var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
    var r = window.location.search.substr(1).match(reg);
    if (r != null) {
        return unescape(r[2]);
    }
    return null;
}

var getjson=function(jsonData){   //转换字符串为json对象,必须内容为接送内容,否则报错
                var json = eval("(" + jsonData +")");//转换为json对象    
                return json;  
}  
			
