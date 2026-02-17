$("#title").on('keyup', function () {
    let title = $(this).val();
    let slug = title.toLowerCase().trim().replace(/[^a-z0-9\- ]/g, '').replace(/\s+/g, '-');
    $("#slug").val(slug);
    $("#slugFeedback").text('');
});

async function checkSlug() {
    let slug = $("#slug").val();
    if (!slug) { $("#slugFeedback").text('Enter slug'); return; }
    let payload = {
        slug
    };
    let response = await getDataByPayloadWithParentUrl("post", false, true, BASE_URL + CONTEXT_PATH + "api/slug-check", payload)
    if (response.status == 1) {
        if (response.slug) {
            $("#slugFeedback").text('Slug already taken, it will be made unique on save.');
        } else {
            $("#slugFeedback").text('Slug available.');
        }
    } else {
        showMessage("error", response.message);
    }
}

async function saveBlog() {
    const title = $("#title").val();
    const slug = $("#slug").val();
    if (!title) {
        showMessage("error", "Please fill title.");
    }
    if (!slug) {
        showMessage("error", "Please fill slug.");
    }
    let payload = saveBlogRequest();
    let response = await getDataByPayloadWithParentUrl("post", false, true, BASE_URL + CONTEXT_PATH + "api/save-blog", payload)
    if (response.status == 1) {
        showMessage("success", response.message);
    } else {
        showMessage("error", response.message);
    }
    console.log(response);
}

function saveBlogRequest() {
    let title = $("#title").val();
    let slug = $("#slug").val();
    let excerpt = $("#excerpt").val();
    let content = $("#blogContent").val()
    let status = $("#status").val();
    let coverImageUrl = $("#coverImageUrl").val();
    const blogId = $("#editBlogId").val();
    let request = {
        title,
        slug,
        excerpt,
        content,
        status,
        coverImageUrl,
        blogId
    };
    return request;
}

$("#checkSlugBtn").on('click', function () {
    let slug = $("input[name='slug']").val();
    if (!slug) { $("#slugFeedback").text('Enter slug'); return; }
    $.get("/admin/blog/check-slug", { slug: slug }, function (data) {
        if (data.exists) {
            $("#slugFeedback").text('Slug already taken, it will be made unique on save.');
        } else {
            $("#slugFeedback").text('Slug available.');
        }
    });
});

async function getBlogData() {
    let payload = {
        'editBlogId' : $("#editBlogId").val()
    }
    const response = await getDataByPayloadWithParentUrl("POST", true, true, BASE_URL + CONTEXT_PATH + "api/get-blog-by-id", payload);
    prefillBlogForm(response.blogData);
}

function prefillBlogForm(data) {

    if (!data) return;

    $("#title").val(data.title || "");
    $("#slug").val(data.slug || "");
    $("#excerpt").val(data.excerpt || "");

    // ✅ JODIT CONTENT PREFILL
    if (editor) {
        editor.value = data.content || "";
    }

    if (data.status) {
        $("#status").val(data.status).trigger("change");
    }

    if (data.coverImageUrl) {
        $("#coverImageUrl").val(data.coverImageUrl);
        $("#uploadPreview").html(`
            <img src="${data.coverImageUrl}"
                 style="max-width:100%; border-radius:8px;">
        `);
    } else {
        $("#uploadPreview").html("");
    }

    if (data.slug) {
        $("#slugFeedback")
            .text("Slug loaded")
            .removeClass("error")
            .addClass("success");
    }
}