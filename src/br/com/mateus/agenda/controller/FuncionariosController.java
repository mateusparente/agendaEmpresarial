package br.com.mateus.agenda.controller;

import java.util.List;





import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.mateus.agenda.dao.FuncionarioDao;
import br.com.mateus.agenda.dao.SetorDao;
import br.com.mateus.agenda.interceptor.Restrito;
import br.com.mateus.agenda.modelo.Funcionario;
import br.com.mateus.agenda.modelo.Setor;

@Resource
public class FuncionariosController {

	private final FuncionarioDao dao;
	private final SetorDao setorDao;
	private final Result result;
	
	public FuncionariosController(FuncionarioDao dao, Result result, SetorDao setorDao){
		this.dao = dao;
		this.result = result;
		this.setorDao = setorDao;
	}
	
	private void incluiSetores() {
		List<Setor> setores = setorDao.listaTudo();
		result.include("setores", setores);
	}
	
	@Get("/funcionarios")
	public List<Funcionario> lista(){
		incluiSetores();
		return dao.listaTudo();
	}
	
	@Post("/funcionarios")
	public void adiciona(final Funcionario funcionario){
		dao.salva(funcionario);
		result.redirectTo(this).lista();
	}
	
	@Get("/funcionarios/novo")
	public void adicionaNovoFuncionario(){
		incluiSetores();
	}
	
	@Restrito
	@Get("edita/{id}")
	public Funcionario edita(Integer id){
		incluiSetores();
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
	public void busca(){ incluiSetores(); }
	
	@Get("/buscaFuncionario")
	public List<Funcionario> resultadoBuscaFuncionario(String nome, String setor){
		incluiSetores();
		result.include("nome",nome);
		result.include("setor",setor);
		return dao.busca(nome,setor);
	}
	
	
}
