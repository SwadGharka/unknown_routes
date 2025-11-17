<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Add Package | OOO Trips</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/addPackage.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
      <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
      <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
      <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
      <script src="${pageContext.request.contextPath}/static/js/addPAckages.js"></script>
      <script src="${pageContext.request.contextPath}/static/js/common.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css">


      <%@ include file="common/commonScript.jsp" %>
    </head>

    <body>
      <%@ include file="header.jsp" %>
        <!-- Step 1 -->
        <div  class="">
          <input type="hidden" id="packageId">
          <form class="form-container active" id="step1">
            <h2>🧭 Add New Travel Package</h2>
            <div class="form-grid">
              <div class="form-left">
                <label>Package Name<span style="color: red;">*</span></label>
                <input type="text" id="name" name="name" placeholder="Enter package name" required>

                <label>Description<span style="color: red;">*</span></label>
                <textarea id="desc" name="desc" placeholder="Short package description"></textarea>

                <label>Major Attractions</label>
                <input type="text" id="majorAttractionsList" name="majorAttractionsList"
                  placeholder="Rohtang Pass, Solang Valley...">


                <label>Image URL<span style="color: red;">*</span></label>
                <input type="text" id="imageUrl" name="imageUrl" placeholder="Paste image link">

                <label>Destination<span style="color: red;">*</span></label>
                <input type="text" id="destination" name="destination" placeholder="Destination">

                <label>Category<span style="color: red;">*</span></label>
                <select id="category" name="category" multiple style="width: 100%;">
                  <option value="">Select Category</option>
                </select>
              </div>

              <div class="form-right">
                <label>Number of Days<span style="color: red;">*</span></label>
                <select id="days" name="days">
                  <option value="">Select days</option>
                  <c:forEach var="i" begin="1" end="15">
                    <option value="${i}">${i} Day${i > 1 ? 's' : ''}</option>
                  </c:forEach>
                </select>

                <label>Inclusions for card<span style="color: red;">*</span></label>
                <textarea id="inclusionsForCard" name="inclusionsForCard" placeholder="Inclusion 1, Inclusion 2, Inclusion 3, Inclusion 4"></textarea>

                <label>Amount (₹)<span style="color: red;">*</span></label>
                <input type="text" name="amount" id="amount" placeholder="e.g. 45999">

                <label>Members<span style="color: red;">*</span></label>
                <input type="text" name="members" id="members" placeholder="Per Person / Per Couple">

                <label>Status<span style="color: red;">*</span></label>
                <select name="status" id="status">
                  <option value="true" selected>Active</option>
                  <option value="false">Inactive</option>
                </select>
                <label>Offer Badge<span style="color: red;">*</span></label>
                <input type="text" id="offerBadge" name="offerBadge" placeholder="Enter Offer Badge" required>

                <div class="btn-wrapper">
                  <button class="button next-btn" type="button" id="toActivities" onclick="saveStep1('step1')">Next ➜</button>
                </div>
              </div>
            </div>
          </form>
        </div>


        <!-- Step 2 -->
        <div class="activities-container" id="step2">
          <input type="hidden" id="totalDays">
          <h2>🏕️ Add Day-wise Activities</h2>
          <div id="activitiesFields"></div>
          <div class="btn-group">
            <button class="button" type="button" id="back1">⬅ Back</button>
            <button class="button next-btn" type="button" id="toExtras" onclick="saveActivities()">Next ➜</button>
          </div>
        </div>

        <!-- Step 3 -->
        <div class="extra-fields" id="step3">
          <h2>✈️ Additional Details</h2>

          <label>Inclusion<span style="color: red;">*</span></label>
          <textarea name="inclusion" id="inclusion" placeholder="What's included in package?"></textarea>

          <label>Exclusion<span style="color: red;">*</span></label>
          <textarea name="exclusion" id="exclusion" placeholder="What's not included?"></textarea>

          <label>Hotels<span style="color: red;">*</span></label>
          <textarea name="hotels" id="hotels" placeholder="Hotel details"></textarea>

          <label>Flight</label>
          <textarea name="flight" id="flight" placeholder="Flight details (if any)"></textarea>

          <div class="btn-group">
            <button class="button" type="button" id="back2">⬅ Back</button>
            <button class="button next-btn" type="submit" id="addPackage" onclick="saveAdditionalDetails()">Add Package ✅</button>
          </div>
        </div>
        <script>
          $(document).ready(function() {
              $('#category').select2({
                  placeholder: "Select categories",
                  allowClear: true
              });
              async function getAllActiveCategorys(){
              let payload = {};
                let response = await getDataByPayloadWithParentUrl("post", false, true, "${pageContext.request.contextPath}/api/get-category", payload);
                bindCategories(response.categoryList);
            }
              getAllActiveCategorys();
          });

          $("#back1").click(function () {
            $("#step2").removeClass("active");
            $("#step1").addClass("active");
          });

          $("#back2").click(function () {
            $("#step3").removeClass("active");
            $("#step2").addClass("active");
          });
        </script>
    </body>

    </html>