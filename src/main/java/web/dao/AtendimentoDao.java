package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.modelo.Atendimento;

@Repository
public class AtendimentoDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Atendimento atendimento) {
		manager.persist(atendimento);
	}

	public void altera(Atendimento atendimento) {
		manager.merge(atendimento);
	}

	public List<Atendimento> lista() {
		return manager.createQuery("select c from Atendimento c order by c.id desc", Atendimento.class).getResultList();
	}

	public List<Atendimento> buscaPorNome(String nome) {
		return manager.createQuery("select c from Atendimento c where c.nome = :nome", Atendimento.class).setParameter("nome", nome)
				.getResultList();
	}

	public Atendimento buscaPorId(Long id) {
		return manager.find(Atendimento.class, id);
	}

	public void remove(Long id) {
		manager.createQuery("delete from Atendimento c where c.id = :id").setParameter("id", id).executeUpdate();
	}

}
