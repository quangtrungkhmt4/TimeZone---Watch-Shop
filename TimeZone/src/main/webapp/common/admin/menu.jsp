<!-- Sidebar -->
<ul class="sidebar navbar-nav">
<%--    <li class="nav-item dropdown">--%>
<%--        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
<%--            <i class="fas fa-fw fa-folder"></i>--%>
<%--            <span>Category</span>--%>
<%--        </a>--%>
<%--        <div class="dropdown-menu" aria-labelledby="pagesDropdown">--%>
<%--            <a class="dropdown-item" href="<c:url value='/admin/category/create'/>">Create category</a>--%>
<%--            <a class="dropdown-item" href="<c:url value='/admin/category/list?page=1&limit=10'/>">List category</a>--%>
<%--        </div>--%>
<%--    </li>--%>

    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Product</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="<c:url value="/admin/product/create"/>">Create product</a>
            <a class="dropdown-item" href="<c:url value="/admin/product/list?page=1&limit=10"/>">List product</a>
        </div>
    </li>

    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Log</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="#">Sell log</a>
            <a class="dropdown-item" href="#">Bill log</a>
        </div>
    </li>
</ul>
