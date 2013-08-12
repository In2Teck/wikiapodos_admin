var selectedApodos = [];

$(document).on("ready", function(){
  $("#usuarios-li").addClass("active")
});

function getApodosCreados(usuarioId) {
	$.ajax({
    beforeSend: function( xhr ) {
      var token = $('meta[name="csrf-token"]').attr('content');
      if (token) xhr.setRequestHeader('X-CSRF-Token', token);
    }, 
    type: "POST",
    url: "/usuarios/" + usuarioId + "/get_apodos_creados",
    dataType: "json",
    success: function(data, textStatus, jqXHR) {
      $("#myModal h2").text("Apodos Creados");
      showModal(data);
    },
    error: function() {
    } 
  });
}

function getApodosAsignados(usuarioId) {
		$.ajax({
    beforeSend: function( xhr ) {
      var token = $('meta[name="csrf-token"]').attr('content');
      if (token) xhr.setRequestHeader('X-CSRF-Token', token);
    }, 
    type: "POST",
    url: "/usuarios/" + usuarioId + "/get_apodos_asignados",
    dataType: "json",
    success: function(data, textStatus, jqXHR) {
      var apodos = [];
      for (var index = 0; index < data.length; index++) {
				apodos.push(data[index].apodo);
      }
      $("#myModal h2").text("Apodos Recibidos");
      showModal(apodos);
    },
    error: function() {
    } 
  });
}

function showModal(apodos) {
	$("#apodosUsuario").empty();
  
  if (apodos.length > 0) {
    for (var index = 0; index < apodos.length; index++) {
      var imagePath = "http://apps.t2omedia.com.mx/php1/wikiapodos/images/apodos/" + apodos[index].imagen_url;
      var apodoName = apodos[index].prefijo + " " + apodos[index].nombre;
      $("#apodosUsuario").append('<tr><td class="centered"><img class="apodo-thumb" src="' + imagePath + '"/> ' + apodoName + '</td></tr>');
    }
  }
  else {

  }
  $("#myModal").modal({maxWidth:300, minHeight:450});
}
