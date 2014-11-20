//= require jquery
//= require jquery_ujs
//
//= require scrivito
//
//= require_self

scrivito.on('load', function() {
  // Configure content browser to show an image filter
  scrivito.content_browser.filters = {
    'images': {
      title: 'Images',
      query: scrivito.obj_where('_obj_class', 'equals', 'Image'),
      icon: 'scrivito-resourcebrowser-icon-image'
    }
  };
});
