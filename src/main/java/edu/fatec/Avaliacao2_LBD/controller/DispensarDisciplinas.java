package edu.fatec.Avaliacao2_LBD.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.fatec.Avaliacao2_LBD.persistence.FuncionalidadesSecretariaDAO;
import edu.fatec.Avaliacao2_LBD.persistence.GenericDAO;

@Controller
public class DispensarDisciplinas 
{
	@Autowired
	GenericDAO gdao;
	@Autowired
	FuncionalidadesSecretariaDAO fdao;
	
	@RequestMapping(name = "dispensar_disciplinas", value = "/dispensar_disciplinas", method = RequestMethod.GET)
    public ModelAndView doGet(@RequestParam Map<String, String> allRequestParam, ModelMap model)
    {
		String ra = allRequestParam.get("ra") == null ? "" : allRequestParam.get("ra");
		String erro = "";
        String saida = "";

        try
        {
        	//
        }
        catch (SQLException | ClassNotFoundException e)
        {
            erro = e.getMessage();
        }
        finally
        {
            model.addAttribute("saida", saida);
            model.addAttribute("erro", erro);
        }
        
        return new ModelAndView("secretaria_dispensar_disciplina");
    }

    @RequestMapping(name = "dispensar_disciplinas", value = "/dispensar_disciplinas", method = RequestMethod.POST)
    public ModelAndView doPost(@RequestParam Map<String, String> allRequestParam, ModelMap model)
    {
        return new ModelAndView("secretaria_dispensar_disciplina");
    }
}
