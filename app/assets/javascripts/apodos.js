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
      var label;      
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
      var label;
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