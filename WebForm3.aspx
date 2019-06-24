<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="weixin_api.WebForm3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0052)http://m.djc021.com/public/bddjcwapzg0819/index.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
   
    <title>摇一摇</title>
    <meta name="keywords" content="牛股快报，个股诊断，涨停板，免费大放送">
    <link href="images/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function getNow(s) {
            return s < 10 ? '0' + s: s;
        }

        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate(); 
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        var s = myDate.getSeconds();  //结束时间

        var now=year+'-'+getNow(month)+"-"+getNow(date)+" "+getNow(h)+':'+getNow(m)+":"+getNow(s);
        
        var starttime = "2019.01.11 15:50:30"; //开始时间
       
        var date = new Date(starttime).getTime() -myDate.getTime();   //时间差的毫秒数  
        var Q = date / 1000;
        Q = parseInt(Q);
        alert(Q);

        var i = Q;
        var timer = setInterval(function () {
            i--;
            if (i <= 60&&i>=-60) {
                window.location.href = "http://localhost:23405/WebForm1.aspx";

            }
        }, 1000);
        //function goBack() {
        //    window.history.go(-1);
        //}

    </script>
</head>

<body>

<div class="wrapper mg">
 <section style="position:relative">
        <div><img src="images/20181210b_02.jpg" width="100%" alt="/"></div>
  </section>
	 <section style="position:relative">
        <div><img src="images/20181210b_03.jpg" width="100%" alt="/"></div>
  </section>
  <section class="mgtb" style="padding:0 10px"> 
	  <div style=" background: #fff; border-radius:5px; margin: 10px 0">
       <table border="0" cellspacing="0" cellpadding="0" class="zxcb_list">
  <tbody>
      <%for (int i = 0; i < dt.Rows.Count; i++){ %>
    <tr>
      <td width="15%"><strong><%=i +1 %></strong></td>
      <td width="10%"><i class="zb_wd_img fl"><img src="<% =img%>" width="83" height="83" alt=""/></i></td>
      <td width="50%"><% =name%></td>
      <td width="25%"><span class="fontblack"><% =dt.Rows[i]["shaketimes"].ToString()%></span></td>
      </tr>
      <%} %>
    
  </tbody>
</table></div>
        </section>
</div>
</body></html>
