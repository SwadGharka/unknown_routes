function bindActivity(){
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
}