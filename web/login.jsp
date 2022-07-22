<%--
  Created by IntelliJ IDEA.
  User: Lisa Li
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入css文件 -->
    <link rel="stylesheet" href="./login.css">
    <!-- 引入jquery -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title>登录</title>
    <style>
        .pp1{
            width: 1920px;

            height: 929px;
            background-image:url(./img/b273b58591ad647ff3a309c30eef998855120b38_raw.jpg);



        }
    </style>
</head>
<body>

<div id="clock">
    <p id="date" class="date"></p>
    <p id="time" class="time"></p>
    <p class="text">欢迎来到我的网页</p>
</div>

<script>
    var week = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
    var timerID = setInterval(updateTime, 1000); // 每隔1秒执行一次
    updateTime();

    function updateTime() {
        var cd = new Date();
        document.getElementById("time").innerHTML = zeroPadding(cd.getHours(), 2) + ':' + zeroPadding(cd.getMinutes(),
            2) + ':' + zeroPadding(cd.getSeconds(), 2);
        document.getElementById("date").innerHTML = zeroPadding(cd.getFullYear(), 4) + '-' + zeroPadding(cd.getMonth() +
            1, 2) + '-' + zeroPadding(cd.getDate(), 2) + ' ' + week[cd.getDay()];
    };

    function zeroPadding(num, digit) {
        var zero = '';
        for (var i = 0; i < digit; i++) {
            zero += '0';
        }
        return (zero + num).slice(-digit);
    }
</script>

<div class="pp1">
    <br><br><br><br><br><br><br><br><br><br><br><br>
    <!-- 最外层的大盒子 -->
    <div class="box">

        <!-- 滑动盒子 -->
        <div class="pre-box">
            <h1>欢迎来到张叁三的网页</h1>
            <p>愿风神忽悠你~</p>
            <div class="img-box">
                <img src="./img/waoku.jpg" alt="">
            </div>
        </div>
        <!-- 注册盒子 -->
        <div class="register-form">
            <!-- 标题盒子 -->
            <div class="title-box">
                <h1>注册</h1>
            </div>
            <!-- 输入框盒子 -->
            <div class="input-box">
                <input type="text" placeholder="用户名">
                <input type="password" placeholder="密码">
                <input type="password" placeholder="确认密码">
            </div>
            <!-- 按钮盒子 -->
            <div class="btn-box">
                <button>注册</button>
                <!-- 绑定点击事件 -->
                <p onclick="mySwitch()">已有账号?去登录</p>
            </div>
        </div>

        <!-- 登录盒子 -->
        <div class="login-form">
            <!-- 标题盒子 -->
            <div class="title-box">
                <h1>登录</h1>
            </div>
            <!-- 输入框盒子 -->

            <div style="text-align: center">
                <form action="login" method="post" id="loginForm">
                    <input type="text" placeholder="请输入开发者授权账号" name="uname" id="uname" value="${messageModel.object.userName}">
                    <input type="password" placeholder="请输入开发者授权密码" name="upwd"  id="upwd" value="${messageModel.object.userPwd}">
                    <span id="msg" style="font-size: 12px;color: red"> </span>


                </form>
            </div>


            <!-- 按钮盒子 -->
            <form class="btn-box">

                <button type="button" id="loginBtn">登录</button>

                <!-- 绑定点击事件 -->
                <p onclick="mySwitch()">没有授权账户?去注册</p>
            </form>

        </div>
    </div>
</div>

<script>
    // 滑动的状态
    let flag=true
    const mySwitch=()=>{
        if(flag){
            // 获取到滑动盒子的dom元素并修改它移动的位置
            $(".pre-box").css("transform","translateX(100%)")
            // 获取到滑动盒子的dom元素并修改它的背景颜色
            $(".pre-box").css("background-color","#c9e0ed")
            //修改图片的路径
            $("img").attr("src","./img/wuwu.jpeg")

        }
        else {
            $(".pre-box").css("transform","translateX(0%)")
            $(".pre-box").css("background-color","#edd4dc")
            $("img").attr("src","./img/waoku.jpg")
        }
        flag=!flag
    }
</script>
</div>
<script>
    const bubleCreate=()=>{
        // 获取body元素
        const body = document.body
        // 创建泡泡元素
        const buble = document.createElement('span')
        // 设置泡泡半径
        let r = Math.random()*5 + 25 //半径大小为25~30
        // 设置泡泡的宽高
        buble.style.width=r+'px'
        buble.style.height=r+'px'
        // 设置泡泡的随机起点
        buble.style.left=Math.random()*innerWidth+'px'
        // 为body添加buble元素
        body.append(buble)
        // 4s清除一次泡泡
        setTimeout(()=>{
            buble.remove()
        },4000)
    }
    // 每200ms生成一个泡泡
    setInterval(() => {
        bubleCreate()
    }, 200);
</script>




</body>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
    $("#loginBtn").click(function () {
        // 获取用户姓名和密码的值
        var uname = $("#uname").val();
        var upwd = $("#upwd").val();
        // 判断姓名是否为空
        if (isEmpty(uname)) {
            // 如果姓名为空，提示用户（span标签赋值），并且return  html()
            $("#msg").html("用户姓名不可为空！");
            return;
        }
        // 判断密码是否为空
        if (isEmpty(upwd)) {
            // 如果密码为空，提示用户（span标签赋值），并且return  html()
            $("#msg").html("用户密码不可为空！");
            return;
        }
        // 如果都不为空，则手动提交表单
        $("#loginForm").submit();
    });

    /**
     * 判断字符串是否为空
     *      如果为空，返回true
     *      如果不为空，返回false
     * @param str
     * @returns {boolean}
     */
    function isEmpty(str) {
        if (str == null || str.trim() == "") {
            return true;
        }
        return  false;
    }

</script>
</html>
</html>
