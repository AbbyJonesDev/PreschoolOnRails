var sc = $("#announcement_select_classes");
var ac = $('#announcement_all_classes');
var class_list = sc.data('klasses');
var options = "";
var class_select_options = $('<div class="medium-12 columns" id="class_list_options"><select multiple' + 
      " name='announcement[klasses][]'>" + class_options(class_list) +
      '</select></div>');

function class_options(data) {
  // Create options elements for multiple select
  if (options === "") {
    for(key in data) {
      options += 
      "<option value=" + 
      data[key] + ">" + key + 
      "</option>"
    };
  };
  return options;
};

sc.click(function() {
  if(sc.prop('checked') === true) {
    ac.prop('checked', false);
    sc.parent().after(class_select_options);
  } else {
    ac.prop('checked', true);
    $('#class_list_options').remove();
  };
});

ac.click(function() {
  if(ac.prop('checked') === true) {
    sc.prop('checked', false);
    $('#class_list_options').remove();
  } else {
    sc.prop('checked', true)
    sc.parent().after(class_select_options);
  };
});