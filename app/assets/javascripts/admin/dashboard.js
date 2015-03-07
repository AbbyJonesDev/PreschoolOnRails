// Use jQuery Datepicker in all browsers
// For consistent user experience
// Alt field and format needed to populate
// hidden field with Rails-friendly format
var dateInput = $('#visible-date-field');
dateInput.datepicker({
  dateFormat: 'mm-dd-yy',
  altFormat: "yy-mm-d",
  altField: "#hidden-date-field",
});
