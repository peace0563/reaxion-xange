
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        Class.forName("org.postgresql.Driver");
            Connection con=DriverManager.getConnection("jdbc:postgresql://ec2-23-21-225-251.compute-1.amazonaws.com:5432/d585vuc344oam0?stringtype=unspecified&sslmode=require","isjeoyksxgubqt","1cc1bb6cc3533a9b8acdbc9bdca920afbf6e630dde47be5e05041db5c0d86bca");
     %>