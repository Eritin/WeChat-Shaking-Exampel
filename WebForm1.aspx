 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="weixin_api.WebForm1" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0052)http://m.djc021.com/public/bddjcwapzg0819/index.html -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>摇一摇</title>
    <meta name="keywords" content="牛股快报，个股诊断，涨停板，免费大放送">
    <link href="images/style.css" rel="stylesheet" type="text/css">
    <script language="javascript" type="text/javascript" src="http://m.shenguang.com.cn/zysj/Content/Scripts/jquery-1.8.2.min.js"></script>

    <script type="text/javascript">
        function getNow(s) {
            return s < 10 ? '0' + s : s;
        }

        var myDate = new Date();
        //获取当前年
        var year = myDate.getFullYear();
        //获取当前月
        var month = myDate.getMonth() + 1;
        //获取当前日
        var date = myDate.getDate();
        var h = myDate.getHours();       //获取当前小时数(0-23)
        var m = myDate.getMinutes();     //获取当前分钟数(0-59)
        var s = myDate.getSeconds();  //结束时间

        var now = year + '-' + getNow(month) + "-" + getNow(date) + " " + getNow(h) + ':' + getNow(m) + ":" + getNow(s);

        var starttime = "2019.01.16 13:43:00"; //开始时间

        var date = new Date(starttime).getTime() - myDate.getTime();   //时间差的毫秒数  
        var Q = date / 1000;
        Q = parseInt(Q);
        alert(Q);

        var i = Q;
        var timer = setInterval(function () {
            i--;
            $("#second").html(i);
            if (i <= 0)
                $("#second").html(0);
            if (i == -60) {
                $.ajax({
                    url: 'Handler1.ashx',
                    type: 'POST',

                    data: {
                        "key1": "<%= id %>",
                        "key2": $(" #input ").val(),
                        "key3": "<%= openid %>"
                    },
                    cache: false,
                    dataType: 'text',
                    success: function (data) {
                        alert(data);
                        //window.location.href = "http://localhost:23405/WebForm2.aspx";
                    },
                    error: function (xhr) {
                        alert("出现错误，请稍后再试:" + xhr.responseText);
                    }
                });
                }

        }, 1000);

        //var Timer = setInterval(function () {
            //if (i == -60) {
               // $.ajax({
                   // url: 'Handler1.ashx',
                   // type: 'POST',
                   
                   // data: {
                        //"key1": "<%= id %>",
                                    //"key2": $(" #input ").val(),
                                    //"key3": "<%= openid %>"
                              //  },
                               // cache: false,
                               // dataType: 'text',
                               // success: function (data) {
                                   // alert(data);
                                    //window.location.href = "http://localhost:23405/WebForm2.aspx";
                              //  },
                               // error: function (xhr) {
                                    //alert("出现错误，请稍后再试:" + xhr.responseText);
                               // }
                           // });
                     //   }

             // }, 1000); 



        var SHAKE_THRESHOLD = 3000;
        var last_update = 0;
        var x = y = z = last_x = last_y = last_z = 0;
        var num = 0;
        var isprint = false;
        
        //var input = 0;
        //var timer = setInterval(function () {

           
        //    if (i <= - 60) {

        //        //window.location.href = "http://localhost:23405/WebForm2.aspx";
        //    }
        //}, 1000);
        function init() {
            if (window.DeviceMotionEvent) {
                window.addEventListener('devicemotion', deviceMotionHandler, false);
            } else {
                alert('not support mobile event');
            }
        }

       
        function deviceMotionHandler(eventData) {
            if (i <= 0 && i >= -60) {
                var acceleration = eventData.accelerationIncludingGravity;
                var curTime = new Date().getTime();
                if ((curTime - last_update) > 100) {
                    var diffTime = curTime - last_update;
                    last_update = curTime;
                    x = acceleration.x;
                    y = acceleration.y;
                    z = acceleration.z;
                    var speed = Math.abs(x + y + z - last_x - last_y - last_z) / diffTime * 10000;

                    //if (speed < SHAKE_THRESHOLD) {
                    //    num++;
                    //    var node = document.getElementById("ulid");
                    //    var li = document.createElement("li");
                    //    li.innerText = timer;
                    //    node.appendChild(li);
                    //    //node.innerHTML = num + "times";

                    //    num == 0;
                    //}

                    var x1 = Math.abs(x - last_x);
                    var y1 = Math.abs(y - last_y);
                    var z1 = Math.abs(z - last_z);
                    var max = 0;
                    if (x1 > y1) {
                        if (x1 > z1) {
                            max = x1;
                        } else {
                            max = z1;
                        }
                    } else {
                        if (y1 > z1) {
                            max = y1;
                        } else {
                            max = z1;
                        }
                    }
                    if (max > 40) {
                        isprint = true;
                        if (i <= 0 && -60 <= i) {

                            //    //window.location.href = "http://localhost:23405/WebForm2.aspx";
                            //}
                            //else {
                            //    //window.location.href = "http://localhost:23405/WebForm2.aspx";
                            num++;

                        }

                    } else if (max < 5 && isprint) {
                        //num = i;

                        //input = input + num;
                        var a = document.getElementById("input").value;
                        a = Math.abs(a) + Math.abs(num);
                        document.getElementById("input").value = a;
                        //var tt = document.getElementById("input");
                        //tt.innerHTML(input);
                        //node.appendChild(li);
                        //var



                        //num = 0;
                        isprint = false;
                    }
                    last_x = x;
                    last_y = y;
                    last_z = z;
                }
            }
        }

        //$.ajax({
        //    type: "POST",
        //    url: "test.json",
        //    data: {username:$("#username").val(), content:$("#content").val()},
        //    dataType: "json",
        //    success: function (data) {
        //    }
        //    });

        //$.ajax({
        //    url: '/Handler1.ashx.cs',
        //    type: 'POST',
        //    /*
        //    请求ashx文件的时候 要把contentType去掉，还有就是
        //    data 格式为 {”key”,”value”};切记 不要再 大括号外面加双引号，
        //    这样就会在ashx页面取不到数据而失败
        //    */
        //    //contentType: 'application/json; charset=utf8',
        //    data: {
        //        "key1": "starttime",
        //        "key2": "a"
        //    },
        //    cache: false,
        //    dataType: 'text',
        //    success: function (data) {
        //        alert(data);
        //    },
        //    error: function (xhr) {
        //        alert("出现错误，请稍后再试:" + xhr.responseText);
        //    }
        //});
        //var k = document.getElementById("people").value;
        //document.getElementById("people").value = k;
        //$("#People").html(k);

    </script>
</head>

<body onload="init()">
    <input id="input" type="text" value="0" />
    
    <div class="wrapper mg">
        <section style="position: relative">
 <div style="position:absolute; top:65px; right:30%; color:#fff; font-size:2.2em; display:"><strong id ="second"></strong></div>
        <div><img src="images/20181210a_02.jpg" width="100%" alt="/"></div>
  </section>
        <section style="position: relative">
        <div><img src="images/20181210a_03.jpg" width="100%" alt="/"></div>
  </section>
        <section style="position: relative">
			  <div style="position:absolute; top:5px; right:35%; color:#db1917; font-size:16px; "><% =dt.Rows[0][0].ToString()%></div>
        <div><img src="images/20181210a_04.jpg" width="100%" alt="/"></div>
  </section>
        <section style="position: relative">
        <div><img src="images/20181210a_05.jpg" width="100%" alt="/"></div>
  </section>
    </div>
    <div class="footclass">
        <h6 class="foottext">山东神光咨询服务有限责任公司<br />
            神光证书编号：ZX0054
        </h6>
    </div>
</body>
</html>
