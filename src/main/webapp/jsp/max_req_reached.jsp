
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
            String sess_un;
            int count;
            sess_un=(String)session.getAttribute("s1");
            try{
            Statement stmt=con.createStatement();
            
            ResultSet rs=stmt.executeQuery("Select count(*) from exchange_request_active where st_id='"+sess_un+"';");
            
            while(rs.next())
            {
                count=Integer.parseInt(rs.getString(1));
                if(count>=3)
                        {
                            out.println("<h3>User can only have 3 Active Exchange Requests</h3>");
                        }
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
