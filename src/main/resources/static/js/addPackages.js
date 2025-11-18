async function saveStep1(formId) {
    if (!validateFieldAndShake("name")) return;
    if (!validateFieldAndShake("desc")) return;
    // if (!validateFieldAndShake("majorAttractionsList")) return;
    if (!validateFieldAndShake("imageUrl")) return;
    if (!validateFieldAndShake("destination")) return;
    if (!validateFieldAndShake("days")) return;
    if (!validateFieldAndShake("amount")) return;
    if (!validateFieldAndShake("members")) return;
    if (!validateFieldAndShake("status")) return;
    if (!validateFieldAndShake("category")) return;
    if (!validateFieldAndShake("inclusionsForCard")) return;
    let payload = getPackageStep1(formId);
    let response = await getDataByPayloadWithParentUrl("post", false, true, BASE_URL + CONTEXT_PATH + "api/save-travel-package", payload)
    if (response != null && response.status == 1) {
        showMessage("success", response.message);

        let getActivityPayload = {};
        getActivityPayload['packageId'] = response.packageId;
        let activitiesResponse = await getDataByPayloadWithParentUrl("post", false, true, BASE_URL + CONTEXT_PATH + "api/get-all-activities-by-packageId", getActivityPayload)

        if (activitiesResponse != null && activitiesResponse.status == 1) {
            let activityList = activitiesResponse.activityArray;
            if (activityList && activityList.length > 0) {
                $("#totalDays").val(activityList.length);
                $("#packageId").val(response.packageId);
                let $fields = $("#activitiesFields");
                $fields.empty();
                for (let i = 0; i < activityList.length; i++) {
                    let activity = activityList[i];
                    $fields.append(`
              <div class="day-activity">
                <h4>Day ${activity.day}</h4>

                <label>Header:<span style="color: red;">*</span></label>
                <input type="text" id="day${activity.day}_header" name="day${activity.day}_header" value="${activity.header}">

                <label>Points:<span style="color: red;">*</span></label>
                <textarea id="day${activity.day}_points" name="day${activity.day}_points">${activity.point}</textarea>
              </div>
          `);
                }
            } else {
                let days = $("#days").val();
                $("#totalDays").val(days);
                $("#packageId").val(response.packageId);
                let $fields = $("#activitiesFields");
                $fields.empty();
                for (let i = 1; i <= days; i++) {
                    $fields.append(`
              <div class="day-activity">
              <h4>Day ${i}</h4>
              <label>Header:<span style="color: red;">*</span></label>
              <input type="text" id="day${i}_header" name="day${i}_header" placeholder="Title for Day ${i}">
              <label>Points:<span style="color: red;">*</span></label>
              <textarea id="day${i}_points" name="day${i}_points" placeholder="Details for Day ${i}"></textarea>
              </div>
          `);
                }
            }
        } else {
            showMessage("error", response.message);
        }
        $("#step1").removeClass("active");
        $("#step2").addClass("active");
    } else {
        showMessage("error", response.message);
    }
}

function activityRequest() {
    let request = {}
    let totalDays = $("#totalDays").val();
    let objArray = [];
    let flag = 0
    for (let i = 1; i <= totalDays; i++) {
        let activityObj = {};
        if (!validateFieldAndShake(`day${i}_header`)) break;
        if (!validateFieldAndShake(`day${i}_points`)) break;
        flag++;
        activityObj['day'] = i;
        activityObj['header'] = $(`#day${i}_header`).val();
        activityObj['points'] = $(`#day${i}_points`).val();
        objArray.push(activityObj);
    }
    if (flag == totalDays) {
        request['validRequest'] = true;
        request['objArray'] = objArray;
    } else {
        request['validRequest'] = false;
    }
    return request;
}

async function saveActivities() {
    let data = activityRequest();
    if (!data.validRequest) {
        return;
    }

    let payload = {};
    payload['packageId'] = $("#packageId").val();
    payload['activityarray'] = data.objArray;
    let response = await getDataByPayloadWithParentUrl("post", false, true, BASE_URL + CONTEXT_PATH + "api/save-activities", payload)
    if (response != null && response.status == 1) {
        showMessage("success", response.message);
        $("#step2").removeClass("active");
        $("#step3").addClass("active");
        return true;
    } else {
        showMessage("error", response.message);
        return false;
    }

}

function bindCategories(data) {
    let $select = $("#category");
    $select.empty().append('<option value="">Select Category</option>');

    data.forEach(function (item) {
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
    request['categoryIds'] = $("#" + formId + " #category").val();
    request['inclusionsForCard'] = $("#" + formId + " #inclusionsForCard").val();
    request['badge'] = $("#" + formId + " #offerBadge").val();
    request['packageColor'] = $("#packageColor").val();
    request['packageId'] = $("#packageId").val();
    return request;
}

async function saveAdditionalDetails() {
    let data = extraFieldsRequest();
    if (!data.validRequest) {
        return;
    }

    let payload = {};
    payload['packageId'] = $("#packageId").val();
    payload['additionalData'] = data.extraObj;
    let response = await getDataByPayloadWithParentUrl("post", false, true, BASE_URL + CONTEXT_PATH + "api/save-additional-details", payload)
    if (response != null && response.status == 1) {
        showMessage("success", response.message);
        window.location.reload()
        return true;
    } else {
        showMessage("error", response.message);
        return false;
    }

}

function extraFieldsRequest() {
    let request = {};
    let extraObj = {};

    // Validate and fetch values
    if (!validateFieldAndShake("inclusion")) {
        request["validRequest"] = false;
        return request;
    }

    if (!validateFieldAndShake("exclusion")) {
        request["validRequest"] = false;
        return request;
    }

    if (!validateFieldAndShake("hotels")) {
        request["validRequest"] = false;
        return request;
    }

    extraObj["inclusion"] = $("#inclusion").val();
    extraObj["exclusion"] = $("#exclusion").val();
    extraObj["hotels"] = $("#hotels").val();
    extraObj["flight"] = $("#flight").val();

    request["validRequest"] = true;
    request["extraObj"] = extraObj;

    return request;
}

async function getPackageDetails(){
    let payload = {
        'packageId' : $("#packageId").val()
    }
    const response = await getDataByPayloadWithParentUrl("POST", true, true, BASE_URL + CONTEXT_PATH + "api/get-packages-by-id", payload);
    prefillPackageForm(response.packageData);
}

function prefillPackageForm(data) {

    if (!data) return;

    // Text fields
    $("#name").val(data.name || "");
    $("#desc").val(data.description || "");
    $("#majorAttractionsList").val(data.majorAttractionsList || "");
    $("#imageUrl").val(data.imageUrl || "");
    $("#destination").val(data.destination || "");
    $("#amount").val(data.amount || "");
    $("#members").val(data.members || "");
    $("#offerBadge").val(data.badge || "");

    // Days dropdown
    $("#days").val(data.totalDays || "").trigger("change");

    // Status
    // (If backend me status nahi aa raha to default active hi rakho)
    if (data.status !== undefined) {
        $("#status").val(data.status.toString()).trigger("change");
    }

    // Package Color
    $("#packageColor").val(data.packageColor || "").trigger("change");

    // Inclusions for card
    $("#inclusionsForCard").val(data.inclusionsForCard || "");

    // MULTIPLE CATEGORY (Select2)
    if (Array.isArray(data.categoryId)) {
        let ids = data.categoryId.map(String); // convert to string for select2
        $("#category").val(ids).trigger("change");
    }
}
