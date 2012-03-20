//= require jquery.autoGrowInput
//= require jquery.tagBox
//= require jquery.ui.autocomplete

$().ready(function() {
  var $tagbox = $('#bookmark_tag_list').tagBox({
    add_on_blur: true
  });
  var tagbox = $tagbox.data('tagbox');
  
  $('ul.tagbox input').autocomplete({
  	source: function(request, response) {
      response($.grep($tagbox.data('autocomplete'), function(item) {
        return item.indexOf(request.term) == 0;
      }).slice(0, 5).sort());
    },

    open: function(event, ui) {
      tagbox.disableAddOnBlur();
    },

    close: function(event, ui) {
      tagbox.enableAddOnBlur();
    },

    select: function(event, ui) {
      event.preventDefault();
      if (event.originalEvent.originalEvent.type != "keydown") {
        $(this).val("");
        tagbox.addTag(ui.item.value);
      }
    }

  });
});
