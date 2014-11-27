$.validator.setDefaults({

		highlight: function(element) {
	        $(element).closest('.form-group').addClass('has-error');
	    },
	    unhighlight: function(element) {
	        $(element).closest('.form-group').removeClass('has-error');
	    },
	    errorElement: 'span',
	    errorClass: 'help-block',
	    errorPlacement: function(error, element) {
	        if(element.parent('.input-group').length) {
	            error.insertAfter(element.parent());
	        } else {
	            error.insertAfter(element);
	        }
	    }
		
	});

	$(document).ready(function() {
		$("#FormularioAdicionaSetor").validate({
			rules: {
				'setor.nomeDoSetor': {
					required: true,
					minlength: 2,
					maxlength: 120
				},
				'setor.gestorResponsavel': {
					required: false,
					maxlength: 120
				},
			},
			
			messages: {
				'setor.nomeDoSetor':{
					required: "O nome do setor é necessário",
					maxlength: "Caracteres acima do permitido"
				},
				'setor.gestorResponsavel': "Limite excedido"
				
			} 
		});
	}); 
