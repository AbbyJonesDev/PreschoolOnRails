if (!Modernizr.inputtypes.date) {
    var dateInput = $('input[type=date]');
    // Insert hidden field - needed to convert
    // jQuery Datepicker format to format Rails accepts
    dateInput.after('<input id="hidden-date-field" type="hidden" value="" name="announcement[expires_on]">');
    // Initialize datepicker and formats
    dateInput.datepicker({
      dateFormat: 'mm-dd-yy',
      altFormat: "yy-mm-d",
      altField: "#hidden-date-field",
    });
}