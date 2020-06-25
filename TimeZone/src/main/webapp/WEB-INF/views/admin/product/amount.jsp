<%@ include file="/common/taglib.jsp" %>
<%@ page import="com.ben.constant.UserStatus" %>
<%@ page import="com.ben.util.FileUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="editSizeColor" value="/admin/product/amount"/>
<html>
<head>
    <title>Setting Amount</title>
</head>
<body>
<div class="container-fluid">

    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Setting Amount</a>
        </li>
    </ol>

    <div class="container">
        <c:if test="${param.productDone != null}">
            <div class="alert alert-success">
                Create product success
            </div>
        </c:if>
        <form action="<c:url value='/admin/product/amount'/>" method="post" id="submitForm"
              enctype="multipart/form-data">
            <input type="hidden" name="id" value="${model.id}">
            <input type="hidden" name="idsize" value="${sizecolor!=null?sizecolor.id:null}">
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-6">
                        <div class="form-label-group">
                            <input readonly type="text" id="title" class="form-control" placeholder="Title"
                                   required="required" autofocus="autofocus" name="title" value="${model.title}"/>
                            <label for="title">Title</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-label-group">
                            <select id="status" class="form-control" style="margin-top: 5px;" name="status">
                                <option value="1">Active</option>
                                <option value="0">Inactive</option>
                            </select>
                            <%--                            <label for="status">Status</label>--%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-6">
                        <div class="form-label-group">
                            <input type="color" id="color" class="form-control" style="height: 50px;"
                                   required="required" autofocus="autofocus" name="color"
                                   value="${sizecolor != null ? sizecolor.color : '#ffffff'}"/>
                            <label for="color">Color</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-label-group">
                            <input type="number" id="amount" class="form-control" placeholder="Amount"
                                   required="required" autofocus="autofocus" name="amount"
                                   value="${sizecolor != null ? sizecolor.count : 0}"/>
                            <label for="amount">Amount</label>
                        </div>
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Update</button>
            <%--            <a class="btn btn-primary btn-block" href="login.html">Create</a>--%>
        </form>

        <table class="table table-bordered" width="100%" cellspacing="0" style="margin-top: 30px;">
            <thead>
            <tr>
                <th>Id</th>
                <th>Title</th>
                <th>Color</th>
                <th>Amount</th>
                <th>Is Active</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${amounts}" var="item">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.product.title}</td>
                    <td align="center"><input readonly type="color"
                                              value="${item.color}"></td>
                    <td>${item.count}</td>
                    <td align="center">
                        <c:if test="${item.status == UserStatus.ACTIVE_STATUS}">
                            <label>
                                <input type="checkbox" checked readonly onclick="return false">
                            </label>
                        </c:if>
                        <c:if test="${item.status == UserStatus.INACTIVE_STATUS}">
                            <label>
                                <input type="checkbox" readonly onclick="return false">
                            </label>
                        </c:if>
                    </td>
                    <td align="center">
                        <button onclick="edit(${item.id})" class="btn btn-success btn-sm rounded-0"
                                type="button" data-toggle="tooltip"
                                data-placement="top" title="Edit"><i class="fa fa-edit"></i></button>
                    </td>
                    <td align="center">
                        <c:if test="${item.status != UserStatus.INACTIVE_STATUS}">
                            <button onclick="confirmRemove(${item.id})" class="btn btn-danger btn-sm rounded-0"
                                    type="button" data-toggle="tooltip"
                                    data-placement="top" title="Delete"><i class="fa fa-trash"></i></button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


</div>

<script>

    if (${sizecolor != null}) {
        var selectStatus = document.getElementById("status");
        if (${sizecolor.status == UserStatus.ACTIVE_STATUS}) {
            selectStatus.selectedIndex = 0;
        } else {
            selectStatus.selectedIndex = 1;
        }
    }

    function edit(id) {
        window.location.href = '${editProduct}' + '?id=' + ${model.id} + '&idsize=' + id;
    }

    function confirmRemove(id) {
        swal({
            title: "Confirm",
            text: "Do you want disable this category?",
            type: "warning",
            confirmButtonClass: "btn-success",
            confirmButtonText: "Disable"
        }).then((result) => {
            remove(id)
        }).catch((error) => {

        });
    }

    function remove(data) {
        $.ajax({
            url: '${disableCategory}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                swal("Disable", "Disable category success!", "success");
                $('#limit').val(10);
                $('#page').val(${page});
                $('#formSubmit').submit();
            },
            error: function (error) {
                swal("Disable", "Disable category fail!", "error");
            }
        });
    }

    function settingAmount(id) {
        window.location.href = '${settingAmount}' + '?id=' + id;
    }


</script>
</body>
</html>
