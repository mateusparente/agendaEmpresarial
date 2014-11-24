package br.com.mateus.agenda.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;

import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.ioc.Component;
import br.com.mateus.agenda.modelo.Setor;

@Component
public class SetorDao {

	private final Session session;
	private final Result result;
	
	public SetorDao(Session session, Result result) {
		this.session = session;
		this.result = result;
	}
	
	public void salva(Setor setor){
		Transaction tx = session.beginTransaction();
		session.save(setor);
		tx.commit();
	}
	
	@SuppressWarnings("unchecked")
	public List<Setor> listaTudo(){
		return this.session.createCriteria(Setor.class).addOrder(Order.asc("nomeDoSetor")).list();
	}
	
	public void incluiSetores() {
		List<Setor> setores = listaTudo();
		result.include("setores", setores);
	}
	
	
}
