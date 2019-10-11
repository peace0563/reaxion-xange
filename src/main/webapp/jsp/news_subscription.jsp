
<%@page errorPage="error.jsp" import="java.util.Date" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conne.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            function msg_sent(){
                alert("Subscription Request Submitted!!!"); }
        </script>
        
        <script type="text/javascript">
            window.onload=msg_sent();
        </script>
        <meta http-equiv="Refresh" content="1; url=/reaxion-xange/index.html">
        <title>Subscribe</title>
    </head>
    <body>
        <%
             PreparedStatement pst;
        String em;
        em=request.getParameter("t1");
            try{
      
        pst=con.prepareStatement("insert into news_subs values(?);");
			pst.setString(1,em);	
			int x=pst.executeUpdate();
	        }
                catch(Exception e)
		{
			if(e.getMessage().contains("already"))
                        {
                            out.println("<h2 style=\"color:red;\">You have subscribed before</h2>");
                        }
                        else
                        {
                            out.println("<h2 style=\"color:red;\">"+e+"</h2>");
                        }
		}
        %>
    </body>
</html>
