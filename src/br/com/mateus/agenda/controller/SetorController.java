package br.com.mateus.agenda.controller;

import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.mateus.agenda.dao.SetorDao;
import br.com.mateus.agenda.mensagensDeFormulario.MensagensSetor;
import br.com.mateus.agenda.modelo.Setor;
import br.com.mateus.agenda.validacoes.RegrasValidacaoFormulario;

@Resource
public class SetorController {

	private final SetorDao dao;
	private final Result result;
	private final RegrasValidacaoFormulario regrasValidacaoFormulario;
	private final MensagensSetor mensagensDeValidacao;
	
	public SetorController(SetorDao dao, Result result, RegrasValidacaoFormulario regrasValidacaoFormulario, MensagensSetor mensagensDeValidacao) {
		this.dao = dao;
		this.result = result;
		this.regrasValidacaoFormulario = regrasValidacaoFormulario;
		this.mensagensDeValidacao = mensagensDeValidacao;
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
			mensagensDeValidacao.enviaMensagemAdicionadoComSucesso();
			result.redirectTo(this).lista();
	}
	
	@Get("/setores/novo")
	public void adicionaNovoSetor(){dao.incluiSetores();}
	
	@Get("removeSetor")
	public void removeSetor(Integer id){
		Setor carregaSetor = dao.carrega(id);
		dao.remove(carregaSetor);
		mensagensDeValidacao.enviaMensagemRemovidoComSucesso();
		result.redirectTo(this).lista();
	}
	
	
	
}
