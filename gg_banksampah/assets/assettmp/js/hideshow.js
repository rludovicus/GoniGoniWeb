$("#selector").change(function() {
  if ($(this).val() == "unit") {
    $('#otherDiv').show();
  } else {
    $('#otherDiv').hide();
  }
});
$("#selector").trigger("change");

$("#pick").change(function() {
  if ($(this).val() == "hibah") {
    $('#otherpick').hide();
    $('#otherpicks').show();
  } else {
    $('#otherpick').show();
    $('#otherpicks').hide();
  }
});
$("#pick").trigger("change");