package com.example.register;

import java.io.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@MultipartConfig
@WebServlet(name = "helloServlet", value = "/Register")
public class Register extends HttpServlet {
    private String message;

    public void init() {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();

        String name=request.getParameter("user_name");
        String email=request.getParameter("user_email");
        String password=request.getParameter("user_password");
        Part part=request.getPart("image");
        String filename=part.getSubmittedFileName();
        out.println(filename);




        try{
            Thread.sleep(3000);
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","password");

            String q="insert into user(name,password,email,imageName) values(?,?,?,?)";

            PreparedStatement pstmt=con.prepareStatement(q);
            pstmt.setString(1,name);
            pstmt.setString(2,password);
            pstmt.setString(3,email);
            pstmt.setString(4,filename);
            pstmt.executeUpdate();

            InputStream is=part.getInputStream();
            byte []data=new byte[is.available()];

            is.read(data);
            String path=request.getRealPath("/")+"Image"+File.separator+filename;
            FileOutputStream fos=new FileOutputStream(path);
            fos.write(data);
            fos.close();
            out.println("done");

        }
        catch(Exception e){
            e.printStackTrace();
            out.println("error");
        }

    }

    public void destroy() {
    }
}