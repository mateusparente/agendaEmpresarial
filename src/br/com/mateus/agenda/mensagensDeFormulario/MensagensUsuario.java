package br.com.mateus.agenda.mensagensDeFormulario;

import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class MensagensUsuario {
	
	private final Result result;

	public MensagensUsuario(Result result) {
		this.result = result;
	}
	
	public void enviaMensagemAdicionadoComSucesso(){
		result.include("categoriaMensagem","alert alert-success");
		result.include("mensagemDoSistema","Usuário <strong>inserido</strong> com sucesso !");
	}
	
	public void enviaMensagemEditadoComSucesso(){
		result.include("categoriaMensagem","alert alert-success");
		result.include("mensagemDoSistema","Usuário <strong>editado</strong> com sucesso !");
	}
	
	public void enviaMensagemRemovidoComSucesso(){
		result.include("categoriaMensagem","alert alert-success");
		result.include("mensagemDoSistema","Usuário <strong>removido</strong> com sucesso !");
	}
	
	

}
