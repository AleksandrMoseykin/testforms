$( document ).on('turbolinks:load', function() {
  $(".zag-tabl").on("click", function(){
  $(this).nextUntil(".zag-tabl").slideToggle(200);
  });
});

$( document ).on('turbolinks:load', function() {
  $(".buttonname").on("click", function(){
  $(".disnone").slideToggle(200);
  $(".buttonname").hide();
  $(".buttomout").hide();
  });
});

$( document ).on('turbolinks:load', function() {
  $(".buttomout").on("click", function(){
  $(".dsnone").slideToggle(200);
  $(".buttonname").hide();
  $(".buttomout").hide();
  });
});
