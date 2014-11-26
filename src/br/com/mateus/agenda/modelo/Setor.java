package br.com.mateus.agenda.modelo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Setor implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6158880505254783378L;

	@Id @GeneratedValue
	private Integer id;
	
	private String nomeDoSetor;
	private String gestorResponsavel;
	
	public Integer getId() {
		return id;
	}
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
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime
				* result
				+ ((gestorResponsavel == null) ? 0 : gestorResponsavel
						.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((nomeDoSetor == null) ? 0 : nomeDoSetor.hashCode());
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
		Setor other = (Setor) obj;
		if (gestorResponsavel == null) {
			if (other.gestorResponsavel != null)
				return false;
		} else if (!gestorResponsavel.equals(other.gestorResponsavel))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (nomeDoSetor == null) {
			if (other.nomeDoSetor != null)
				return false;
		} else if (!nomeDoSetor.equals(other.nomeDoSetor))
			return false;
		return true;
	}
	
	
	

}
