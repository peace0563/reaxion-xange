
<%@page import="java.util.Date" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conne.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            function msg_sent(){
                alert("DELETE REQUEST SUBMITTED"); }
        </script>
        
        <script type="text/javascript">
            window.onload=msg_sent();
        </script>
        <meta http-equiv="Refresh" content="3; url=/reaxion-xange/jsp/ADMIN.jsp">
        <title>Delete Other User Profile</title>
    </head>
    <body>
        <% 
            String sess_un,dtt,target;
            Date d=new Date();
            dtt= (d.getYear()+1900)+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();       
            PreparedStatement ps,ps1,ps2,ps3,pst1;
            sess_un=(String)session.getAttribute("s1");
            target=(String)(request.getParameter("t1"));
            try{
            if(target.equals("21170169"))
            {
                out.println("<h1>This Account can not be deleted</h1>");
            }
            else if(sess_un.equals("21170169") && !(target.equals("21170169")))
            {
                
            ps1=con.prepareStatement("delete from exchange_request_active where st_id='"+target+"';");
            int x4=ps1.executeUpdate();
            
            ps3=con.prepareStatement("delete from activity_logs where st_id='"+target+"';");
            int x3=ps3.executeUpdate();
            ps=con.prepareStatement("delete from users where st_id='"+target+"';");
            int x=ps.executeUpdate();
            if(x!=0 && x3!=0)
            {
             pst1=con.prepareStatement("insert into activity_logs(st_id,activity_date_time,activity) values(?,?,?)");
                            pst1.setString(1,sess_un);
                            pst1.setString(2,dtt);
                            pst1.setString(3,"Deleted Another User");
                            int x1=pst1.executeUpdate();
            }
            else
            {
                out.println("<h1>ERROR: Account doesn't exists</h1>");
            }
            }
            else
            {
                Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("Select type from users where st_id='"+target+"';");
            while(rs.next())
            {
                if("user".equals(rs.getString(1)) || sess_un.equals(target))
                {
                ps1=con.prepareStatement("delete from exchange_request_active where st_id='"+target+"';");
            int x4=ps1.executeUpdate();
            ps3=con.prepareStatement("delete from activity_logs where st_id='"+target+"';");
            int x3=ps3.executeUpdate();
            ps=con.prepareStatement("delete from users where st_id='"+target+"';");
            int x=ps.executeUpdate();
            if(x!=0 && x3!=0)
            {
             pst1=con.prepareStatement("insert into activity_logs(st_id,activity_date_time,activity) values(?,?,?)");
                            pst1.setString(1,sess_un);
                            pst1.setString(2,dtt);
                            pst1.setString(3,"Deleted Another User");
                            int x1=pst1.executeUpdate();
            }
            else
            {
                out.println("<h1>ERROR: Account does not exists</h1>");
            }
                }
            else
                {
                    out.println("<h1>ERROR: Can't delete an ADMIN account</h1>");
                }
                }
            
            }
        }
        catch(Exception e)
        {
            out.println("<h2 style=\"color:red;\">"+e+"</h2>");
        }
            
            %>
    </body>
</html>
