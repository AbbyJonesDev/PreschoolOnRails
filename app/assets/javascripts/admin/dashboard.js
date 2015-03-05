if (!Modernizr.inputtypes.date) {
    // Insert hidden field - needed to convert
    // jQuery Datepicker format to format Rails accepts
    $('input[type=date]').after('<input id="hidden-date-field" type="hidden" value="" name="announcement[expires_on]">');
    // Initialize datepicker and formats
    $('input[type=date]').datepicker({
      dateFormat: 'mm-dd-yy',
      altFormat: "yy-mm-d",
      altField: "#hidden-date-field",
    });
}