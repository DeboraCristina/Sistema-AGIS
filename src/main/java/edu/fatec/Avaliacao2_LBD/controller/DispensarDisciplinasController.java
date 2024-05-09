package edu.fatec.Avaliacao2_LBD.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.fatec.Avaliacao2_LBD.model.Matricula;
import edu.fatec.Avaliacao2_LBD.model.MatriculaDisciplina;
import edu.fatec.Avaliacao2_LBD.persistence.FuncionalidadesSecretariaDAO;
import edu.fatec.Avaliacao2_LBD.persistence.GenericDAO;

@Controller
public class DispensarDisciplinasController 
{
	@Autowired
	GenericDAO gdao;
	@Autowired
	FuncionalidadesSecretariaDAO fdao;
	
	@RequestMapping(name = "dispensar_disciplinas", value = "/dispensar_disciplinas", method = RequestMethod.GET)
    public ModelAndView doGet(@RequestParam Map<String, String> allRequestParam, ModelMap model)
    {
		String acao = allRequestParam.get("acao") == null ? "" : allRequestParam.get("acao");
    	String codDis = allRequestParam.get("dis") == null ? "" : allRequestParam.get("dis");
    	String ra = allRequestParam.get("ra") == null ? "" : allRequestParam.get("ra");
    	
    	String saida = "";
		String erro = "";
		
		Matricula matricula = new Matricula();
		List<MatriculaDisciplina> matDisciplinas = new ArrayList<MatriculaDisciplina>();
		
		try 
		{	
			if (acao.equalsIgnoreCase("dispensar") && !codDis.equalsIgnoreCase("") && !ra.equalsIgnoreCase(""))
			{
				saida = dispensarDisciplina(ra, Integer.parseInt(codDis));
			}
			
			if (!ra.equalsIgnoreCase(""))
			{
				matricula = buscarAluno(ra);
				matDisciplinas = buscarDisciplinas(ra);
			}
		} 
		catch (SQLException | ClassNotFoundException e) 
		{
			erro = e.getMessage();
		}
		finally 
		{
            model.addAttribute("matricula", matricula);
            model.addAttribute("matDisciplinas", matDisciplinas);
            model.addAttribute("saida", saida);
            model.addAttribute("erro", erro);
		}
        
        return new ModelAndView("secretaria_dispensar_disciplina");
    }

	@RequestMapping(name = "dispensar_disciplinas", value = "/dispensar_disciplinas", method = RequestMethod.POST)
    public ModelAndView doPost(@RequestParam Map<String, String> allRequestParam, ModelMap model)
    {
    	String cmd = allRequestParam.get("botao") == null ? "" : allRequestParam.get("botao");
    	String ra = allRequestParam.get("ra") == null ? "" : allRequestParam.get("ra");
    	
    	String saida = "";
		String erro = "";
		
		Matricula matricula = new Matricula();
		List<MatriculaDisciplina> matDisciplinas = new ArrayList<MatriculaDisciplina>();
		
		try 
		{
			if (cmd.equalsIgnoreCase("Buscar"))
			{
				matricula = buscarAluno(ra);
				matDisciplinas = buscarDisciplinas(ra);
			}
		} 
		catch (SQLException | ClassNotFoundException e) 
		{
			erro = e.getMessage();
		}
		finally 
		{
            model.addAttribute("matricula", matricula);
            model.addAttribute("matDisciplinas", matDisciplinas);
            model.addAttribute("saida", saida);
            model.addAttribute("erro", erro);
		}
		
        return new ModelAndView("secretaria_dispensar_disciplina");
    }

    private String dispensarDisciplina(String ra, int codDis) throws SQLException, ClassNotFoundException {
		return fdao.dispensarDisciplina(ra, codDis);
	}
    
	private List<MatriculaDisciplina> buscarDisciplinas(String ra) throws SQLException, ClassNotFoundException {
		return fdao.buscarDisciplinasParaDispensa(ra);
	}

	private Matricula buscarAluno(String ra) throws SQLException, ClassNotFoundException
    {
    	return fdao.buscarAluno(ra);
    }
}
