<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>

    <script src="${pageContext.request.contextPath}/static/js/packageList.js"></script>
    <%@ include file="common/commonScript.jsp" %>
    <%@ include file="header.jsp" %>
    <style>
        /* Page background - theme friendly */
        body.packages-page {
            background: linear-gradient(45deg, rgb(13 110 253 / 64%), rgb(111 66 193));
            ;
            min-height: 100vh;
            padding-top: 110px;
            /* Fixed header handling */
        }

        /* Main wrapper card */
        .table-wrapper {
            background: rgb(255 255 255 / 22%);
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
            color: #fefefe;
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
            color: #ffffff;
            border: 2px solid rgb(111 66 193);
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

        .table-card {
            border-radius: 14px;
            overflow: hidden;
        }

        /* Filter Container */
        .filter-container {
            margin-bottom: 18px;
        }

        /* Toggle Button */
        .filter-toggle-btn {
            background: linear-gradient(45deg, rgba(13, 110, 253, 0.5), rgba(111, 66, 193, 0.5));
            padding: 8px 20px;
            color: white;
            font-weight: 600;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            transition: .2s ease;
        }

        .filter-toggle-btn:hover {
            background: linear-gradient(45deg, rgba(111, 66, 193, 0.7), rgba(13, 110, 253, 0.7));
            transform: translateY(-2px);
        }

        /* Filter Box */
        .filter-box {
            display: none;
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(10px);
            padding: 18px;
            margin-top: 12px;
            border-radius: 14px;
            border: 1px solid rgba(255, 255, 255, 0.35);
        }

        /* 3-Column grid */
        .filter-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }

        /* Filter items */
        .filter-item label {
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 6px;
            display: block;
            color: #4a0e74;
        }

        .filter-item input,
        .filter-item select {
            width: 100%;
            padding: 8px 12px;
            border-radius: 8px;
            border: 1px solid rgba(111, 66, 193, 0.4);
            background: white;
        }

        /* Buttons */
        .filter-actions {
            margin-top: 15px;
            display: flex;
            gap: 10px;
        }

        .apply-btn {
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: 600;
            flex: 1;
            width: 100%;
            height: 40px;
            padding: 8px 12px;
            margin-top: 24px;
            border-radius: 8px;
            margin-inline: 10px;
            transition: all .25s ease;
        }

        .apply-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.18);
            filter: brightness(1.25);
        }

        .apply-btn.reset:hover {
            filter: brightness(1.25);
            transform: translateY(-3px);
        }

        /* Mobile responsive */
        @media (max-width: 768px) {
            .filter-grid {
                grid-template-columns: 1fr;
                /* 3 → 1 column */
            }
        }
    </style>
</head>

<body class="packages-page">
    <div style="width: 90px; background-color: #0d6efd;" temp="temp"></div>
    <div class="table-wrapper">
        <button class="btn-add" onclick="location.href='add-package'">
            + Add New Package
        </button>
        <div class="header-row">
            <h3 class="page-title">All Packages</h3>
        </div>
        <!-- FILTER WRAPPER -->
        <div class="filter-container">

            <button class="filter-toggle-btn" onclick="toggleFilterBox()">Filters</button>

            <div class="filter-box" id="filterBox">

                <div class="filter-grid">

                    <div class="filter-item">
                        <label>Package Name</label>
                        <input type="text" id="filterName" placeholder="Search package name...">
                    </div>

                    <div class="filter-item">
                        <label>Status</label>
                        <select id="filterStatus">
                            <option value="">All</option>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>

                    <div class="filter-item">
                        <label>Category</label>
                        <select id="filterCategory">
                        </select>
                    </div>

                    <div class="filter-item">
                        <label>Location</label>
                        <input type="text" id="filterLocation" placeholder="Search package location...">
                    </div>

                    <div class="filter-item">
                        <label>Package Code</label>
                        <input type="text" id="filterpackageCode" placeholder="Search package code...">
                    </div>

                    <div style="display: flex;">
                        <button class="apply-btn"
                            style="background: linear-gradient(45deg, rgba(13,110,253,0.45), rgba(111,66,193,0.45));">Apply
                            Filters</button>
                        <button class="apply-btn reset"
                            style="background: linear-gradient(45deg, rgb(59 13 253 / 57%), rgb(255 0 0 / 77%));">Reset</button>
                    </div>
                </div>


            </div>
        </div>


        <div class="table-card">
            <table class="table" id="packagesTable">
                <thead>
                    <tr>
                        <th style="color: #6a2b97; width:70px; text-align:center;">Sr No.</th>
                        <th style="color: #6a2b97; width:200px;">Name</th>
                        <th style="color: #6a2b97; width:160px;">Location</th>
                        <th style="color: #6a2b97; width:130px;">Category</th>
                        <th style="color: #6a2b97; width:110px;">Status</th>
                        <th style="color: #6a2b97; width:150px;">Package Code</th>
                        <th style="color: #6a2b97; width:200px; text-align: center;">Action</th>
                    </tr>
                </thead>
                <tbody id="packageTableBody"></tbody>
            </table>
        </div>
    </div>
</body>

<script>
    $(document).ready(function () {
        getAllPackagesList();
        getAllActiveCategorys()
    })
    async function getAllActiveCategorys() {
        let payload = {};
        let response = await getDataByPayloadWithParentUrl("post", false, true, "${pageContext.request.contextPath}/api/get-category", payload);
        bindCategories(response.categoryList);
    }
</script>