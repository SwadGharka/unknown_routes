<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Hidden server JSON -->
<div id="serverData" data-packages='<c:out value="${packagesJson}" default="[]"/>'></div>
<style>
    /* Page background - theme friendly */
    body.packages-page {
        background: linear-gradient(45deg, rgba(13, 110, 253, 0.08), rgba(111, 66, 193, 0.08));
        min-height: 100vh;
        padding-top: 110px;
        /* Fixed header handling */
    }

    /* Main wrapper card */
    .table-wrapper {
        background: rgba(255, 255, 255, 0.65);
        backdrop-filter: blur(10px);
        border-radius: 16px;
        padding: 20px;
        max-width: 1200px;
        margin: auto;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        border: 1px solid rgba(255, 255, 255, 0.4);
    }

    /* Table heading */
    .page-title {
        font-size: 26px;
        font-weight: 700;
        text-align: center;
        margin-bottom: 25px;
        color: #4a0e74;
    }

    /* Table styling */
    .custom-table {
        width: 100%;
        border-collapse: collapse;
    }

    .custom-table thead {
        background: linear-gradient(45deg, rgba(13, 110, 253, 0.3), rgba(111, 66, 193, 0.3));
        color: white;
    }

    .custom-table th,
    .custom-table td {
        padding: 12px 16px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    }

    .custom-table tbody tr:hover {
        background: rgba(111, 66, 193, 0.06);
        cursor: pointer;
    }

    /* Buttons */
    .action-btn {
        padding: 6px 14px;
        border-radius: 8px;
        font-size: 13px;
        font-weight: 600;
        border: none;
        cursor: pointer;
    }

    .btn-edit {
        background: rgba(13, 110, 253, 0.3);
        color: #0d6efd;
    }

    .btn-active {
        background: rgba(40, 167, 69, 0.3);
        color: #28a745;
    }

    .btn-inactive {
        background: rgba(220, 53, 69, 0.3);
        color: #dc3545;
    }

    .btn-add {
        background: linear-gradient(45deg, rgba(13, 110, 253, 0.2), rgba(111, 66, 193, 0.2));
        color: #4a0e74;
        border: 2px solid rgba(111, 66, 193, 0.4);
        border-radius: 10px;
        padding: 10px 18px;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        transition: all .25s ease;
        float: right;
        margin-bottom: 15px;
        backdrop-filter: blur(6px);
    }

    .btn-add:hover {
        background: linear-gradient(45deg, rgba(111, 66, 193, 0.35), rgba(13, 110, 253, 0.35));
        color: white;
        transform: translateY(-2px);
        box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.15);
    }
</style>
<%@ include file="common/commonScript.jsp" %>
<%@ include file="header.jsp" %>
<body class="packages-page">
    <div style="width: 90px; background-color: #0d6efd;" temp="temp"></div>
    <div class="table-wrapper">
        <button class="btn-add" onclick="location.href='add-package'">
            + Add New Package
        </button>
        <div class="header-row">
            <h3 class="page-title">All Packages</h3>
        </div>

        <div class="table-card">
            <table class="table" id="packagesTable">
                <thead>
                    <tr>
                        <th style="width:70px; text-align:center;">Sr No.</th>
                        <th style="width:200px;">Name</th>
                        <th style="width:160px;">Location</th>
                        <th style="width:130px;">Category</th>
                        <th style="width:110px;">Status</th>
                        <th style="width:150px;">Package Code</th>
                        <th style="width:200px;">Action</th>
                    </tr>

                </thead>
                <tbody id="packageTableBody"></tbody>
            </table>
        </div>
    </div>
</body>

<script src="${pageContext.request.contextPath}/static/js/packageList.js"></script>