<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/20
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/img/ThreeWebGL.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/img/ThreeExtras.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/img/Detector.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/img/RequestAnimationFrame.js"></script>
    <title>The User Login</title>
</head>
<body>


<div class="content">
    <div id="pane" class="flip">
        <div id="login" class="front">
            <form action="LoginServlet" onsubmit="return checkcode();" class="container">
                <h2>User Login</h2>
                <div class="row100">
                    <div class="col">
                        <div class="inputBox">
                            <input type="text" name="uid" required="required">
                            <span class="text">Account</span>
                            <span class="line"></span>
                        </div>
                    </div>
                    <div class="col">
                        <div class="inputBox">
                            <input type="password" name="pwd" required="required">
                            <span class="text">Password</span>
                            <span class="line"></span>
                        </div>
                    </div>
                </div>
                <div class="row100">
                    <div class="col">
                        <div class="inputBox">
                            <input id="validate" name="code" maxlength="4" type='text' name="ValidateNum" autocomplete="off" required="required" style="width: 300px;">
                            <span class="text">Vlidate</span><canvas class="J_codeimg" id="myCanvas"></canvas>
                            <span class="line"></span>
                        </div>

                    </div>
                </div>
                <div class="row100">
                    <div class="col">
                        <input type="submit" value="Login" style="margin-left: 36px;"/>
                        <input id="registerbtn" type="button" value="register" style="padding: 7px 23px;margin-left: 125px"/>
                    </div>
                </div>
            </form>
        </div>

        <div id="register" class="back">
            <form action="RegisterServlet"  class="container" method="post">
                <h2>User Register</h2>
                <div class="row100">
                    <div class="col" style="top:15px;">
                        <div class="inputBox">
                            <input type="text" name="uname" required="required">
                            <span class="text">Name</span>
                            <span class="line"></span>
                        </div>
                    </div>
                    <div class="col" style="top:25px;">
                        <div class="inputBox" >
                            <input type="text" name="phone" required="required">
                            <span class="text">Phone</span>
                            <span class="line"></span>
                        </div>
                    </div>
                </div>

                <div class="row100">
                    <div class="col" style="top:50px;">
                        <input id="loginbtn" type="button" value="Login" style="margin-left: 36px;">
                        <input type="submit" value="Register" style="padding: 7px 23px;margin-left: 125px"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">

    $("#registerbtn").bind("click",function(){
        var a=document.getElementById("pane");
        a.style.transform="rotateY(180deg)";
    });
    $("#loginbtn").bind("click",function(){
        var a=document.getElementById("pane");
        a.style.transform="rotateY(360deg)";
    });


    var Vcode;
    function createCode() {
        var code = "";
        $.ajax({
            type: "post",
            url: "VerifyServlet",
            success: function (data) {
                var s = data.toString();
                console.log(s);
                Vcode = s;
                var c = document.getElementById("myCanvas");
                var ctx = c.getContext("2d");
                ctx.clearRect(0, 0, 1000, 1000);
                ctx.font = "80px 'Hiragino Sans GB'";
                ctx.fillStyle = "#45f3ff";
                ctx.fillText(s, 0, 100);
            }
        });

    }


    function checkcode(){
        var icode = $("#validate").val();
        if(icode!=Vcode){
            alert("The Validate Code ERROR!!!");
            createCode();
            return false;
        }else
            return true;
    }

    createCode();

    $("canvas").bind("click",function(){
        createCode();
    });
</script>
<script id="vs" type="x-shader/x-vertex">
			varying vec2 vUv; void main() { vUv = uv; gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 ); }
		</script>
<script id="fs" type="x-shader/x-fragment">
			uniform sampler2D map; uniform vec3 fogColor; uniform float fogNear; uniform float fogFar; varying vec2 vUv; void main() { float depth = gl_FragCoord.z / gl_FragCoord.w; float fogFactor = smoothstep( fogNear, fogFar, depth ); gl_FragColor = texture2D( map, vUv ); gl_FragColor.w *= pow( gl_FragCoord.z, 20.0 ); gl_FragColor = mix( gl_FragColor, vec4( fogColor, gl_FragColor.w ), fogFactor ); }

		</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
<%
    String flag = request.getParameter("flag");
    if (flag==null){flag="";};
    if (flag.equals("1")){
%>
<script>
    alert("(╯﹏╰)b用户名或密码错误！！！");
</script>
<%}%>
</body>
</html>
