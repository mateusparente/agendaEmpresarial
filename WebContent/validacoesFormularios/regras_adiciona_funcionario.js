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

		$("#FormularioAdicionaFuncionario").validate({
			rules: {
				'funcionario.nome': {
					required: true,
					minlength: 2,
					maxlength: 100
				},
				'funcionario.email':{
					required: false,
					maxlength: 100,
					email: true
				},
				'funcionario.funcao':{
					required: false,
					maxlength: 120,
				},
				'funcionario.observacoes':{
					required: false,
					maxlength: 255,
				},
				
			},
			
			messages: {
				'funcionario.nome': {
					required: "O nome é necessário",
					maxlength: "Acima de caracteres permitido",
				},
				'funcionario.observacoes': "Limite de tamanho atingido",
				'funcionario.email': {
					email: "Email inválido",
					maxlength: "Acima de caracteres permitido"
				}
			} 

			
		});

		$("#Ramal").mask('9999');
		$("#Telefone").mask('(99)9999-9999?9');
		$("#Celular").mask('(99)9999-9999?9');
		$("#Celular2").mask('(99)9999-9999?9');
		
	}); 