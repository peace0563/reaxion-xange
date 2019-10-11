<%@page import="java.util.Date" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conne.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            function msg_sent(){
                alert("REQUEST SUBMITTED!!!"); }
        </script>
        
        <script type="text/javascript">
            window.onload=msg_sent();
        </script>
        <meta http-equiv="Refresh" content="1; url=/reaxion-xange/jsp/profile.jsp">
        <title>Register Exchange Request!!!</title>
    </head>
    <%
        PreparedStatement pst,pst1;
        String sess_un,m_have,m_want,amt,gv,dtt,te;
        int count;
        m_have=request.getParameter("t1");
        m_want=request.getParameter("t2");
        amt=request.getParameter("t3");
        gv=request.getParameter("t4");
        sess_un=(String)session.getAttribute("s1");
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("Select count(*) from exchange_request_active where st_id='"+sess_un+"';");
        
        Date d=new Date();
        dtt= (d.getYear()+1900)+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();       
        
            while(rs.next())
            {
                count=Integer.parseInt(rs.getString(1));
                if(count>=3)
                        {
                            out.println("<h3>User can only have 3 Active Exchange Requests.</h3>");
                        }
              else
                {
            try{
                               
            pst=con.prepareStatement("insert into  exchange_request_active(st_id,exch_from,exch_to,req_date,amount,gv_info) values(?,?,?,?,?,?)");
            pst.setString(1,sess_un);
            pst.setString(2,m_have);
            pst.setString(3,m_want);
            pst.setString(4,dtt);
            pst.setString(5,amt);
            pst.setString(6,gv);
            int x=pst.executeUpdate();
            if(x==1)
            {
                pst1=con.prepareStatement("insert into activity_logs(st_id,activity_date_time,activity) values(?,?,?)");
                pst1.setString(1,sess_un);
                pst1.setString(2,dtt);
                pst1.setString(3,"Exchange Request");
                int x1=pst1.executeUpdate();
                
            }
        }
         
        catch(Exception e)
        {
            out.println("<h2 style=\"color:red;\">"+e+"</h2>");
        }
        }
            }
        %>
</html>
