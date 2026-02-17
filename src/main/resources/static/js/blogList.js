$(document).ready(function () {
    getBlogList()
    // $(".readBtn").click(function () {
    //     let blogId = $(this).data("id");

    //     alert("Blog details will open for ID: " + blogId + "\n(After backend API integration)");
    // });
});

async function getBlogList() {
	const response = await getDataByPayloadWithParentUrl(
		"POST",
		true,
		true,
		BASE_URL + CONTEXT_PATH + "api/get-all-blog-list",
		""
	);
	renderBlogTable(response?.blogList || []);
}

function renderBlogTable(list) {
    let html = "";

    list.forEach((blog, i) => {
        html += `
            <div class="table-row">
                <div class="col-title">
                    ${blog.title}
                </div>
                <div class="col-slug">
                    ${blog.slug}
                </div>`
        html += `<div>
                    <span
                        class="status ${blog.status == 'PUBLISHED' ? 'published' : 'draft'}"
                        id="status_${blog.id}"
                        data-status="${blog.status}">
                        ${blog.status == 'PUBLISHED' ? 'Published' : 'Draft'}
                    </span>
                </div>`;

        html += `
                <div class="actions" style="padding-left: 24%;">
                   <button
                        class="btn-action ${blog.status == 'PUBLISHED' ? 'draft-blog' : 'publish-blog'}"
                        id="blog_${blog.id}"
                        data-blog-id="${blog.id}"
                        data-status="${blog.status}"
                        onclick="updateBlogStatus(${blog.id})">
                        ${blog.status == 'PUBLISHED' ? 'Draft' : 'Publish'}
                    </button>`;

            html += `<a onclick="location.href='new-blog?blogId=${blog.id}'" class="btn-action edit">Edit</a>
                    <a href="${BASE_URL != '' ? BASE_URL: ''}${CONTEXT_PATH != '' ? CONTEXT_PATH : ''}dashboard/view-blog/${blog.slug}" class="btn-action view" target="_blank">View</a>
                </div>
            </div>
        `;
    });

    $("#blogList").html(html);
}

async function updateBlogStatus(id) {
    let btn = $("#blog_" + id);
    let status = btn.attr("data-status");
    let statusSpan = $("#status_" + id);
    if(status === "PUBLISHED"){
        status = "DRAFT";
    }else{
        status = "PUBLISHED";
    }
	let payload = {
		blogId : id,
		status : status
	}
	const response = await getDataByPayloadWithParentUrl(
        "POST",
        true,
        true,
        BASE_URL + CONTEXT_PATH + "api/update-blog-status",
        payload
    );
	if(response.status == 1){
        if(status === "DRAFT"){
            btn.attr("data-status", "DRAFT");
            btn.removeClass("draft-blog").addClass("publish-blog");
            btn.text("Publish");
            statusSpan.removeClass("published").addClass("draft");
            statusSpan.text("Draft");
        } else {
            btn.attr("data-status", "PUBLISHED");
            btn.removeClass("publish-blog").addClass("draft-blog");
            btn.text("Draft");
            statusSpan.removeClass("draft").addClass("published");
            statusSpan.text("Published");
        }
		showMessage('success',response.message);
	}else{
		showMessage('error',response.message);
	}
};