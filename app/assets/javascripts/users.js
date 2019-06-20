
function editar(){
  $("#user_name").attr("disabled", false);
  $("#user_password").attr("disabled", false);
  $("#user_avatar").attr("disabled", false);
  $("#btn_save").attr("disabled", false);
  $("#btn_save").css("background", "blue");
  $("#btn_save").removeClass('btn-secondary');
  $("#btn_save").addClass('btn-primary');
  $("#btn-edit").removeClass('btn-info');
  $("#btn-edit").addClass('btn-secondary');
}