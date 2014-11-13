package br.com.mateus.agenda.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.caelum.vraptor.ioc.Component;
import br.com.mateus.agenda.modelo.Setor;

@Component
public class SetorDao {

	private final Session session;
	
	public SetorDao(Session session) {
		this.session = session;
	}
	
	public void salva(Setor setor){
		Transaction tx = session.beginTransaction();
		session.save(setor);
		tx.commit();
	}
	
	@SuppressWarnings("unchecked")
	public List<Setor> listaTudo(){
		return this.session.createCriteria(Setor.class).list();
	}
	
	
}
