
(function () {
  let raw = document.getElementById("serverData").dataset.packages || "[]";
  let serverPackages = [];

  try {
    serverPackages = JSON.parse(raw);
  } catch (e) {
    serverPackages = [];
  }

  // fallback sample
  const fallback = [
    { id:1, name:"BRB Package", destination:"Manali", category:["Adventure","Adventure","Adventure"], status:1, code:"BRB001" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" },
    { id:2, name:"TTYL Package", destination:"Goa", category:["Beach","Relax"], status:0, code:"TTYL002" }
];

  const packages = serverPackages.length ? serverPackages : fallback;

  function escapeHtml(s){
    return String(s || "")
      .replace(/&/g,"&amp;")
      .replace(/</g,"&lt;")
      .replace(/>/g,"&gt;")
      .replace(/"/g,"&quot;");
  }

  function renderTable(list){
    let html = "";

    list.forEach((pkg, i)=>{
      const categories = (pkg.categoryId || pkg.category || [])
          .map(c => `
            <c:forEach var="c" items="${pkg.categoryNames}">
                <span style="
                    background: rgba(111,66,193,0.15);
                    color: #4a0e74;
                    padding: 3px 8px;
                    border-radius: 8px;
                    margin-right: 4px;
                    display: inline-block;
                    font-size: 12px;
                ">
                ${c}
                </span>
            </c:forEach>`).join("");

      const status = pkg.status == 1
          ? `<span class="status-active">Active</span>`
          : `<span class="status-inactive">Inactive</span>`;

      html += `
        <tr>
          <td style="width:70px; text-align:center;">${i+1}</td>
          <td style="text-align:left;width:200px;">${escapeHtml(pkg.name)}</td>
          <td style="width:160px;">${escapeHtml(pkg.destination)}</td>
          <td style="width:130px;">${categories}</td>
          <td style="width:110px;">${status}</td>
          <td style="width:150px;">${escapeHtml(pkg.code || "PKG" + (100+i))}</td>
          <td style="width:200px;">
            <button class="action-btn action-edit" onclick="location.href='add-package?packageId=${pkg.id}'">Edit</button>
            ${
              pkg.status == 1
                ? `<button class="action-btn action-deactivate" onclick="toggleStatus('${pkg.id}',0)">Deactivate</button>`
                : `<button class="action-btn action-activate" onclick="toggleStatus('${pkg.id}',1)">Activate</button>`
            }
          </td>
        </tr>`;
    });

    document.getElementById("packageTableBody").innerHTML = html;
  }


  window.toggleStatus = function(id, newStatus){
    const item = packages.find(p => p.id == id);
    if(item){
      item.status = newStatus;
      renderTable(packages);
    }
  };

  renderTable(packages);
})();

async function editPackage(id){
    let payload = {
        'packageId' : $("#packageId").val()
    }
    const response = await getDataByPayloadWithParentUrl("GET", true, true, BASE_URL + CONTEXT_PATH + "dashboard/add-package", "");
}