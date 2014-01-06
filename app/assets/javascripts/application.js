//= require jquery
//= require jquery_ujs
//= require ckeditor-jquery

$(function(){

$('#tags').tagsInput({
  "width": "100%",
  "height": "50%",
  'defaultText':''
}); 

$('#tags2').tagsInput({
  'width': '80%',
  'height': "50%",
  'defaultText':'Expertise'
}); 

$('#tags3').tagsInput({
  'width': '90%',
  'height': "50%",
  'defaultText':'Add Tag',
'autocomplete_url':'/2013/js/jQuery-Tags-Input/test/fake_json_endpoint.html' // jquery ui autocomplete requires a json endpoint
});

$('#tags4').tagsInput({
  'width': '80%',
  'height': "50%",
  'defaultText':'Interest'
}); 

$('#tags_tag').focus();
});
// var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
// document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
