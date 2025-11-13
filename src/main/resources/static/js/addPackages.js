async function bindActivity(formId){

    let payload = getPackageStep1(formId);
    let response = await getDataByPayloadWithParentUrl("post", false, true, BASE_URL+CONTEXT_PATH+"api/save-package-step1", payload)
    if(response != null && response.status == 1){
      showMessage("success",response.message);
      let days = $("#days");
      if ($.trim(days.val()) === "") {
          days.addClass("shake");
          setTimeout(function() {
          days.removeClass("shake");
          }, 1000);
          return;
      }
      let $fields = $("#activitiesFields");
      $fields.empty();
      for(let i=1;i<=days.val();i++){
      $fields.append(`
          <div class="day-activity">
          <h4>Day ${i}</h4>
          <label>Header:<span style="color: red;">*</span></label>
          <input type="text" name="day${i}_header" placeholder="Title for Day ${i}">
          <label>Points:<span style="color: red;">*</span></label>
          <textarea name="day${i}_points" placeholder="Details for Day ${i}"></textarea>
          </div>
      `);
      }
      $("#step1").removeClass("active");
      $("#step2").addClass("active");
    }else{
      showMessage("error",response.message);
    }
}

function bindCategories(data) {
  let $select = $("#category");
  $select.empty().append('<option value="">Select Category</option>');

  data.forEach(function(item) {
    // Har item object me ek hi key-value pair hai (ex: { "1": "Family" })
    let id = Object.keys(item)[0];
    let name = item[id];

    if (name && name.trim() !== "") {
      $select.append('<option value="' + id + '">' + name + '</option>');
    }
  });
}



function getPackageStep1(formId) {
  let request = {};
  request['packageName'] = $("#" + formId + " #name").val().trim();
  request['description'] = $("#" + formId + " #desc").val().trim();
  request['majorAttractionsList'] = $("#" + formId + " #majorAttractionsList").val().trim();
  request['imageUrl'] = $("#" + formId + " #imageUrl").val().trim();
  request['destination'] = $("#" + formId + " #destination").val().trim();
  request['days'] = $("#" + formId + " #days").val();
  request['amount'] = $("#" + formId + " #amount").val().trim();
  request['members'] = $("#" + formId + " #members").val().trim();
  request['status'] = $("#" + formId + " #status").val();
  request['categoryId'] = $("#" + formId + " #category").val();
  return request;
}
