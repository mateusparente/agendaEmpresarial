package br.com.mateus.agenda.controller;


import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.mateus.agenda.dao.UsuarioDao;
import br.com.mateus.agenda.mensagensDeFormulario.MensagensUsuario;
import br.com.mateus.agenda.modelo.Usuario;
import br.com.mateus.agenda.modelo.UsuarioWeb;
import br.com.mateus.agenda.validacoes.RegrasValidacaoFormulario;

@Resource
public class UsuariosController {
	
	private final UsuarioDao dao;
	private final Result result;
	private final Validator validator;
	private final UsuarioWeb usuarioWeb;
	private final MensagensUsuario mensagensValidacoes;
	private final RegrasValidacaoFormulario regrasValidacao;
	
	public UsuariosController(UsuarioDao dao, Result result, Validator validator, UsuarioWeb usuarioWeb, MensagensUsuario mensagensValidacoes, RegrasValidacaoFormulario regrasValidacao) {
		this.dao = dao;
		this.result = result;
		this.validator = validator;
		this.usuarioWeb = usuarioWeb;
		this.mensagensValidacoes = mensagensValidacoes;
		this.regrasValidacao = regrasValidacao;
	}
	
	@Post("/usuarios")
	public void adiciona(Usuario usuario){
		if(dao.existeUsuario(usuario)){
			validator.add(new ValidationMessage("Este usuário já existe", usuario.getLogin()));
		}
		regrasValidacao.validaFormularioAdicionaUsuario(usuario);
		dao.adiciona(usuario);
		mensagensValidacoes.enviaMensagemAdicionadoComSucesso();
		result.redirectTo(FuncionariosController.class).lista();
	}
	
	@Post("/login")
	public void login(Usuario usuario){
		Usuario carregado = dao.carrega(usuario);
		if(carregado == null){
			validator.add(new ValidationMessage("Login e/ou senha inválidos", null));
		}
		
		validator.onErrorUsePageOf(UsuariosController.class).loginForm();
		usuarioWeb.login(carregado);
		result.redirectTo(FuncionariosController.class).lista();
	}

	@Get("/login")
	public void loginForm(){}

	@Get("/novo")
	public void novo(){}
	
	@Path("/logout")
	public void logout(){
		usuarioWeb.logout();
		result.redirectTo(FuncionariosController.class).lista();
	}

}
