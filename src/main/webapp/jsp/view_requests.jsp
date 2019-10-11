
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
	background:#000;
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
        
        
        <title>View Requests </title>
    </head>
    <body>
        <header>
		<div>
			<ul>
                              <li><a href="profile.jsp">Back to Profile</a></li>
			</ul>
		</div>
	</header>
        <form name="f2" method="post" action="delete_user_request.jsp">
                Delete Request
                        <input type="text" name="t1" placeholder="Enter Request Number" required>
                        <input type="submit" value="Delete">
            </form>
        <h1 class="dev">View Requests</h1>
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
        String sess_un,dt;
        int count=0;
        PreparedStatement pst1;
        sess_un=(String)session.getAttribute("s1");
        
        Date d=new Date();
        dt= (d.getYear()+1900)+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();       
          
        try{
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("Select exch_from,exch_to,req_date,amount,gv_info,req_no from exchange_request_active where st_id='"+sess_un+"';");
            
             pst1=con.prepareStatement("insert into activity_logs(st_id,activity_date_time,activity) values(?,?,?)");
                            pst1.setString(1,sess_un);
                            pst1.setString(2,dt);
                            pst1.setString(3,"Viewed his/her requests");
                            int x1=pst1.executeUpdate();
            
            while(rs.next())
            {
                ++count;
                out.println("<tr>");
                out.println("<td><h2>"+rs.getString(6)+"</h2></td>");
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
         </table>
    </body>
</html>
