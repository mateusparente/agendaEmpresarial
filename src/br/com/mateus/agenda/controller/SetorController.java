package br.com.mateus.agenda.controller;

import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.mateus.agenda.dao.SetorDao;
import br.com.mateus.agenda.modelo.Setor;
import br.com.mateus.agenda.validacoes.RegrasValidacaoFormulario;

@Resource
public class SetorController {

	private final SetorDao dao;
	private final Result result;
	private final RegrasValidacaoFormulario regrasValidacaoFormulario;
	
	public SetorController(SetorDao dao, Result result, RegrasValidacaoFormulario regrasValidacaoFormulario) {
		this.dao = dao;
		this.result = result;
		this.regrasValidacaoFormulario = regrasValidacaoFormulario;
	}
	
	
	@Get("/setores")
	public List<Setor> lista(){
		dao.incluiSetores();
		return dao.listaTudo();
	}
	
	@Post("/setores")
	public void adiciona(final Setor setor){
		regrasValidacaoFormulario.validaFormularioAdicionaSetores(setor);
		dao.salva(setor);
		result.redirectTo(this).lista();
	}
	
	@Get("/setores/novo")
	public void adicionaNovoSetor(){dao.incluiSetores();}
	
	
	
}
