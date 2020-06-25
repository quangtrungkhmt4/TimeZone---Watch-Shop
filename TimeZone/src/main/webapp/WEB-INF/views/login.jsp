<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Admin - Login</title>
</head>
<body>
<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header">Login</div>
        <div class="card-body">
            <c:if test="${param.incorrectAccount != null}">
                <div class="alert alert-danger">
                    Username or password incorrect
                </div>
            </c:if>
            <c:if test="${param.accessDenied != null}">
                <div class="alert alert-danger">
                    you Not authorize
                </div>
            </c:if>
            <form action="j_spring_security_check" id="formLogin" method="post">
                <div class="form-group">
                    <div class="form-label-group">
                        <input type="text" id="userName" class="form-control" placeholder="User name"
                               required="required" autofocus="autofocus" name="j_username">
                        <label for="userName">User name</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group">
                        <input type="password" id="password" class="form-control" placeholder="Password"
                               required="required" name="j_password">
                        <label for="password">Password</label>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-block" >Login</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
