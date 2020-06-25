<%@ include file="/common/taglib.jsp" %>
<%@ page import="com.ben.constant.UserStatus" %>
<%@ page import="com.ben.util.FileUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Product</title>
</head>
<body>
<div class="container-fluid">

    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Update Product</a>
        </li>
    </ol>
    <div class="container">
        <c:if test="${param.productCreateDone != null}">
            <div class="alert alert-success">
                Create product success
            </div>
        </c:if>
        <c:if test="${param.productDone != null}">
            <div class="alert alert-success">
                Update product success
            </div>
        </c:if>
        <form action="<c:url value='/admin/product/update'/>" method="post" id="submitForm"
              enctype="multipart/form-data">
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-4">
                        <div class="form-label-group">
                            <input readonly type="number" id="id" class="form-control" placeholder="Id"
                                   autofocus="autofocus" name="id" value="${model.id}"/>
                            <label for="id">Id</label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-label-group">
                            <input type="text" id="title" class="form-control" placeholder="Title"
                                   required="required" autofocus="autofocus" name="title" value="${model.title}"/>
                            <label for="title">Title</label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-label-group">
                            <input type="number" step="0.01" id="price" class="form-control" placeholder="Price"
                                   required="required" name="price" value="${model.price}"/>
                            <label for="price">Price</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-4">
                        <div class="form-label-group">
                            <select id="status" class="form-control" style="margin-top: 5px;" name="status">
                                <option value="1">Active</option>
                                <option value="0">Inactive</option>
                            </select>
                            <%--                            <label for="status">Status</label>--%>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-label-group">
                            <input readonly type="text" id="createdDate" class="form-control" placeholder="Created date"
                                   required="required" autofocus="autofocus" name="createdDate"
                                   value="${model.createdDate}"/>
                            <label for="createdDate">Created date</label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-label-group">
                            <input readonly type="text" id="modifiedDate" class="form-control"
                                   placeholder="Modified date"
                                   required="required" name="modifiedDate" value="${model.modifiedDate}"/>
                            <label for="modifiedDate">Modified date</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-4">
                        <div class="form-label-group">
                            <input readonly type="text" id="createdBy" class="form-control" placeholder="Created by"
                                   required="required" autofocus="autofocus" name="createdBy"
                                   value="${model.createdBy}"/>
                            <label for="createdBy">Created by</label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-label-group">
                            <input readonly type="text" id="modifiedBy" class="form-control" placeholder="Modified by"
                                   required="required" name="modifiedBy" value="${model.modifiedBy}"/>
                            <label for="modifiedBy">Modified by</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-6">
                        <div class="form-label-group">
                            <textarea style="padding-top: 35px;" rows="10" cols="40" type="text" id="content"
                                      class="form-control" placeholder="Content"
                                      required="required" autofocus="autofocus"
                                      name="content">${model.content}</textarea>
                            <label for="content">Content</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-label-group">
                            <textarea style="padding-top: 35px;" rows="10" cols="40" type="text" id="shortDesc"
                                      class="form-control" placeholder="Short description"
                                      required="required" autofocus="autofocus"
                                      name="shortDesc">${model.shortDescription}</textarea>
                            <label for="shortDesc">Short description</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-3">
                        <div class="form-label-group">
                            <%--                            <img src="${model.thumbnail}" alt="thumbnail" id="thumbnail" width="200" height="200">--%>
                            <input accept="image/x-png,image/jpeg" type="file" class="form-control"
                                   placeholder="Thumbnail" id="thumbnail" name="thumbnail"/>
                            <label for="thumbnail">Thumbnail</label>
                            <c:if test="${model.thumbnail.contains('http')}">
                                <img src="${model.thumbnail}" style="margin-top: 10px;" width="270" height="270">
                            </c:if>
                            <c:if test="${!model.thumbnail.contains('http')}">
                                <img src="${FileUtils.PATH}${model.thumbnail}" style="margin-top: 10px;" width="270"
                                     height="270">
                            </c:if>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-label-group">
                            <%--                            <img src="${model.thumbnail}" alt="thumbnail" id="thumbnail" width="200" height="200">--%>
                            <input accept="image/x-png,image/jpeg" type="file" class="form-control"
                                   placeholder="Image" id="image1" name="image"/>
                            <label for="image1">Image</label>
                            <c:if test="${images.get(0).url.contains('http')}">
                                <img src="${images.get(0).url}" style="margin-top: 10px;" width="270" height="270">
                            </c:if>
                            <c:if test="${!images.get(0).url.contains('http')}">
                                <img src="${FileUtils.PATH}${images.get(0).url}" style="margin-top: 10px;" width="270"
                                     height="270">
                            </c:if>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-label-group">
                            <%--                            <img src="${model.thumbnail}" alt="thumbnail" id="thumbnail" width="200" height="200">--%>
                            <input accept="image/x-png,image/jpeg" type="file" class="form-control"
                                   placeholder="Image" id="image2" name="image"/>
                            <label for="image2">Image</label>
                            <c:if test="${images.get(1).url.contains('http')}">
                                <img src="${images.get(1).url}" style="margin-top: 10px;" width="270" height="270">
                            </c:if>
                            <c:if test="${!images.get(1).url.contains('http')}">
                                <img src="${FileUtils.PATH}${images.get(1).url}" style="margin-top: 10px;" width="270"
                                     height="270">
                            </c:if>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-label-group">
                            <%--                            <img src="${model.thumbnail}" alt="thumbnail" id="thumbnail" width="200" height="200">--%>
                            <input accept="image/x-png,image/jpeg" type="file" class="form-control"
                                   placeholder="Image" id="image3" name="image"/>
                            <label for="image3">Image</label>
                            <c:if test="${images.get(2).url.contains('http')}">
                                <img src="${images.get(2).url}" style="margin-top: 10px;" width="270" height="270">
                            </c:if>
                            <c:if test="${!images.get(2).url.contains('http')}">
                                <img src="${FileUtils.PATH}${images.get(2).url}" style="margin-top: 10px;" width="270"
                                     height="270">
                            </c:if>
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
    var selectStatus = document.getElementById("status");
    if (${model.status == UserStatus.ACTIVE_STATUS}) {
        selectStatus.selectedIndex = 0;
    } else {
        selectStatus.selectedIndex = 1;
    }

</script>
</body>
</html>
