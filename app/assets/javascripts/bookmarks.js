//= require jquery.autoGrowInput
//= require jquery.tagBox
//= require jquery.ui.autocomplete

$().ready(function() {
  var $tagbox = $('#bookmark_tag_list').tagBox({
    add_on_blur: true
  });
  var tagbox = $tagbox.data('tagbox');
  $('ul.tagbox input').autocomplete({
  	source: $tagbox.data('autocomplete'),

    open: function(event, ui) {
      tagbox.disableAddOnBlur();
    },

    close: function(event, ui) {
      tagbox.enableAddOnBlur();
    },

    select: function(event, ui) {
      $(this).val(ui.item.value);
      tagbox.commitTag();
      event.preventDefault();
    }

  });
});