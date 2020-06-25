<%@ include file="/common/taglib.jsp" %>
<%@ page import="com.ben.constant.UserStatus" %>
<%@ page import="com.ben.util.FileUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="editProduct" value="/admin/product/update"/>
<c:url var="settingAmount" value="/admin/product/amount"/>
<html>
<head>
    <title>List products</title>
</head>
<body>
<div class="container-fluid">

    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">List Products</a>
        </li>
    </ol>

    <form action="<c:url value='/admin/product/list'/>" id="formSubmit" method="get">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Short description</th>
                        <th>Content</th>
                        <th>Price</th>
                        <th>Thumbnail</th>
                        <th>Is Active</th>
                        <th></th>
                        <th></th>
                        <th>Amount</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${products}" var="item">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.title}</td>
                            <td>${item.shortDescription.substring(0, 200).concat("...")}</td>
                            <td>${item.content.substring(0, 200).concat("...")}</td>
                            <td>${item.price}$</td>
                            <td>
                                <c:if test="${item.thumbnail.contains('http')}">
                                    <img src="${item.thumbnail}" alt="thumbnail" width="100" height="100">
                                </c:if>
                                <c:if test="${!item.thumbnail.contains('http')}">
                                    <img src="${FileUtils.PATH}${item.thumbnail}" alt="thumbnail" width="100"
                                         height="100">
                                </c:if>
                            </td>
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
                            <td>
                                <button type="button" onclick="settingAmount(${item.id})" class="btn btn-primary">Setting</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="pagination">
                    <c:if test="${page == 1}">
                        <a href="#" onclick="return false">&laquo;</a>
                    </c:if>
                    <c:if test="${page > 1}">
                        <a href="<c:url value='/admin/product/list?limit=10&page=${page - 1}'/>">&laquo;</a>
                    </c:if>

                    <a href="<c:url value='/admin/product/list?limit=10&page=1'/>">1</a>
                    <a href="#" style="" onclick="return false">...</a>
                    <a href="<c:url value='/admin/product/list?limit=10&page=${totalPage}'/>">${totalPage}</a>

                    <c:if test="${page == totalPage}">
                        <a href="#" onclick="return false">&raquo;</a>
                    </c:if>
                    <c:if test="${page < totalPage}">
                        <a href="<c:url value='/admin/product/list?limit=10&page=${page + 1}'/>">&raquo;</a>
                    </c:if>

                    <label for="pageJump"></label><input value="${page}"
                                                         style="width: 10%; margin-left: 10px; text-align: center;"
                                                         type="number" id="pageJump" class="form-control"/>
                    <a href="#" onclick="jumpPage()">Go</a>
                    <input type="hidden" value="" id="page" name="page"/>
                    <input type="hidden" value="" id="limit" name="limit"/>
                </div>
            </div>
        </div>
    </form>


</div>

<script>
    function jumpPage() {
        var pageJump = document.getElementById("pageJump");
        if (pageJump.value === undefined || pageJump.value === '' || Number(pageJump.value) < 0) {
            return false;
        }
        $('#limit').val(10);
        $('#page').val(pageJump.value);
        $('#formSubmit').submit();
    }

    function edit(id) {
        window.location.href = '${editProduct}' + '?id=' + id;
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
