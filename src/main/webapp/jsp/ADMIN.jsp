
<%@page errorPage="error.jsp" import="java.util.Date" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conne.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="Stylesheet" type="text/css" href="/reaxion-xange.herokuapp.com/css/menu.css" >
	<link rel="Stylesheet" type="text/css" href="/reaxion-xange.herokuapp.com/css/style.css" >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        .kjh{
	width:200px;
	height:150px;
	background:#000;
	color:#fff;
	top:31%;
	left:20%;
	position:absolute;
	transform:translate(-50%,-50%);
	box-sizing: border-box;
	padding:11px 11px;
        font-weight:bold;
        border: 2px solid red;
}
.kjh input{
	width:100%;
	margin-bottom:20px;
}

.kjh input[type="text"]{
	border:none;
	border-bottom: 1px solid #fff;
	background:transparent;
	outline:none;
	height:40px;
	color:#fff;
	font-size:16px;
}
.kjh  input[type="submit"]{
	border:none;
	outline:none;
	height:40px;
	background:#fb2525;
	color:#000;
        font-weight: bold;
	font-size:18px;
	border-radius:20px;
}
.kjh input[type="submit"]:hover{
	cursor:pointer;
	background:#ffc107;
	color:#000;
}
.kjh a:hover{
	color:#ffc107;
}
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
        <title>ADMIN PANEL</title>
    </head>
    <body>
        <% 
            String sess_un,sess_pd,sess_logTime,sess_nm,first_nm;
            sess_nm=(String)session.getAttribute("n1");
            sess_un=(String)session.getAttribute("s1");
            sess_pd=(String)session.getAttribute("s2");
            sess_logTime=(String)session.getAttribute("s3");
            first_nm=sess_nm.substring(0, sess_nm.indexOf(" "));
            out.println("<h3 class=\"dev\">Welcome,Sir "+first_nm+"</h3><br>");
        %>
        <header>
		<div>
                    <ul>
                            <li><a href="updateprofile.jsp" onclick="return updt_alert()">Update Profile</a></li>
                            <li><a href="check_contact_us_msg.jsp" >Check Messages from Contact us page</a></li>
                                <li><a href="check_activity_log.jsp">Check Activity Log</a></li>
                                <li><a href="show_all_user_info.jsp">Show ALL USER info</a></li>
                                <li><a href="logout.jsp" onclick="return logout()">Logout</a></li>
			</ul>
		</div>
	</header>
        
        <form class="kjh" name="f2" method="post" action="delete_another_prof.jsp" onsubmit="return conf()">
                DELETE USER PROFILE<br>
                        <input type="text" name="t1" placeholder="Enter his Student ID" maxlength="8" required>
                        <input type="submit" value="Delete">
        </form>
        <form style="left:34.5%; " class="kjh" name="f1" method="post" action="show_user_info.jsp">
                SHOW USER DETAILS<br>
                        <input type="text" name="t1" placeholder="Enter his Student ID" maxlength="8" required>
                        <input type="submit" value="Show">
        </form>
        <form style="left:49%; " class="kjh" name="f2" method="post" action="appointadmin.jsp">
                APPOINT ADMIN<br>
                        <input type="text" name="t1" placeholder="Enter his Student ID" maxlength="8" required>
                        <input type="submit" value="Appoint">
        </form>
        <form style="left:63.5%; " class="kjh" name="f3" method="post" action="user_vad.jsp">
                VALIDATE USER<br>
                        <input type="text" name="t1" placeholder="Enter his Student ID" maxlength="8" required>
                        <input type="submit" value="Validate">
        </form>
        <form style="left:78%; " class="kjh" name="f4" method="post" action="delete_user_request.jsp">
                DELETE EXCH. REQ.<br>
                        <input type="text" name="t1" placeholder="Enter request number" required>
                        <input type="submit" value="Delete">
        </form>
        <br><br><br><br><br><br><br><br><br><br>
        <table>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile Number</th>
                <th>Gender</th>
                <th>UPI</th>
            </tr>
            <tr style="border: 0px solid ;">
                <td style="border: 0px solid ;" >&nbsp;</td> 
            </tr>
        <% 
        int count=0;
        
            try{
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("Select st_id,name,email,mobile,gender,upi from users where valid='NO'");
                       
            while(rs.next())
            {
                ++count;
                out.println("<tr>");
                out.println("<td><h3><a href=\"show_user_info.jsp?t1="+rs.getString(1)+"\">"+rs.getString(1)+"</h3></td>");
                out.println("<td>"+rs.getString(2)+"</td>");
                out.println("<td>"+rs.getString(3)+"</td>");
                out.println("<td>"+rs.getString(4)+"</td>");
                out.println("<td>"+rs.getString(5)+"</td>");
                out.println("<td>"+rs.getString(6)+"</td>");
                out.println("</tr>");
            }
            if(count==0)
            {   out.println("<tr>");
                out.println("<td colspan=\"6\"><h1>NO NON-Valid users found!!!</h1></td>");
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
