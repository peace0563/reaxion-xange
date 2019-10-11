
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conne.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User ajax</title>
    </head>
    <body>
        <%
            String nom,flag="ZERO";
            nom=(String)(request.getParameter("val"));
            try{
            Statement stmt=con.createStatement();
            
            ResultSet rs=stmt.executeQuery("Select st_id from users");
            
            while(rs.next())
            {
                if(nom.equals(rs.getString(1)))
                        {
                            flag="ONE";
                        }
                  }
            
                if(flag.equals("ONE"))
                {
                    out.print("Student ID already exists");
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
