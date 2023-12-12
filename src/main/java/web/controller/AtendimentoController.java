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

import web.dao.AtendimentoDao;
import web.modelo.Atendimento;

@Transactional
@Controller
@RequestMapping("/atendimento")
public class AtendimentoController {

	private List<Atendimento> lista_atendimentos;

	@Autowired
	AtendimentoDao dao;

	@RequestMapping("/novo")
	public String atendimento() {
		return "atendimento/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Atendimento atendimento, BindingResult result) {
		if (result.hasErrors()) {
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(atendimento);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_atendimentos = dao.lista();
		model.addAttribute("atendimentos", this.lista_atendimentos);
		return "atendimento/lista";
	}

	@RequestMapping("/remove")
	public String remove(Atendimento atendimento) {
		dao.remove(atendimento.getId());
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("atendimento", dao.buscaPorId(id));
		return "atendimento/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model) {
		model.addAttribute("atendimento", dao.buscaPorId(id));
		return "atendimento/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Atendimento atendimento, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println(result);
			return "redirect:edita?id=" + atendimento.getId();
		}

		dao.altera(atendimento);
		return "redirect:lista";
	}

}
