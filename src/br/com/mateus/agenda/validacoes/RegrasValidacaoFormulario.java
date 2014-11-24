package br.com.mateus.agenda.validacoes;

import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.validator.Validations;
import br.com.mateus.agenda.dao.SetorDao;
import br.com.mateus.agenda.modelo.Funcionario;

@Component
public final class RegrasValidacaoFormulario {

	private final Validator validator;
	private final SetorDao setorDao;
	
	public RegrasValidacaoFormulario(Validator validator, SetorDao setorDao) {
		this.validator = validator;
		this.setorDao = setorDao;
	}
	
	String formatoRamal = "[0-9]{1,11}";
		

	public void validaFormularioAdicionaFuncionario(final Funcionario funcionario) {
		validator.checking(new Validations() {{
			if(that(!(funcionario.getNome().isEmpty()),"Erro","nome.nulo")){
				that(!(funcionario.getNome().length() <= 2), funcionario.getNome(),"nome.invalido");
				
				that(!(funcionario.getRamal().length() > 4),funcionario.getRamal(),"limite.ramal.excedido");
				that(!(funcionario.getRamal().matches(formatoRamal)==false),funcionario.getRamal(),"telefone.invalido");
				that(!(funcionario.getRamal().length() < 4),funcionario.getRamal(),"tamanho.ramal.inferior");
				
				that(!(funcionario.getTelefone().length() > 11),"Campo telefone","limite.tamanho.excedido");
				that(!(funcionario.getCelular().length() > 11), "Campo Celular","limite.tamanho.excedido");
				that(!(funcionario.getCelularOutro().length() > 11), "Campo Celular adicional","limite.tamanho.excedido");
				that(!(funcionario.getEmail().length() > 120), "Campo Email","limite.tamanho.excedido");
				that(!(funcionario.getFuncao().length() > 100), "Campo Função","limite.tamanho.excedido");
				that(!(funcionario.getObservacoes().length() > 254), "Campo Observações","limite.tamanho.excedido");
			}		
			
			setorDao.incluiSetores();
				
			}});
	}
	
}
