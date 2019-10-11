
<%@page errorPage="error.jsp" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conne.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="Stylesheet" type="text/css" href="/reaxion-xange/css/menu.css" >
	<link rel="Stylesheet" type="text/css" href="/reaxion-xange/css/style.css" >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <script>
            function conf()
            {
            return confirm("Do you really want to delete your account ?");
            }
            function updt_alert()
            {
            return confirm("Alert: Once you submit your details for updation, you will be immediately logged out and your details will be sent for validation which could take 3 to 4 hours. Do you really want to proceed ?"); 
            }
            function logout()
            {
            return confirm("Are you sure ?"); 
            }
        </script>
        <style>
            
        td,tr{
            color: #ffff99;
        text-align: center;
        border: 2px solid ;
        border-color:red;
        height: 50px;
        word-wrap: break-word;
        margin: 5px;
        }
        
        th{
            color: #99ffcc;
            text-align: center; 
            height: 45px;
            border: 2px solid ;
            text-decoration: underline;
            border-color:red;
        }
        table {
        table-layout: fixed;
        align-content: center;
        background:#111111;
	color:#fff;
        border: 1px solid red;
	box-sizing: border-box;
	padding:10px 10px;
        width:100%;
        }
        </style>
        
        
    </head>
    <body>
        
        <header>
		<div>
			<ul>
				<li><a href="deleteprofile.jsp" onclick="return conf()">Delete Profile</a></li>
                                <li><a href="updateprofile.jsp" onclick="return updt_alert()">Update Profile</a></li>
                                <li><a href="view_requests.jsp">View your requests</a></li>
                                <li><a href="/reaxion-xange/request_reg_form.html">Register an exchange request</a></li>
                                <li><a href="logout.jsp" onclick="return logout()">Logout</a></li>
			</ul>
		</div>
	</header>
        <br><br>
        <table>
            <tr>
                <th><h2>Request number</h2></th>
                <th><h2>Mode Have</h2></th>
                <th><h2>GV info(if any)</h2></th>
                <th><h2>Mode Want</h2></th>
                <th><h2>Date-time</h2></th>
                <th><h2>Amount</h2></th>
            </tr>
            <tr style="border: 0px solid ;">
                <td style="border: 0px solid ;" >&nbsp;</td> 
            </tr>
       <% 
            String sess_un,sess_pd,sess_logTime,sess_name,first_nm;
            sess_un=(String)session.getAttribute("s1");
            sess_pd=(String)session.getAttribute("s2");
            sess_logTime=(String)session.getAttribute("s3");
            sess_name=(String)session.getAttribute("n1");
            first_nm=sess_name.substring(0, sess_name.indexOf(" "));
            out.println("<h1 class=\"dev\">Welcome, "+first_nm+"</h1>");
            int count=0;
       
        try{
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("Select exch_from,exch_to,req_date,amount,gv_info,req_no,st_id from exchange_request_active");
           
            while(rs.next())
            {
                ++count;
                out.println("<tr>");
                out.println("<td><h2><a href=\"show_user_info.jsp?t1="+rs.getString(7)+"\">"+rs.getString(6)+"</h2></td>");
                out.println("<td>"+rs.getString(1)+"</td>");
                out.println("<td>"+rs.getString(5)+"</td>");
                out.println("<td>"+rs.getString(2)+"</td>");
                out.println("<td>"+rs.getString(3)+"</td>");
                out.println("<td>"+rs.getString(4)+"</td>");
                out.println("</tr>");
            }
            if(count==0)
            {   out.println("<tr>");
                out.println("<td colspan=\"6\"><h1>No Requests Found!!!</h1></td>");
                out.println("</tr>");
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
