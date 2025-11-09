<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Add Package | OOO Trips</title>
      <link rel="stylesheet" href="${PATH_FOLDER_CSS}/addPackage.css">
      <script src="${PATH_FOLDER_JS}/addPAckages.js"></script>
      <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    </head>

    <body>

      <!-- Step 1 -->
      <form class="form-container active" id="step1">
        <h2>🧭 Add New Travel Package</h2>

        <label>Package Name<span style="color: red;">*</span></label>
        <input type="text" id="name" name="name" placeholder="Enter package name" required>

        <label>Description<span style="color: red;">*</span></label>
        <textarea id="desc" name="desc" placeholder="Short package description"></textarea>

        <label>Major Attractions</label>
        <input type="text" id="majorAttractionsList" name="majorAttractionsList" placeholder="Rohtang Pass, Solang Valley...">

        <label>Image URL<span style="color: red;">*</span></label>
        <input type="text" id="imageUrl" name="imageUrl" placeholder="Paste image link">

        <label>Destination<span style="color: red;">*</span></label>
        <input type="text" id="destination" name="destination" placeholder="Destination">

        <label>Number of Days<span style="color: red;">*</span></label>
        <select id="days" name="days">
          <option value="">Select days</option>
          <option value="1">1 Day</option>
          <option value="2">2 Days</option>
          <option value="3">3 Days</option>
          <option value="4">4 Days</option>
          <option value="5">5 Days</option>
          <option value="6">6 Days</option>
          <option value="7">7 Days</option>
          <option value="8">8 Days</option>
          <option value="9">9 Days</option>
          <option value="10">10 Days</option>
          <option value="11">11 Days</option>
          <option value="12">12 Days</option>
          <option value="13">13 Days</option>
          <option value="14">14 Days</option>
          <option value="15">15 Days</option>
        </select>

        <label>Amount (₹)<span style="color: red;">*</span></label>
        <input type="text" name="amount" id="amount" placeholder="e.g. 45999">

        <label>Members<span style="color: red;">*</span></label>
        <input type="text" name="members" id="members" placeholder="Per Persion/Per Couple">

        <label>Status<span style="color: red;">*</span></label>
        <select name="status" id="status">
          <option value="true" selected>Active</option>
          <option value="false">Inactive</option>
        </select>

        <label>Categorys<span style="color: red;">*</span></label>
        <select name="status" id="status">
        </select>

        <button type="button" id="toActivities" onclick="bindActivity()">Next ➜</button>
      </form>

      <!-- Step 2 -->
      <div class="activities-container" id="step2">
        <h2>🏕️ Add Day-wise Activities</h2>
        <div id="activitiesFields"></div>
        <div class="btn-group">
          <button type="button" id="back1">⬅ Back</button>
          <button type="button" id="toExtras">Next ➜</button>
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
          <button type="button" id="back2">⬅ Back</button>
          <button type="submit" id="addPackage">Add Package ✅</button>
        </div>
      </div>
      <script>
        $("#toExtras").click(function () {
          $("#step2").removeClass("active");
          $("#step3").addClass("active");
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