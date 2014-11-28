package agenda;

import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.util.test.MockResult;
import br.com.caelum.vraptor.validator.Message;
import br.com.caelum.vraptor.validator.ValidationException;
import br.com.mateus.agenda.controller.FuncionariosController;
import br.com.mateus.agenda.dao.FuncionarioDao;
import br.com.mateus.agenda.dao.SetorDao;
import br.com.mateus.agenda.mensagensDeFormulario.MensagensFuncionario;
import br.com.mateus.agenda.modelo.Funcionario;
import br.com.mateus.agenda.validacoes.RegrasValidacaoFormulario;


public class testValidacaoFormularioFuncionario {


	private final Validator validator;
	private final SetorDao dao;
	private final RegrasValidacaoFormulario regrasValidacao;
	private final MensagensFuncionario mensagensDeValidacao;
	private FuncionarioDao funcionarioDao;
	
	public testValidacaoFormularioFuncionario(Validator validator, SetorDao dao, RegrasValidacaoFormulario regrasValidacaoFormulario, 
			MensagensFuncionario mensagensDeValidacao,FuncionarioDao funcionarioDao) {
		this.validator = validator;
		this.dao = dao;
		this.regrasValidacao = regrasValidacaoFormulario;
		this.mensagensDeValidacao = mensagensDeValidacao;
		this.funcionarioDao = funcionarioDao;
	}



	@Test
	public void testSeDadosVazios() {
		MockResult result = new MockResult();
		FuncionariosController funcionario = new FuncionariosController(funcionarioDao,result,dao,regrasValidacao,mensagensDeValidacao);
		try {
	        funcionario.adiciona(new Funcionario());
	        Assert.fail();
	    } catch (ValidationException e) {
	        List<Message> errors = e.getErrors();
	        //asserts nos erros
	    }
		
	}

}
