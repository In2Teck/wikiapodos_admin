$(document).on("ready", function(){
  $("#apodos-li").addClass("active")
});

function getUsuarios(apodoId) {
    $.ajax({
    beforeSend: function( xhr ) {
      var token = $('meta[name="csrf-token"]').attr('content');
      if (token) xhr.setRequestHeader('X-CSRF-Token', token);
    }, 
    type: "POST",
    url: "/apodos/" + apodoId + "/get_usuarios",
    dataType: "json",
    success: function(data, textStatus, jqXHR) {
      var usuarios = [];
      for (var index = 0; index < data.length; index++) {
        if (data[index].usuario_para)
          usuarios.push(data[index].usuario_para);
      }
      $("#myModal h2").text("Usuarios Apodados");
      showModal(usuarios);
    },
    error: function() {
    } 
  });
}

function showModal(usuarios) {
  $("#usuariosApodo").empty();
  
  if (usuarios.length > 0) {
    for (var index = 0; index < usuarios.length; index++) {
      var imagePath = "https://graph.facebook.com/" + usuarios[index].facebook_id + "/picture";
      var name = usuarios[index].nombre + ' ' + usuarios[index].apellido;
      var profile = "http://facebook.com/" + usuarios[index].facebook_id;
      var mail = usuarios[index].email;
      $("#usuariosApodo").append('<tr><td class="centered"><a class="horizontal" target="_blank" href="' + profile + '"><img class="usuario-thumb horizontal" src="' + imagePath + '"/>' + name + '</a></td><td>' + mail +'</td></tr>');
    }
  }
  else {
     $("#myModal h2").text("No tiene usuarios registrados");
  }
  $("#myModal").modal({minWidth:650, minHeight:500});
}


function updateVisible(apodo, html) {
	 $.ajax({
    beforeSend: function( xhr ) {
      var token = $('meta[name="csrf-token"]').attr('content');
      if (token) xhr.setRequestHeader('X-CSRF-Token', token);
    }, 
    type: "POST",
    url: "/apodos/" + apodo + "/update_visible",
    dataType: "json",
    success: function(data, textStatus, jqXHR) {
      if (data.visible) {
      	$(html).text("Ocultar");
      }
      else {
      	$(html).text("Mostrar");
      }
    },
    error: function() {
    } 
  });
}

function updateDestacado(apodo, html) {
	 $.ajax({
    beforeSend: function( xhr ) {
      var token = $('meta[name="csrf-token"]').attr('content');
      if (token) xhr.setRequestHeader('X-CSRF-Token', token);
    }, 
    type: "POST",
    url: "/apodos/" + apodo + "/update_destacado",
    dataType: "json",
    success: function(data, textStatus, jqXHR) {
      if (data.destacado) {
      	$(html).text("Remover");
      }
      else {
      	$(html).text("Agregar");
      }
    },
    error: function() {
    } 
  });
}

function updateEstrella(apodo, html) {
   $.ajax({
    beforeSend: function( xhr ) {
      var token = $('meta[name="csrf-token"]').attr('content');
      if (token) xhr.setRequestHeader('X-CSRF-Token', token);
    }, 
    type: "POST",
    url: "/apodos/" + apodo + "/update_estrella",
    dataType: "json",
    success: function(data, textStatus, jqXHR) {
      if (data.es_estrella == 1) {
        $(html).text("Remover");
      }
      else {
        $(html).text("Agregar");
      }
    },
    error: function() {
    } 
  });
}

function filterResults(column, direction) {
  //console.log(column + ' ' + direction + ' ' + $("#filter")[0].value);
  top.location = "/apodos?sort=" + column + "&direction=" + direction + "&filter=" + $("#filter")[0].value
}

function clearFilter() {
  $("#filter")[0].value = "";
  top.location = "/apodos?";
}