$(document).ready(function() {
  $("#show-shop-stats").click(function() {
    $("#coffeeshop-stats").toggleClass("hidden");
    if ( $("#show-shop-stats").text() === "hide" ) {
      $("#show-shop-stats").text("View Coffeeshop Stats");
    } else {
      $("#show-shop-stats").text("hide");
    }
  });

  $("#show-user-stats").click(function() {
    $("#user-stats").toggleClass("hidden");
    if ( $("#show-user-stats").text() === "hide" ) {
      $("#show-user-stats").text("View User Stats");
    } else {
      $("#show-user-stats").text("hide");
    }
  });
});
