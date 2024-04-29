package edu.fatec.Avaliacao2_LBD.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
public class ConsultarChamadasController {

    @RequestMapping(name = "consultar_chamada", value = "/consultar_chamada", method = RequestMethod.GET)
    public ModelAndView doGet(ModelMap model) {

        return new ModelAndView("consultar_chamada");
    }


    @RequestMapping(name = "consultar_chamada", value = "/consultar_chamada", method = RequestMethod.POST)
    public ModelAndView doPost(@RequestParam Map<String, String> allRequestParams, ModelMap model) {

        return new ModelAndView("consultar_chamada");
    }

}
