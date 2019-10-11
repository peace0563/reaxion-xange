
<%@page import="java.util.Date" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conne.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Exchange Request</title>
    </head>
    <body>
        <% 
            String sess_un,req_num,dtt,type;
            req_num=(String)request.getParameter("t1");
            Date d=new Date();
            dtt= (d.getYear()+1900)+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();       
            sess_un=(String)session.getAttribute("s1");
            type=(String)session.getAttribute("type");
            PreparedStatement ps,pst1;
            if(type.equals("admin"))
            {
                ps=con.prepareStatement("delete from exchange_request_active where req_no='"+req_num+"';");
            }
            else
            {
                ps=con.prepareStatement("delete from exchange_request_active where req_no='"+req_num+"' AND st_id='"+sess_un+"';");
            }
        try{
            
            int x=ps.executeUpdate();
            if(x==1)
            {
                pst1=con.prepareStatement("insert into activity_logs(st_id,activity_date_time,activity) values(?,?,?)");
                pst1.setString(1,sess_un);
                pst1.setString(2,dtt);
                if(type.equals("admin"))
                {
                    pst1.setString(3,"Admin Deleted user Request");
                }
                else
                {
                pst1.setString(3,"Deleted his/her Request");
                }
                int x1=pst1.executeUpdate();
                if(type.equals("admin"))
                response.sendRedirect("/reaxion-xange/jsp/ADMIN.jsp");
                else
                    response.sendRedirect("/reaxion-xange/jsp/view_requests.jsp");
            }
            if(x==0)
            {
                out.println("<h1>ERROR : REQUEST DOESN'T EXISTS / CAN'T DELETE OTHER USERS REQUEST</h1>");
            }
        }
        catch(Exception e)
        {
            out.println("<h2 style=\"color:red;\">"+e+"</h2>");
        }
            %>
    </body>
</html>
