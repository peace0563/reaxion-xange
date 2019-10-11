<%@page errorPage="error.jsp" import="java.util.Date" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conne.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title> Register Here</title>
	<link rel="Stylesheet" type="text/css" href="/reaxion-xange/css/detail.css" >
	<link rel="Stylesheet" type="text/css" href="/reaxion-xange/css/menu.css" >
</head>
<body>
    
    <img src="/reaxion-xange/images/l2.jpg" class="a1">
    <h1>USER INFO</h1>
    <table class="log">
        <%
        String sess_un,dt,target;
        int count=0;
        PreparedStatement pst1;
        sess_un=(String)session.getAttribute("s1");
        target=request.getParameter("t1");
        Date d=new Date();
        dt= (d.getYear()+1900)+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();       
          
        try{
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("Select name,st_id,email,mobile,address,upi,gender,Date_reg,valid from users where st_id='"+target+"';");
            
             pst1=con.prepareStatement("insert into activity_logs(st_id,activity_date_time,activity) values(?,?,?)");
                            pst1.setString(1,sess_un);
                            pst1.setString(2,dt);
                            pst1.setString(3,"Checked User info");
                            int x1=pst1.executeUpdate();
            
            while(rs.next())
            {
                ++count;
                out.println("<tr><td>NAME:<br>&nbsp</td><td>&nbsp "+rs.getString(1)+"<br>&nbsp</td></tr>");
                out.println("<tr><td>STUDENT ID:<br>&nbsp</td><td>&nbsp "+rs.getString(2)+"<br>&nbsp</td></tr>");
                out.println("<tr><td>E-MAIL:<br>&nbsp</td><td>&nbsp "+rs.getString(3)+"<br>&nbsp</td></tr>");
                out.println("<tr><td>PHONE NUMBER:<br>&nbsp</td><td>&nbsp "+rs.getString(4)+"<br>&nbsp</td></tr>");
                out.println("<tr><td>ADDRESS:<br>&nbsp</td><td>&nbsp "+rs.getString(5)+"<br>&nbsp</td></tr>");
                out.println("<tr><td>UPI:<br>&nbsp</td><td>&nbsp "+rs.getString(6)+"<br>&nbsp</td></tr>");
                out.println("<tr><td>GENDER:<br>&nbsp</td><td>&nbsp "+rs.getString(7)+"<br>&nbsp</td></tr>");
                out.println("<tr><td>DATE OF REG.<br>&nbsp</td><td>&nbsp "+rs.getString(8)+"<br>&nbsp</td></tr>");
                out.println("<tr><td>VALID:<br>&nbsp</td><td>&nbsp "+rs.getString(9)+"<br>&nbsp</td></tr>");
            }
            if(count==0)
            {   out.println("<tr>");
                out.println("<td><h1>User Not Found</h1></td>");
                out.println("</tr>");
            }
                
            con.close();
        }
                        
        catch(Exception e)
        {
            out.println("<h2 style=\"color:red;\">"+e+"</h2>");
        }
        
        %>
         </table>
    </body>
</html>
