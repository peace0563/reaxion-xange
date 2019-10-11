

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile</title>
        <script type="text/javascript" src="/reaxion-xange/js/cm.js"></script>
        <link rel="Stylesheet" type="text/css" href="/reaxion-xange/css/menu.css" >
	<link rel="Stylesheet" type="text/css" href="/reaxion-xange/css/style.css" >
    </head>
    <body>
        <div>
			<ul>
				<li><a href="profile.jsp">Back to Profile</a></li>
			</ul>
		</div>
                <h1 class="dev">Profile Updation</h1>
	<div class="lo" style="height: 560px;">
                <h1>UPDATION</h1>
                <form name="f1" method="post" action="updatedata.jsp" onsubmit="return validate()">
				<label>New E-mail ID:</label>
				<input type="email" name="t1" placeholder="E-mail"><br>
				<label>New Mobile Number:</label>
				<input type="text" name="t3" placeholder=" +91 Excluded" maxlength="10">
                                <label>New UPI Address</label>
				<input type="email" name="t5" placeholder="UPI Address">
                                <label>New Password:</label>
				<input type="password" name="t2" placeholder="Password">
                                <label>Confirm New Password:</label>
				<input type="password" name="t4" placeholder="Confirm Password">
                                <input type="submit" value="Update">
		</form>
	</div>
    </body>
</html>
