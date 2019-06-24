`<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="weixin_api.WebForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0052)http://m.djc021.com/public/bddjcwapzg0819/index.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    
    <title>摇一摇</title>
    <meta name="keywords" content="牛股快报，个股诊断，涨停板，免费大放送">
    <link href="images/style.css" rel="stylesheet" type="text/css">
</head>

<body>

<div class="wrapper mg">
 <section style="position:relative">
        <div><img src="images/20181210c_02.jpg" width="100%" alt="/"></div>
  </section>
	 <section style="position:relative">
         <%for (int a = 0;a<aa.Rows.Count;a++){%>
         <%if (a +1>  0){  %>
		 <div style="position:absolute; bottom:10px; right:40%; color:#ffc74d; font-size:1.5em; display:"><strong><% =aa.Rows[0]["shaketimes"].ToString()%></strong></div>
         <%} %>
         <%if (a+1 > 2){ %>
		 <div style="position:absolute; bottom:5px; right:10%; color:#ffa16f; font-size:1.5em; display:"><strong><% =aa.Rows[2]["shaketimes"].ToString()%></strong></div>
         <%} %>
         <%if (a+1 >1){ %>
		 <div style="position:absolute; bottom:5px; left:10%; color:#c1c1c1; font-size:1.5em; display:"><strong><% =aa.Rows[1]["shaketimes"].ToString()%></strong></div>
         <%} %>
         <%if (a +1>  0){  %>
		 <div style="position:absolute; top:15px; right:40%; color:#f6a127; font-size:1em; display:"><% =weixin_api.Tool.user.NickNameS(token, aa.Rows[0]["userid"].ToString())%></div>
         <%} %>
         <%if (a+1 > 1){ %>
		 <div style="position:absolute; top:40px; left:10%; color:#c1c1c1; font-size:1em; display:"><% =weixin_api.Tool.user.NickNameS(token, aa.Rows[1]["userid"].ToString())%></div>
         <% }%>
         <%if (a+1 >2){ %>
		 <div style="position:absolute; top:40px; right:10%; color:#ffa779; font-size:1em; display:"><% =weixin_api.Tool.user.NickNameS(token, aa.Rows[2]["userid"].ToString())%></div>
         <%} %>
         <%if (a +1>  0){  %>
		 <i class="xfue" style="top:40%; left:15%;"><img src="<% =weixin_api.Tool.user.headimgurl(token, aa.Rows[0]["userid"].ToString())%>" width="83" height="83" alt=""/></i>
         <% }%>
         <%if (a+1 > 1){ %>
		 <i class="xfue" style="top:30%; left:45%;"><img src="<% =weixin_api.Tool.user.headimgurl(token, aa.Rows[1]["userid"].ToString())%>" width="83" height="83" alt=""/></i>
         <% }%>
         <%if (a+1 >2){ %>
		 <i class="xfue" style="top:42%; right:13.5%;"><img src="<% =weixin_api.Tool.user.headimgurl(token, aa.Rows[2]["userid"].ToString())%>" width="83" height="83" alt=""/></i>
         <%} %>
         <%} %>
        <div><img src="images/eds.jpg" width="100%" alt="/"></div>
  </section>
  <section class="mgtb" style="padding:0 3.8%;"> 
	  <div style=" background: #fff; border-radius:0 0 10px 10px; margin:0 0 10px 0">
       <table border="0" cellspacing="0" cellpadding="0" class="zxcb_list">
  <tbody>
      <%for (int i = 3; i < aa.Rows.Count; i++){ %>
    <tr>
      <td width="15%"><strong><% = i+1%></strong></td>
      <td width="10%"><i class="zb_wd_img fl"><img src="<% = weixin_api.Tool.user.headimgurl(token, aa.Rows[i]["userid"].ToString())%>" width="83" height="83" alt=""/></i></td>
      <td width="50%"><%  = weixin_api.Tool.user.NickNameS(token, aa.Rows[i]["userid"].ToString())%></td>
      <td width="25%"><span class="fontblack"><%=aa.Rows[i]["shaketimes"].ToString()%></span></td>
      </tr>
      <%} %>
    
  </tbody>
</table></div>
        </section>
</div>
</body></html>
