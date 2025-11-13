function showMessage(type, message) {
  $(".custom-alert").remove();

  let gradient;
  if (type === "success") gradient = "linear-gradient(135deg, #198754, #20c997)";
  else if (type === "error") gradient = "linear-gradient(135deg, #dc3545, #fd7e14)";
  else if (type === "warning") gradient = "linear-gradient(135deg, #ffc107, #fd7e14)";
  else gradient = "linear-gradient(135deg, #667eea, #764ba2)";

  const alertBox = $(`
    <div class="custom-alert" style="
      position: fixed;
      top: -80px;
      left: 50%;
      transform: translateX(-50%);
      background: ${gradient};
      color: white;
      padding: 16px 32px;
      border-radius: 16px;
      font-family: 'Poppins', sans-serif;
      font-size: 15px;
      font-weight: 500;
      text-align: center;
      box-shadow: 0 8px 25px rgba(0,0,0,0.2);
      backdrop-filter: blur(15px);
      z-index: 9999;
      opacity: 0;
      transition: all 0.5s ease;
    ">
      ${
        type === "success"
          ? "✅"
          : type === "error"
          ? "❌"
          : type === "warning"
          ? "⚠️"
          : "ℹ️"
      }
      <span style="margin-left:8px;">${message}</span>
    </div>
  `);

  $("body").append(alertBox);

  setTimeout(() => {
    alertBox.css({ top: "40px", opacity: "1" });
  }, 100);

  setTimeout(() => {
    alertBox.css({ top: "-80px", opacity: "0" });
    setTimeout(() => {
      alertBox.remove();
    }, 500);
  }, 3000);
}

function encode(payload) {
  return window.btoa(encodeURI(payload));
}

$.ajaxSetup({
  beforeSend: function (xhr, settings) {
    if (settings.data != undefined) {
      if (settings.contentType == APPLICATION_JSON_VALUE) {
        var payload = {};
        // console.log('settings.data '+settings.data)
        payload["payload"] = encode(settings.data);
        // payload["payload"] = (settings.data);
        settings.data = JSON.stringify(payload);
      }
    }
  },
});

var APPLICATION_JSON_VALUE = "application/json";
function getDataByPayloadWithParentUrl(method, globalflag, isMessageShow, url, payload){
  return new Promise(function (resolve, reject) {
      $.ajax({
          type : method,
          contentType : APPLICATION_JSON_VALUE,
          url: url,
          data : JSON.stringify(payload),
          dataType : 'json',
          global : globalflag,
          success : function(data) {
            resolve(data)
          },
          error: function (xhr, status, e) {
                if(isMessageShow){
                    showMessage('error','request failed')
                }
                reject(e);
            }
      });
  });
}

