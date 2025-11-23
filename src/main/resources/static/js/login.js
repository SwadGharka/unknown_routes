function togglePassword() {
    const pass = document.getElementById("password");
    const eye = document.querySelector(".eye-btn");

    if (pass.type === "password") {
        pass.type = "text";
        eye.textContent = "🙈"; // eye-off
    } else {
        pass.type = "password";
        eye.textContent = "🐵"; // eye-on
    }
}

function doLogin() {
    const userId = $("#userId").val();
    const password = $("#password").val();

    let isValid = true;

    if (userId === "") {
        // document.getElementById("userError").innerText = "User ID is required";
        isValid = false;
    }

    if (password === "") {
        // document.getElementById("passError").innerText = "Password is required";
        isValid = false;
    }

    if (!isValid) return;
    loginUser();
    // Dummy check (You will replace with real AJAX)
    // if (userId === "admin" && password === "12345") {
    //     showMessage("success","Login Successful!");
    //     window.location.href = "home";
    // } else {
    //     document.getElementById("passError").innerText = "Invalid credentials";
    // }
}


async function loginUser(){
    let payload = {
        'userName' : $("#userName").val(),
        'password' : $("#password").val()
    }
    const response = await getDataByPayloadWithParentUrl("POST", true, true, BASE_URL + CONTEXT_PATH + "api/login", payload);
    if(response.status != 1){
        showMessage("error", response.message);
    }else{
        showMessage("success", response.message);
        window.location.href = "home";
    }
}