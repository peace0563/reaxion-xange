<%@page errorPage="error.jsp" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Checking</title>
    </head>
    <body>
        <h1><% int x;
        x=2/0; %></h1>
    </body>
</html>
