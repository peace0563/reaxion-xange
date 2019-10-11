<%@page import="java.util.Date" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conne.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            function msg_sent(){
                alert("ADMIN APPOINTED"); }
        </script>
        
        <script type="text/javascript">
            window.onload=msg_sent();
        </script>
        <meta http-equiv="Refresh" content="0; url=/reaxion-xange/jsp/ADMIN.jsp">
        <title>Update Profile</title>
    </head>
    <body>
        <%
            Date d=new Date();
            try{
        PreparedStatement pst,pst1;
        String st_id,dtt,sess_un;
        dtt= (d.getYear()+1900)+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
        st_id=request.getParameter("t1");
        sess_un=(String)session.getAttribute("s1");
        
       
        pst=con.prepareStatement("update users set type='admin' where st_id=?");
			pst.setString(1,st_id);	
			int x=pst.executeUpdate();
			if(x==1)
			{
                        pst1=con.prepareStatement("insert into activity_logs(st_id,activity_date_time,activity) values(?,?,?)");
                        pst1.setString(1,sess_un);
                        pst1.setString(2,dtt);
                        pst1.setString(3,"Appointed Admin");
                        int x1=pst1.executeUpdate();
			}
		}
                catch(Exception e)
		{
			out.println("<h2 style=\"color:red;\">"+e+"</h2>");
		}
        
     
        
        %>
    </body>
</html>
