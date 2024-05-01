package edu.fatec.Avaliacao2_LBD.controller;

import edu.fatec.Avaliacao2_LBD.SpringServlet;
import edu.fatec.Avaliacao2_LBD.model.Curso;
import edu.fatec.Avaliacao2_LBD.model.Disciplina;
import edu.fatec.Avaliacao2_LBD.model.Presenca;
import edu.fatec.Avaliacao2_LBD.persistence.CursoDAO;
import edu.fatec.Avaliacao2_LBD.persistence.GenericDAO;
import edu.fatec.Avaliacao2_LBD.persistence.PresencaDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class ConsultarChamadasController {

    @Autowired
    GenericDAO gdao;
    @Autowired
    PresencaDAO presencaDAO;
    @Autowired
    private SpringServlet springServlet;


    List<Curso> cursos= new ArrayList<>();
    List<Disciplina> disciplinas= new ArrayList<>();


    @RequestMapping(name = "consultar_chamada", value = "/consultar_chamada", method = RequestMethod.GET)
    public ModelAndView doGet(ModelMap model) {
        String erro = "";
        String saida = "";

        try {
            cursos = presencaDAO.listCurso();
        } catch (SQLException | ClassNotFoundException e) {
            erro = e.getMessage();
        } finally {
            model.addAttribute("cursos", cursos);
            model.addAttribute("erro", erro);
            model.addAttribute("saida", saida);
        }


        return new ModelAndView("consultar_chamada");
    }


    @RequestMapping(name = "consultar_chamada", value = "/consultar_chamada", method = RequestMethod.POST)
    public ModelAndView doPost(@RequestParam Map<String, String> allRequestParams, ModelMap model) {
        String curso_codigo = allRequestParams.get("curso");
        String disciplina= allRequestParams.get("disciplina");

        String erro = "";
        String saida = "";
        Curso c = new Curso();
        Disciplina d = new Disciplina();
        List<Presenca> presencas = new ArrayList<>();


        try {
            cursos = presencaDAO.listCurso();
            if (curso_codigo != null){
                c.setCodigo(Integer.parseInt(curso_codigo));
                disciplinas = presencaDAO.listDisciplina(c);
                saida = "Disciplinas Carregadas";

            }
            if (disciplina != null){
                d.setCodigo(Integer.parseInt(disciplina));
                presencas = presencaDAO.listPresenca(d);
                saida = "Chamadas Carregadas";
            }

        } catch (SQLException | ClassNotFoundException e) {
            erro = e.getMessage();
        }finally {
            model.addAttribute("cursos", cursos);
            model.addAttribute("disciplinas", disciplinas);
            model.addAttribute("presencas", presencas);
            model.addAttribute("curso", curso_codigo);
            model.addAttribute("erro", erro);
            model.addAttribute("saida", saida);
        }






        return new ModelAndView("consultar_chamada");
    }

}
