$("#toggle-vocab").click(function() {
  if (/Vocabulary/.test(this.text)) {
    $('object').attr('data', $(this).data('vocab'));
    $(this).text("Show Peek")
  } else {
    $('object').attr('data', $(this).data('peek'));
    $(this).text("Show Vocabulary")
  }
});