package br.com.mateus.agenda.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Setor {
	
	@Id @GeneratedValue
	private Integer id;
	
	private String nomeDoSetor;
	private String gestorResponsavel;
	
	public String getNomeDoSetor() {
		return nomeDoSetor;
	}
	public void setNomeDoSetor(String nomeDoSetor) {
		this.nomeDoSetor = nomeDoSetor;
	}
	public String getGestorResponsavel() {
		return gestorResponsavel;
	}
	public void setGestorResponsavel(String gestorResponsavel) {
		this.gestorResponsavel = gestorResponsavel;
	}
	

}
