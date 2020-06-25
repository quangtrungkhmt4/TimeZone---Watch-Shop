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
            <input type="hidden" name="idsize" value="${amounts!=null?amounts.id:null}">
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
                            <input type="number" id="amount" class="form-control" placeholder="Amount"
                                   required="required" autofocus="autofocus" name="amount"
                                   value="${amounts != null ? amounts.count : 0}"/>
                            <label for="amount">Amount</label>
                        </div>
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Update</button>
            <%--            <a class="btn btn-primary btn-block" href="login.html">Create</a>--%>
        </form>
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
