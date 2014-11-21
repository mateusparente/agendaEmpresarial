package br.com.mateus.agenda.controller;

import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.Validations;
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
	private final Validator validator;
	
	public FuncionariosController(FuncionarioDao dao, Result result, SetorDao setorDao, Validator validator){
		this.dao = dao;
		this.result = result;
		this.setorDao = setorDao;
		this.validator = validator;
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
		validator.checking(new Validations(){ {
			if(that(funcionario.getNome().length() >= 3,"funcionario.nome","nome.nulo")){
					that(funcionario.getNome().length() <3, "funcionario.nome","nome.invalido");
					that(funcionario.getRamal().length() >= 5,"funcionario.ramal","limite.ramal.excedido");
					that(funcionario.getTelefone().length() > 11,"funcionario.telefone","limite.tamanho.telefone.excedido");
					that(funcionario.getCelular().length() > 11, "funcionario.celular","limite.tamanho.telefone.excedido");
					that(funcionario.getCelularOutro().length() > 11, "funcionario.celularOutro","limite.tamanho.telefone.excedido");
					that(funcionario.getEmail().length() > 120, "funcionario.email","limite.tamanho.excedido");
					that(funcionario.getFuncao().length() > 100, "funcionario.funcao","limite.tamanho.excedido");
					that(funcionario.getObservacoes().length() > 254, "funcionario.observacoes","limite.tamanho.excedido");
			}
			
			}});
		
		validator.onErrorUsePageOf(FuncionariosController.class).adicionaNovoFuncionario();
		dao.salva(funcionario);
		result.redirectTo(FuncionariosController.class).lista();
	}

	/*private void validaCamposFormularioAdicionaContato(final Funcionario funcionario) {
		validator.checking(new Validations(){ {
		if(that(funcionario.getNome().length() >= 3,"funcionario.nome","nome.nulo")){
				that(funcionario.getNome().length() <3, "funcionario.nome","nome.invalido");
				that(funcionario.getRamal().length() >= 4,"funcionario.ramal","limite.ramal.excedido");
				that(funcionario.getTelefone().length() > 11,"funcionario.telefone","limite.tamanho.telefone.excedido");
				that(funcionario.getCelular().length() > 11, "funcionario.celular","limite.tamanho.telefone.excedido");
				that(funcionario.getCelularOutro().length() > 11, "funcionario.celularOutro","limite.tamanho.telefone.excedido");
				that(funcionario.getEmail().length() > 120, "funcionario.email","limite.tamanho.excedido");
				that(funcionario.getFuncao().length() > 100, "funcionario.funcao","limite.tamanho.excedido");
				that(funcionario.getObservacoes().length() > 254, "funcionario.observacoes","limite.tamanho.excedido");
		}
		validator.onErrorUsePageOf(FuncionariosController.class).adicionaNovoFuncionario();
		}});
	}*/
	
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
