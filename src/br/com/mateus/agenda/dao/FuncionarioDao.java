package br.com.mateus.agenda.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;
import br.com.mateus.agenda.modelo.Funcionario;

@Component
public class FuncionarioDao {

	private final Session session;

	
	public FuncionarioDao(Session session) {
		this.session = session;
	}
	
	public void salva(Funcionario funcionario) {
		Transaction tx = session.beginTransaction();
		session.save(funcionario);
		tx.commit();
	}
	
	@SuppressWarnings("unchecked")
	public List<Funcionario> listaTudo(){
		return this.session.createCriteria(Funcionario.class).list();
	}
	
	public Funcionario carrega(Integer id){
		return (Funcionario) this.session.load(Funcionario.class, id);
	}
	
	public void atualiza(Funcionario funcionario){
		Transaction tx = session.beginTransaction();
		this.session.update(funcionario);
		tx.commit();
	}
	
	public void remove(Funcionario funcionario){
		Transaction tx = session.beginTransaction();
		this.session.delete(funcionario);
		tx.commit();
	}
	
	@SuppressWarnings("unchecked")
	public List<Funcionario> busca(String nome, String setor){
		Criteria crit = this.session.createCriteria(Funcionario.class);
		
		if(nome.equals("")){
			return crit.add(Restrictions.ilike("setor", setor, MatchMode.ANYWHERE)).list();
		}else{
			return crit.add(Restrictions.ilike("nome", nome, MatchMode.ANYWHERE)).list();
		}
	}
	

}
