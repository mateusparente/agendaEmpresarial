package br.com.mateus.agenda.controller;

import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.mateus.agenda.dao.SetorDao;
import br.com.mateus.agenda.modelo.Setor;

@Resource
public class SetorController {

	private final SetorDao dao;
	private final Result result;
	private final Validator validator;
	
	public SetorController(SetorDao dao, Result result, Validator validator) {
		this.dao = dao;
		this.result = result;
		this.validator = validator;
	}
	
	private void incluiSetores() {
		List<Setor> setores = dao.listaTudo();
		result.include("setores", setores);
	}
	
	@Get("/setores")
	public List<Setor> lista(){
		incluiSetores();
		return dao.listaTudo();
	}
	
	@Post("/setores")
	public void adiciona(final Setor setor){
		if(setor.getNomeDoSetor().length()<=2){
			validator.add(new ValidationMessage("Nome do setor inválido", setor.getNomeDoSetor()));
		}
		validator.onErrorUsePageOf(SetorController.class).adicionaNovoSetor();
		dao.salva(setor);
		result.redirectTo(this).lista();
	}
	
	@Get("/setores/novo")
	public void adicionaNovoSetor(){ incluiSetores(); }
	
	
	
}
