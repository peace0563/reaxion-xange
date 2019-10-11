

<%@page import="java.util.Date" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conne.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="Stylesheet" type="text/css" href="/reaxion-xange/css/detail.css" >
	<link rel="Stylesheet" type="text/css" href="/reaxion-xange/css/menu.css" >
        <title>Login</title>
    </head>
    <body>
        <header><div><ul><li><a href="/reaxion-xange/index.html">Back to Home</a></li></ul></div></header>
    <%
        String un,pd,flag="ZERO",dt;
        PreparedStatement pst,pst1;
        un=request.getParameter("t1");
        pd=request.getParameter("t2");
        Date d=new Date();
        try{
            
            Statement stmt=con.createStatement();
            
            ResultSet rs=stmt.executeQuery("Select name,st_id,password,type,valid from users");
            
            while(rs.next())
            {
                if(un.equals(rs.getString(2)))
                        {
                            flag="ONE";
                            if(pd.equals(rs.getString(3)))
                            {
                                flag="TWO";
                                if("YES".equalsIgnoreCase(rs.getString(5)))
                                {
                            dt=(d.getYear()+1900)+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
                       
                            pst=con.prepareStatement("update Users set last_login=? where st_id=?");
                            pst.setString(1,dt);	
                            pst.setString(2,un);
                            out.println(pst);
                            int x=pst.executeUpdate();
                            
                           pst1=con.prepareStatement("insert into activity_logs(st_id,activity_date_time,activity) values(?,?,?)");
                            pst1.setString(1,un);
                            pst1.setString(2,dt);
                            pst1.setString(3,"Logged IN");
                            int x1=pst1.executeUpdate();
                                
                                    if("admin".equals(rs.getString(4)))
                                    {
                                        response.sendRedirect("ADMIN.jsp");
                                    }
                                    else
                                    {
                                        response.sendRedirect("profile.jsp");
                                    }
                            session.setAttribute("s1", un);
                            session.setAttribute("s2", pd);
                            session.setAttribute("s3", dt);
                            session.setAttribute("n1", rs.getString(1));
                            session.setAttribute("type", rs.getString(4));
                            }
                                else
                                {
                                    out.println("<h2 style=\"color:red;\">Your Details have not been validated yet.<br>Please try again later!!! or <a href=\"/reaxion-xange/contact.html\">Contact US</a></h2>");
                                }
                        }
                  } }
            
                if(flag=="ONE")
                {
                    out.println("<h2 style=\"color:red;\">Invalid ID or Password.</h2>");
                }
                if(flag=="ZERO")
                {
                    out.println("<h2 style=\"color:red;\">You have not registered yourself.</h2>");
                }
            
            con.close();
        }
        catch(Exception e)
        {
            out.println("<h2 style=\"color:red;\">"+e+"</h2>");
        }
        
        %>
    </body>
</html>
