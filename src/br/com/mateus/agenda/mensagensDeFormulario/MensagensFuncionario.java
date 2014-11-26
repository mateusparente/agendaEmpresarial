package br.com.mateus.agenda.mensagensDeFormulario;

import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class MensagensFuncionario {
	
	private final Result result;

	public MensagensFuncionario(Result result) {
		this.result = result;
	}
	
	public void enviaMensagemAdicionadoComSucesso(){
		result.include("categoriaMensagem","alert alert-success");
		result.include("mensagemDoSistema","Funcionario <strong>inserido</strong> com sucesso !");
	}
	
	public void enviaMensagemEditadoComSucesso(){
		result.include("categoriaMensagem","alert alert-success");
		result.include("mensagemDoSistema","Funcionario <strong>editado</strong> com sucesso !");
	}
	
	public void enviaMensagemRemovidoComSucesso(){
		result.include("categoriaMensagem","alert alert-success");
		result.include("mensagemDoSistema","Funcionario <strong>removido</strong> com sucesso !");
	}
	
	
	

}
