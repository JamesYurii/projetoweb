package web.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dao.AlunoDao;
import web.modelo.Aluno;
// gerencia a interaçao entre modelo e a  interface do usuario
@Transactional
@Controller
@RequestMapping("/aluno")
public class AlunoController {

	private List<Aluno> lista_alunos;

	@Autowired
	AlunoDao dao;

	@RequestMapping("/novo")
	public String aluno() {
		return "aluno/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Aluno aluno, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println(result);
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(aluno);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_alunos = dao.lista();
		model.addAttribute("alunos", this.lista_alunos);
		return "aluno/lista";
	}

	@RequestMapping("/remove")
	public String remove(Aluno aluno) {
		dao.remove(aluno.getId());
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("aluno", dao.buscaPorId(id));
		return "aluno/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model) {
		model.addAttribute("aluno", dao.buscaPorId(id));
		return "aluno/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Aluno aluno, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println(result);
			return "redirect:edita?id=" + aluno.getId();
		}

		dao.altera(aluno);
		return "redirect:lista";
	}

}
