package br.com.mateus.agenda.controller;

import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.mateus.agenda.dao.FuncionarioDao;
import br.com.mateus.agenda.dao.SetorDao;
import br.com.mateus.agenda.interceptor.Restrito;
import br.com.mateus.agenda.modelo.Funcionario;
import br.com.mateus.agenda.validacoes.RegrasValidacaoFormulario;

@Resource
public class FuncionariosController {

	private final FuncionarioDao dao;
	private final SetorDao setorDao;
	private final Result result;
	private final Validator validator;
	private final RegrasValidacaoFormulario regrasValidacao;
	
	public FuncionariosController(FuncionarioDao dao, Result result, SetorDao setorDao, Validator validator, RegrasValidacaoFormulario regrasValidacao){
		this.dao = dao;
		this.result = result;
		this.setorDao = setorDao;
		this.validator = validator;
		this.regrasValidacao = regrasValidacao;
	}
	
	
	@Get("/funcionarios")
	public List<Funcionario> lista(){
		setorDao.incluiSetores();
		return dao.listaTudo();
	}
	
	@Post("/funcionarios")
	public void adiciona(final Funcionario funcionario){
		regrasValidacao.validaFormularioAdicionaFuncionario(funcionario);
		validator.onErrorUsePageOf(FuncionariosController.class).adicionaNovoFuncionario();
		dao.salva(funcionario);
		result.redirectTo(FuncionariosController.class).lista();
	}

	
	@Get("/funcionarios/novo")
	public void adicionaNovoFuncionario(){
		setorDao.incluiSetores();
	}
	
	@Restrito
	@Get("edita/{id}")
	public Funcionario edita(Integer id){
		setorDao.incluiSetores();
		return dao.carrega(id);
	}
	
	@Restrito
	@Post("/altera")
	public void altera(Funcionario funcionario){
		dao.atualiza(funcionario);
		result.redirectTo(this).lista();
	}
	
	@Restrito
	@Get("remove")
	public void remove(Integer id){
		Funcionario funcionario = dao.carrega(id);
		dao.remove(funcionario);
		result.redirectTo(this).lista();
	}
	
	@Get("busca")
	public void busca(){ setorDao.incluiSetores(); }
	
	@Get("/buscaFuncionario")
	public List<Funcionario> resultadoBuscaFuncionario(String nome, String setor){
		setorDao.incluiSetores();
		result.include("nome",nome);
		result.include("setor",setor);
		return dao.busca(nome,setor);
	}
	
	
}
