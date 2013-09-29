$(document).on("ready", function(){
  $("#resumen-li").addClass("active")
});

function remindUsers() {
	$("#notification-sent").text("Enviando....");
	$.ajax({
    beforeSend: function( xhr ) {
      var token = $('meta[name="csrf-token"]').attr('content');
      if (token) xhr.setRequestHeader('X-CSRF-Token', token);
    }, 
    type: "GET",
    url: "/remind_usuarios",
    dataType: "json",
    success: function(data, textStatus, jqXHR) {
      for (var index = 0; index < data.length; index++) { 
        var path = data[index].usuario_desde_id + "/notifications";
        FB.api(path,'post', {template: 'Recuérdale AQUÍ a tu amigo que tiene un APODO ESPECIAL', access_token:'288059641339246|5PG-X6NMHr1_GInslDzsZI-ioMg', href:'?page=apodos&tipo=enviados'}, function(response){console.log(response)});
      }
      $("#notification-sent").text("Se enviaron " + data.length + " notificaciones.");
    },
    error: function() {
    } 
  });
}

function clearContest() {
	$("#contest-reset").text("Reiniciando....");
	$.ajax({
    beforeSend: function( xhr ) {
      var token = $('meta[name="csrf-token"]').attr('content');
      if (token) xhr.setRequestHeader('X-CSRF-Token', token);
    }, 
    type: "GET",
    url: "/clear_contest",
    dataType: "json",
    success: function(data, textStatus, jqXHR) {
      $("#contest-reset").text("Concurso reiniciado.");
    },
    error: function() {
    } 
  });
}