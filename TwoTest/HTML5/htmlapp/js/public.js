(function(){
	var eventManger = {
		init:function(){
			this.remConversion()
			var myScroll = new IScroll('#content', {
				mouseWheel: true
			});
		},
		remConversion:function () {
            if ((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i))) {
//在移动端
                (function (doc, win) {
// html
                    var docEl = doc.documentElement,
                        resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize', recalc = function () {
                            var clientWidth = docEl.clientWidth;
                            // alert(clientWidth)
                            if (!clientWidth) return;
                            clientWidth = (clientWidth > 768 ) ? 768 : clientWidth ; docEl.style.fontSize = 50 * (clientWidth / 375 ) + 'px';      //这个10可以根据自己使用的数据来调整
                        };
                    if (!doc.addEventListener) return; win.addEventListener(resizeEvt, recalc, false);
                    recalc();

                })(document, window);
//移动端 文字适配
            }
            else {       //如果是pc端我们可以像微信公众号那样，设置最大宽度为750px
// window.location.href="prompt.html"
                document.documentElement.style.maxWidth=750+'px';
                document.documentElement.style.margin="0 auto";
//PC端
            }
        },
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