package br.com.mateus.agenda.modelo;

import java.io.Serializable;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class UsuarioWeb implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5243437185193279200L;
	
	private Usuario logado;
	
	public void login(Usuario usuario){
		this.logado = usuario;
	}
	
	public String getNome(){
		return logado.getNome();
	}
	
	public boolean isLogado(){
		return logado != null;
	}
	
	public void logout(){
		this.logado = null;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((logado == null) ? 0 : logado.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UsuarioWeb other = (UsuarioWeb) obj;
		if (logado == null) {
			if (other.logado != null)
				return false;
		} else if (!logado.equals(other.logado))
			return false;
		return true;
	}
	
	

}
