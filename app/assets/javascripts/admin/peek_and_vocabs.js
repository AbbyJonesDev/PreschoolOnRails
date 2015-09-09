$("#toggle-vocab").click(function() {
  if (this.text === "Show Vocabulary") {
    $('object').attr('data', $(this).data('vocab'));
    $(this).text("Show Peek")
  } else {
    $('object').attr('data', $(this).data('peek'));
    $(this).text("Show Vocabulary")
  }
});