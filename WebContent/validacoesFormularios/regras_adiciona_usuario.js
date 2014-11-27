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
	$("#usuariosForm").validate({
		rules: {
			'usuario.nome': {
				required: true,
				minlength: 2,
				maxlength: 100
			},
			'usuario.login': {
				required: true,
				maxlength: 50,
				minlength: 4,
			},
			'usuario.senha':{
				required:true,
				maxlength:50,
				minlength:4,
			},
			'confirmacao':{
				required:true,
				maxlength:50,
				minlength:4,
				equalTo: '#senha'
			}
		},
		
		messages: {
			'usuario.nome': {
				required: "O nome do usuário é necessário",
				minlength: "Nome de usuário precisa ter no mínimo 2 caracteres",
				maxlength: "Limite de caracteres excedido",
			},
			'usuario.login': {
				required: "O login é necessário",
				minlength: "Login precisa ter no mínimo 4 caracteres",
				maxlength: "Limite de caracteres excedido",
			},'usuario.senha': {
				required: "Uma senha é necessária",
				minlength: "A senha precisa ter no mínimo 4 caracteres",
				maxlength: "Limite de caracteres excedido",
			},
			'confirmacao':{
				required: "A confirmação de senha é necessária",
				minlength: "A senha precisa ter no mínimo 4 caracteres",
				maxlength: "Limite de caracteres excedido",
				equalTo: "As senhas digitadas não são iguais",
			}
			
		} 
	});
}); 