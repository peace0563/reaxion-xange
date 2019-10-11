
<%@page errorPage="error.jsp" import="java.util.Date" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conne.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="Stylesheet" type="text/css" href="/reaxion-xange/css/style.css" >
        <link rel="Stylesheet" type="text/css" href="/reaxion-xange/css/menu.css" >
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
        
        form{
        width:200px;
	height:100px;
	background:#000;
	color:#fff;
	top:6%;
	left:74%;
	position:absolute;
	transform:translate(-50%,-50%);
	box-sizing: border-box;
	padding:15px 15px;
        font-weight:bold;
        border-radius:5%;
        }
        input{
	width:90%;
	margin-bottom:10px;
        }

        form input[type="text"]{
	border:none;
	border-bottom: 1px solid #fff;
	background:transparent;
	outline:none;
        color:#fff;
	font-size:16px;
        }
        form  input[type="submit"]{
	border:none;
	outline:none;
	height:20px;
	background:#fb2525;
	color:#fff;
	font-size:18px;
	border-radius:20px;
        }
        form input[type="submit"]:hover{
	cursor:pointer;
	background:#ffc107;
	color:#000;
        }
        </style>
        
        
        <title>Messages || Contact US HTML</title>
    </head>
    <body>
        <header>
		<div>
			<ul>
                              <li><a href="ADMIN.jsp">Back to ADMIN PANEL</a></li>
			</ul>
		</div>
	</header>
        <form name="f2" method="post" action="delete_contact_msg.jsp">
                Delete Message
                        <input type="text" name="t1" placeholder="Enter Date-time" required>
                        <input type="submit" value="Delete">
            </form>
        <h1 class="dev">Messages</h1>
        <br><br>
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile Number</th>
                <th>Message</th>
                <th>Date-Time</th>
            </tr>
            <tr style="border: 0px solid ;">
                <td style="border: 0px solid ;" >&nbsp;</td> 
            </tr>
            
        <%
        String sess_un,dt;
        int count=0;
        PreparedStatement pst1;
        sess_un=(String)session.getAttribute("s1");
        
        Date d=new Date();
        dt= (d.getYear()+1900)+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();       
          
        try{
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("Select name,email,mobile,msg,msg_dt from contact_html_msg");
            
             pst1=con.prepareStatement("insert into activity_logs(st_id,activity_date_time,activity) values(?,?,?)");
                            pst1.setString(1,sess_un);
                            pst1.setString(2,dt);
                            pst1.setString(3,"Checked Contact_us HTML Messages");
                            int x1=pst1.executeUpdate();
            
            while(rs.next())
            {
                ++count;
                out.println("<tr>");
                out.println("<td><h3>"+rs.getString(1)+"</h3></td>");
                out.println("<td>"+rs.getString(2)+"</td>");
                out.println("<td>"+rs.getString(3)+"</td>");
                out.println("<td>"+rs.getString(4)+"</td>");
                out.println("<td>"+rs.getString(5)+"</td>");
                out.println("</tr>");
            }
            if(count==0)
            {   out.println("<tr>");
                out.println("<td colspan=\"5\"><h1>Empty Message Box!!!</h1></td>");
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
