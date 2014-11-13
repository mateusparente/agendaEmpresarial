package br.com.mateus.agenda.controller;

import javax.servlet.jsp.tagext.ValidationMessage;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.Message;
import br.com.mateus.agenda.dao.UsuarioDao;
import br.com.mateus.agenda.modelo.Usuario;
import br.com.mateus.agenda.modelo.UsuarioWeb;

@Resource
public class UsuariosController {
	
	private final UsuarioDao dao;
	private final Result result;
	private final Validator validator;
	private final UsuarioWeb usuarioWeb;
	
	public UsuariosController(UsuarioDao dao, Result result, Validator validator, UsuarioWeb usuarioWeb) {
		super();
		this.dao = dao;
		this.result = result;
		this.validator = validator;
		this.usuarioWeb = usuarioWeb;
	}
	
	@Post("/usuarios")
	public void adiciona(Usuario usuario){
		if(dao.existeUsuario(usuario)){
			validator.add((Message) new ValidationMessage("Login ja existe", "usuario.login"));
		}
		validator.onErrorUsePageOf(UsuariosController.class).novo();
		dao.adiciona(usuario);
		result.redirectTo(FuncionariosController.class).lista();
	}
	
	@Post("/login")
	public void login(Usuario usuario){
		Usuario carregado = dao.carrega(usuario);
		if(carregado == null){
			validator.add((Message) new ValidationMessage("Login e/ou senha inválidos", "usuario.login"));
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
