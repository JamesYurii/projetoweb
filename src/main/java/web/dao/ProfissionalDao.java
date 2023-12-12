package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.modelo.Profissional;

@Repository
public class ProfissionalDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Profissional profissional) {
		manager.persist(profissional);
	}

	public void altera(Profissional profissional) {
		manager.merge(profissional);
	}

	public List<Profissional> lista() {
		return manager.createQuery("select c from Profissional c order by c.id desc", Profissional.class).getResultList();
	}

	public List<Profissional> buscaPorNome(String nome) {
		return manager.createQuery("select c from Profissional c where c.nome = :nome", Profissional.class).setParameter("nome", nome)
				.getResultList();
	}

	public Profissional buscaPorId(Long id) {
		return manager.find(Profissional.class, id);
	}

	public void remove(Long id) {
		manager.createQuery("delete from Profissional c where c.id = :id").setParameter("id", id).executeUpdate();
	}

}
