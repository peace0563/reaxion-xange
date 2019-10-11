
<%@page import="java.util.Date" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conne.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            function msg_sent(){
                alert("ACCOUNT DELETED"); }
        </script>
        
        <script type="text/javascript">
            window.onload=msg_sent();
        </script>
        <meta http-equiv="Refresh" content="1; url=/reaxion-xange/index.html">
        <title>Delete Profile</title>
    </head>
    <body>
        <% 
            String sess_un,dtt;
            Date d=new Date();
            dtt= (d.getYear()+1900)+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();       
            
            PreparedStatement ps,ps1,ps2,ps3,pst1;
            sess_un=(String)session.getAttribute("s1");
            if(sess_un.equals("21170169"))
            {
                out.println("This Profile can not be deleted");
            }
            else
            {
        try{
            ps1=con.prepareStatement("delete from exchange_request_active where st_id='"+sess_un+"';");
            int x4=ps1.executeUpdate();
            ps3=con.prepareStatement("delete from activity_logs where st_id='"+sess_un+"';");
            int x3=ps3.executeUpdate();
            ps=con.prepareStatement("delete from users where st_id='"+sess_un+"';");
            int x=ps.executeUpdate();
            if(x!=0 && x3!=0)
            {
                session.removeAttribute("s1");
                session.removeAttribute("s2");
                session.removeAttribute("s3");
                session.removeAttribute("n1");              
            }
        }
        catch(Exception e)
        {
            out.println("<h2 style=\"color:red;\">"+e+"</h2>");
        }
            }
            %>
    </body>
</html>
