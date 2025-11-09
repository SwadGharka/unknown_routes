var APPLICATION_JSON_VALUE = "application/json";
function getDataByPayloadWithParentUrl(method, globalflag, showMessage, url, payload){
  return new Promise(function (resolve, reject) {
      $.ajax({
          type : method,
          contentType : APPLICATION_JSON_VALUE,
          url: url,
          data : JSON.stringify(payload),
          dataType : 'json',
          global : globalflag,
          success : function(data) {
            resolve(data);
          },
          error: function (xhr, status, e) {
              if(showMessage){
                alert(data.message)
              }
              reject(e);
          }
      });
  });
}
