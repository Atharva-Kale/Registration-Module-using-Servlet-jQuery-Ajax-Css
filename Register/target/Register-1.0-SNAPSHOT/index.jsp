<%--
  Created by IntelliJ IDEA.
  User: Atharva
  Date: 05-06-2023
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP Page</title>

    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


    <script
            src="https://code.jquery.com/jquery-3.7.0.min.js"
            integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
            crossorigin="anonymous"></script>

</head>
<body style="background: url(Image/1.jpg);background-size: cover;background-attachment: fixed">
<div class="container">
    <div class="row">
        <div class="col m6 offset-m3">

            <div class="card">
                <div class="card-content">
                    <h3 style="margin-top: 10px;" class="center-align">Register here</h3>
                    <h5 id="msg"></h5>
                    <div class="form center-align">
                        <form action="Register"  method="get" id="myForm">
                            <input type="text" name="user_name" placeholder="Enter user name">
                            <input type="password" name="user_password" placeholder="Enter user password">
                            <input type="email" name="user_email" placeholder="Enter user email">

                            <div class="file-field input-field">
                                <div class="btn">
                                    <span>File</span>
                                    <input name="image" type="file" placeholder="Select the Image File">
                                </div>
                                <div class="file-path-wrapper">
                                    <input class="file-path validate" type="text" placeholder="Select the Image File">
                                </div>
                            </div>

                            <button type="submit" class="btn light-blue accent-3">Submit</button>

                        </form>
                    </div>

                    <div class="loader center-align" style="margin-top:10px; display: none">
                        <div class="preloader-wrapper big active">
                            <div class="spinner-layer spinner-blue">
                                <div class="circle-clipper left">
                                    <div class="circle"></div>
                                </div><div class="gap-patch">
                                <div class="circle"></div>
                            </div><div class="circle-clipper right">
                                <div class="circle"></div>
                            </div>
                            </div>

                            <div class="spinner-layer spinner-red">
                                <div class="circle-clipper left">
                                    <div class="circle"></div>
                                </div><div class="gap-patch">
                                <div class="circle"></div>
                            </div><div class="circle-clipper right">
                                <div class="circle"></div>
                            </div>
                            </div>

                            <div class="spinner-layer spinner-yellow">
                                <div class="circle-clipper left">
                                    <div class="circle"></div>
                                </div><div class="gap-patch">
                                <div class="circle"></div>
                            </div><div class="circle-clipper right">
                                <div class="circle"></div>
                            </div>
                            </div>

                            <div class="spinner-layer spinner-green">
                                <div class="circle-clipper left">
                                    <div class="circle"></div>
                                </div><div class="gap-patch">
                                <div class="circle"></div>
                            </div><div class="circle-clipper right">
                                <div class="circle"></div>
                            </div>
                            </div>
                        </div>
                        <h5>Please Wait...</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--  <script--%>
<%--          src="https://code.jquery.com/jquery-migrate-3.4.1.min.js"--%>
<%--          integrity="sha256-UnTxHm+zKuDPLfufgEMnKGXDl6fEIjtM+n1Q6lL73ok="--%>
<%--          crossorigin="anonymous"></script>--%>
<script>
    $(document).ready(function (){
        console.log("Page is ready.....")
        $("#myForm").on('submit',function(event){
          event.preventDefault();
          // var f=$(this).serialize();
          let f=new FormData(this);
          console.log(f);

          $(".loader").show();
          $(".form").hide();

          $.ajax({
              url:"Register",
              data:f,
              type:'GET',
              success:function (data,textStatus,jqXHR){
                  console.log(data);
                  console.log("success....")
                  $(".loader").hide();
                  $(".form").show();
                  if(data.trim()==='done'){
                      $('#msg').html("Successfully Registered!!")
                  }else{
                      $('#msg').html("Something went wrong on server...!!")
                  }
              },
              error:function (jqXHR,textStatus,errorThrown){
                  console.log(data);
                  console.log("error...")
                  $(".loader").hide();
                  $(".form").show();
                  $('#msg').html("Something went wrong on server...!!")
              },
              processData:false,
              contentType:false

          })
        })
    })
</script>
</body>
</html>
