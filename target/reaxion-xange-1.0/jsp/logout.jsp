
<%@page import="java.util.Date" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conne.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log Out</title>
    </head>
    <body>
        <%
            String sess_un,dtt;
            sess_un=(String)session.getAttribute("s1");
            Date d=new Date();
            dtt= (d.getYear()+1900)+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();       
            try{
            PreparedStatement pst1;
            sess_un=(String)session.getAttribute("s1");
               
                pst1=con.prepareStatement("insert into activity_logs(st_id,activity_date_time,activity) values(?,?,?)");
                pst1.setString(1,sess_un);
                pst1.setString(2,dtt);
                pst1.setString(3,"Logged OUT");
                int x1=pst1.executeUpdate();
           session.removeAttribute("s1");
           session.removeAttribute("s2");
           session.removeAttribute("s3");
           response.sendRedirect("/reaxion-xange/index.html");
            }
            catch(Exception e)
            {
                
                out.println("<h2 style=\"color:red;\">"+e+"</h2>");
            }
            %>
    </body>
</html>
