<HTML>
<HEAD>
    <TITLE>Logging test</TITLE>
    <%@ page import="org.apache.logging.log4j.*" %>
</HEAD>
<BODY>

<H1>WebApp JSP Log4j Test - It will same as service layer in your web application</H1>

<h3>Apache Log4j Logging version 2</h3>

<%
    Logger logger = LogManager.getLogger();
    if("submit".equals((String)request.getParameter("log"))) {
        String text = (String)request.getParameter("text");
        String level = (String)request.getParameter("level");
        logger.log(Level.toLevel(level), text);
    }
%>

<form action="" method="GET">
    <TABLE border="1">
        <TR valign=top>
            <TH align=left>Level</TH>
            <TH align=left>Test Message</TH>
        </TR>
        <TR valign=top>
            <TD>
                <select name="level">
                    <option value="ERROR">ERROR</option>
                    <option value="WARN">WARN</option>
                    <option value="INFO" selected="selected">INFO</option>
                    <option value="DEBUG">DEBUG</option>
                    <option value="TRACE">TRACE</option>
                </select>
            </TD>
            <TD>
                <input name="text" type="text" size="35" value="<%=new java.util.Date()%>">
                <input name="log" type="submit" value="submit">
            </TD>
        </TR>
    </TABLE>
</form>

</BODY>
</HTML>