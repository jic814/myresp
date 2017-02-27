<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="com.infosoft.sys.*"%>
<%@ page import="com.infosoft.common.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<TITLE>中信银行信用卡中心档案管理系统</TITLE>
<link rel="stylesheet" href="style.css" type="text/css">
<SCRIPT language=JavaScript>
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->

	function actionForm(){
		document.forms["logonForm"].action = "./LGN/LoginServlet";
		document.forms["logonForm"].submit();
		//
	}
</SCRIPT>

<%
     String webAppPath1=session.getServletContext().getRealPath("/");
	 ConversionBean conversionBean = new ConversionBean();
	 conversionBean.setSql("select informationCode from SystemInformation where isActive='Y'");
	 String informationCode = conversionBean.getConversionBean();
     SystemInformationBean systemInformationBean = new SystemInformationBean();
     systemInformationBean.setInformationCode(informationCode);
     systemInformationBean.setWebAppPath(webAppPath1);
     systemInformationBean.content();
%>
<SCRIPT language=JavaScript>
function showClientHeight(){         
  //-------相对中心的位置

  document.getElementById("Layer1").style.top=document.body.scrollHeight/2-<%=(String)systemInformationBean.getNameY()%>;
  document.getElementById("Layer1").style.left=document.body.scrollWidth/2-<%=(String)systemInformationBean.getNameX()%>;

  document.getElementById("Layer2").style.top=document.body.scrollHeight/2+<%=(String)systemInformationBean.getCopyrightY()%>;
  document.getElementById("Layer2").style.left=document.body.scrollWidth/2-<%=(String)systemInformationBean.getCopyrightX()%>;
  
  document.getElementById("Layer3").style.top=document.body.scrollHeight/2+<%=(String)systemInformationBean.getContactY()%>;
  document.getElementById("Layer3").style.left=document.body.scrollWidth/2-<%=(String)systemInformationBean.getContactX()%>;

} 
</SCRIPT>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>

<body bgcolor="f1f1f1" onload="showClientHeight()" onresize="showClientHeight()" style="background:url(<%out.print("./SYS/SystemInformationServlet?actionMode=CONTENT&imgFlag=0");%>);background-repeat:no-repeat;background-position:center">

<div id="Layer1" name="Layer1" style="display: <%out.print("N".equals(systemInformationBean.getIsDisplayName())?"none":"");%>;position:absolute; width:629px; height:39px; z-index:1;"> 
  <h1 align="left"><font color="#0000CC"><%out.print(systemInformationBean.getName());%></font></h1>
</div>
<div id="Layer2" style="display: <%out.print("N".equals(systemInformationBean.getIsDisplayCopyright())?"none":"");%>;position:absolute; width:492px; height:17px; z-index:2"><%out.print(systemInformationBean.getCopyright());%></div>
<div id="Layer3" style="display: <%out.print("N".equals(systemInformationBean.getIsDisplayContact())?"none":"");%>;position:absolute; width:617px; height:14px; z-index:3"><%out.print(systemInformationBean.getContact());%></div>
<FORM name=logonForm action="" method="post" target=_top>
<input type="hidden" name="isPass" value="<%=request.getParameter("isPass")==null?"":request.getParameter("isPass")%>">
  <table width="870" height="100%" border="0" align="center">
    <tr> 
      <td width="53%" height="132">&nbsp; </td>
      <td width="47%">&nbsp;</td>
    </tr>
    <tr> 
      <td valign="bottom">&nbsp; </td>
      <td> <table width="79%" height="119" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td colspan="2"> 　　 
              <%  
	
	if(!((String)session.getAttribute("feedbackMessage")==null)&&!("".equals((String)session.getAttribute("feedbackMessage")))){
				  out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+"<font size=2 color=red><b>"+((String)session.getAttribute("feedbackMessage"))+"</b></font>");
                  session.setAttribute("feedbackMessage","");
                  } %> </td>
          </tr>
          <tr>
            <td width="33%"> <div align="right"><strong><font color="#000000">用户名：</font></strong> 
              </div></td>
            <td width="67%"><input name="employeeCode" type="text" style="width:160px" value=""></td>
          </tr>
          <tr> 
            <td height="28"> <div align="right"><strong><font color="#000000">密　码：</font></strong> 
              </div></td>
            <td><input name="password" type="password" style="width:160px"></td>
          </tr>
          <tr>
            <td width="33%"> </td>
            <td width="67%"><strong><font color="red">请修改系统初始密码！</font></strong></td>
          </tr>          
          
          <tr> 
            <td height="30"> <div align="center"></div></td>
            <td> <input class=BtnAction style="CURSOR: hand" type="submit" value="登 录" name="submit1"  onClick="actionForm();" src="images/DL.JPG"> 
              &nbsp;&nbsp; <input class=BtnAction style="CURSOR: hand" type=reset value="清 空" name=reset> 
            </td>
          </tr>
        </table></td>
    </tr>
  </table>
</FORM>
<SCRIPT language=JavaScript>
  <!--
    document.logonForm.employeeCode.focus()
  // -->
</SCRIPT>
</body>
</html>

