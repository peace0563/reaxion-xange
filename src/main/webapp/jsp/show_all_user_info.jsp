
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
        </style>
        
        
        <title>ALL USER INFO</title>
    </head>
    <body>
        <header>
		<div>
			<ul>
                              <li><a href="ADMIN.jsp">Back to ADMIN PANEL</a></li>
			</ul>
		</div>
	</header>
        <h1 class="dev">ALL USER INFO</h1>
        <br><br>
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
        String sess_un,dt;
        int count=0;
        PreparedStatement pst1;
        sess_un=(String)session.getAttribute("s1");
        
        Date d=new Date();
        dt= (d.getYear()+1900)+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();       
          
        try{
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("Select st_id,name,email,mobile,gender,upi from users");
            
             pst1=con.prepareStatement("insert into activity_logs(st_id,activity_date_time,activity) values(?,?,?)");
                            pst1.setString(1,sess_un);
                            pst1.setString(2,dt);
                            pst1.setString(3,"Checked All user info");
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
                out.println("<td>"+rs.getString(6)+"</td>");
                out.println("</tr>");
            }
            if(count==0)
            {   out.println("<tr>");
                out.println("<td colspan=\"6\"><h1>No users found!!!</h1></td>");
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
