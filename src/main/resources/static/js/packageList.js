
async function toggleStatus(id) {
	let payload = {
		packageId : id,
		status : $("#statusButton_" + id).text() == 'Active' ? true : false
	}
	const response = await getDataByPayloadWithParentUrl(
        "POST",
        true,
        true,
        BASE_URL + CONTEXT_PATH + "api/package-active-deactive",
        payload
    );
	if(response.status == 1){
		if ($("#statusButton_" + id).text() == 'Active') {
			$("#pkg_" + id).text("Active");
			$("#statusButton_" + id).text("Inactive");
		} else {
			$("#pkg_" + id).text("Inactive");
			$("#statusButton_" + id).text("Active");
		}
		showMessage('success',response.message);
	}else{
		showMessage('error',response.message);
	}
};

function renderTable(list) {
	let html = "";

	list.forEach((pkg, i) => {
		let categoryObj = pkg.categoryObj || [];

		const categories = categoryObj.map(c => `
        <span style="
          background: rgba(111,66,193,0.15);
          color: #4a0e74;
          padding: 3px 8px;
          border-radius: 8px;
          margin-right: 4px;
          display: inline-block;
          font-size: 12px;
        ">
        ${escapeHtml(c.name || c)}  
        </span>
      `)
			.join("");

		const status = pkg.status == true
			? `<span class="status-active">Active</span>`
			: `<span class="status-inactive">Inactive</span>`;

		html += `
      <tr>
        <td style="width:70px; text-align:center;">${i + 1}</td>
        <td style="text-align:left;width:200px;">${escapeHtml(pkg.name)}</td>
        <td style="width:160px;">${escapeHtml(pkg.destination)}</td>
        <td style="width:130px;">${categories}</td>
        <td style="width:110px;" id="pkg_${pkg.id}">${pkg.isCompleted ? status : 'Incomplete'}</td>
        <td style="width:150px;">${escapeHtml(pkg.packageUniqueCode)}</td>

        <td style="width:200px; text-align: center">
          <button class="action-btn action-edit" ${!pkg.isCompleted ? 'style="width: 68%;background: rgb(253 13 13 / 48%);color: white;"' : ''}
            onclick="location.href='add-package?packageId=${pkg.id}'">${pkg.isCompleted ? 'Copy' : 'Complete'}</button>`;
            if(pkg.isCompleted){
				      html += `<button class="action-btn action-deactivate" style="margin-left: 21px;" id="statusButton_${pkg.id}" onclick="toggleStatus('${pkg.id}')">${pkg.status ? 'Inactive' : 'Active'}</button>`;
            }
html +=`</td>
      </tr>
    `;
	});

  $("#packageTableBody").html(html)
}

function escapeHtml(s) {
	return String(s || "")
		.replace(/&/g, "&amp;")
		.replace(/</g, "&lt;")
		.replace(/>/g, "&gt;")
		.replace(/"/g, "&quot;");
}

async function getAllPackagesList() {
	const response = await getDataByPayloadWithParentUrl(
		"POST",
		true,
		true,
		BASE_URL + CONTEXT_PATH + "api/get-all-packages-list",
		""
	);
	renderTable(response?.packages || []);
}
function toggleFilterBox() {
    $("#filterBox").slideToggle(220);
}

function bindCategories(data) {
    let $select = $("#filterCategory");
    $select.empty().append('<option value="">Select Category</option>');

    data.forEach(function (item) {
        let id = Object.keys(item)[0];
        let name = item[id];

        if (name && name.trim() !== "") {
            $select.append('<option value="' + id + '">' + name + '</option>');
        }
    });
}