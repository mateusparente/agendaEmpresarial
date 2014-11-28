package br.com.mateus.agenda.validacoes;

import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.validator.Validations;
import br.com.mateus.agenda.controller.FuncionariosController;
import br.com.mateus.agenda.controller.SetorController;
import br.com.mateus.agenda.controller.UsuariosController;
import br.com.mateus.agenda.dao.SetorDao;
import br.com.mateus.agenda.modelo.Funcionario;
import br.com.mateus.agenda.modelo.Setor;
import br.com.mateus.agenda.modelo.Usuario;

@Component
public final class RegrasValidacaoFormulario {

	private final Validator validator;
	private final SetorDao setorDao;
	
	public RegrasValidacaoFormulario(Validator validator, SetorDao setorDao) {
		this.validator = validator;
		this.setorDao = setorDao;
	}
	
	//String formatoTelefone = "[0-9]{1,11}";
	//String formatoTelefone = "\\((13)|([1-9][1-9])\\)[2-9][0-9]{3}-[0-9]{4}";
	

	private static final String EMAIL_PATTERN = 
			"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		

	public boolean validaFormularioAdicionaFuncionario(final Funcionario funcionario) {
		validator.checking(new Validations() {{
			if (that(!(funcionario.getNome().isEmpty()), "Erro", "nome.nulo")) {
				that(!(funcionario.getNome().length() <= 2), funcionario.getNome(), "nome.invalido");
				
				if (funcionario.getRamal().length() > 0) {
					// that(!(funcionario.getRamal().matches(formatoTelefone)==false),funcionario.getRamal(),"telefone.invalido");
					that(!(funcionario.getRamal().length() > 4), funcionario.getRamal(), "limite.ramal.excedido");
					that(!(funcionario.getRamal().length() < 4), funcionario.getRamal(), "telefone.invalido");
				}
                
				if (funcionario.getTelefone().length() > 0) {
					that(!(funcionario.getTelefone().length() > 14), "Campo telefone", "limite.tamanho.excedido");
					// that(!(funcionario.getTelefone().matches(formatoTelefone)==false),"Campo telefone","telefone.invalido");
					that(!(funcionario.getTelefone().length() < 10), "Campo telefone", "telefone.invalido");
				}
                
				if (funcionario.getCelular().length() > 0) {
					that(!(funcionario.getCelular().length() > 14), "Campo Celular", "limite.tamanho.excedido");
					// that(!(funcionario.getTelefone().matches(formatoTelefone)==false),"Campo Celular","telefone.invalido");
					that(!(funcionario.getTelefone().length() < 10), "Campo celular", "telefone.invalido");
				}
                
				if (funcionario.getCelular().length() > 0) {
					that(!(funcionario.getCelularOutro().length() > 14), "Campo Celular adicional", "limite.tamanho.excedido");
					// that(!(funcionario.getTelefone().matches(formatoTelefone)==false),"Campo Celular adicional","telefone.invalido");
					that(!(funcionario.getTelefone().length() < 10), "Campo celular 2", "telefone.invalido");
				}
                
				if (funcionario.getEmail().length() > 0) {
					that(!(funcionario.getEmail().length() > 120), "Campo Email", "limite.tamanho.excedido");
					that(!(funcionario.getEmail().matches(EMAIL_PATTERN) == false), "Campo Email", "email.invalido");
				}
				
				that(!(funcionario.getFuncao().length() > 100), "Campo Função","limite.tamanho.excedido");
				that(!(funcionario.getObservacoes().length() > 254), "Campo Observações","limite.tamanho.excedido");
			}
			
			setorDao.incluiSetores();
			
		}});
		
		validator.onErrorUsePageOf(FuncionariosController.class).adicionaNovoFuncionario();
		
		return validator.hasErrors();
	}
	
	public void validaFormularioAdicionaSetores(final Setor setor){
		validator.checking(new Validations() {{
			
			if(that(!(setor.getNomeDoSetor().isEmpty()),"Campo Nome do Setor","nome.nulo")){
				that(!(setor.getNomeDoSetor().length() <= 2), setor.getNomeDoSetor(),"nome.invalido");
				that(!(setor.getNomeDoSetor().length() > 120), setor.getNomeDoSetor(),"limite.tamanho.excedido");
			}
			
			if(setor.getGestorResponsavel().isEmpty()==false){
				that(!(setor.getGestorResponsavel().length() <= 2), setor.getNomeDoSetor(),"nome.invalido");
				that(!(setor.getGestorResponsavel().length() > 120), setor.getNomeDoSetor(),"limite.tamanho.excedido");
			}

		}});	
		
		validator.onErrorUsePageOf(SetorController.class).adicionaNovoSetor();
	
	}
	
	public void validaFormularioAdicionaUsuario(final Usuario usuario){
		validator.checking(new Validations() {{
			
		that(!(usuario.getNome().isEmpty()),"Campo Nome","nome.nulo");
		if(usuario.getNome().isEmpty()==false){
			that(!(usuario.getNome().length() > 100),"Campo Nome","limite.tamanho.excedido");
			that(!(usuario.getNome().length() < 2),"Campo Nome","nome.invalido");
			that(!(usuario.getLogin().length() <= 2), usuario.getLogin(),"login.invalido");
			that(!(usuario.getLogin().length() >= 50), usuario.getLogin(),"limite.tamanho.excedido");
			that(!(usuario.getSenha().length() > 120), "Campo senha","limite.tamanho.excedido");
			that(!(usuario.getSenha().length() < 5), "Campo senha","senha.invalido");
		}
			
		}});
		
		validator.onErrorUsePageOf(UsuariosController.class).novo();
		
	}
	
}
