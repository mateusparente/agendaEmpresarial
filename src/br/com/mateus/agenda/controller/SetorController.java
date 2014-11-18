package br.com.mateus.agenda.controller;

import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.mateus.agenda.dao.SetorDao;
import br.com.mateus.agenda.modelo.Setor;

@Resource
public class SetorController {

	private final SetorDao dao;
	private final Result result;
	
	public SetorController(SetorDao dao, Result result) {
		this.dao = dao;
		this.result = result;
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
		dao.salva(setor);
		result.redirectTo(this).lista();
	}
	
	@Get("/setores/novo")
	public void adicionaNovoSetor(){ incluiSetores(); }
	
	
	
}
