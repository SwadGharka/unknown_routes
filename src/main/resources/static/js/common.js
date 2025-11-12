var APPLICATION_JSON_VALUE = "application/json";
function getDataByPayloadWithParentUrl(method, globalflag, showMessage, url, payload){
  // return new Promise(function (resolve, reject) {
    // let payload = {}
    // payload["payload"] = JSON.stringify(data)
      $.ajax({
          type : method,
          contentType : APPLICATION_JSON_VALUE,
          url: url,
          data : JSON.stringify(payload),
          dataType : 'json',
          global : globalflag,
          success : function(data) {
            // resolve(data);
          },
          error: function (xhr, status, e) {
                if(showMessage){
                    alert(xhr.responseText);
                }
                // reject(e);
            }
      });
  // });
}

function encode(payload) {
  return window.btoa(encodeURI(payload));
}

$.ajaxSetup({
  beforeSend: function (xhr, settings) {
    if (settings.data != undefined) {
      if (settings.contentType == APPLICATION_JSON_VALUE) {
        // var KEUS = getSecreteKey();
        // AesUtil(KEUS.KEYSIZE, KEUS.ITERATIONS);
        var payload = {};
        // payload['payload']=AesUtil.prototype.encrypt(KEUS.SALT, KEUS.IV, KEUS.PASSPHRASE, settings.data);
        // console.log('settings.data '+settings.data)
        // payload["payload"] = encode(settings.data);
        payload["payload"] = (settings.data);
        settings.data = JSON.stringify(payload);
      }
    }
    // xhr.setRequestHeader("UNIQUEUUID", UNIQUEUUID);
  },
});