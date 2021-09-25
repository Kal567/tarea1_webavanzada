package edu.pucmm.controlador;

import edu.pucmm.Main;
import edu.pucmm.entidades.Estudiante;
import edu.pucmm.repositorios.EstudianteRepository;
import freemarker.cache.ClassTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

import static spark.Spark.*;

@Controller
public class EstudianteController {

    //@Autowired
    EstudianteRepository EstudianteRepository;

    public EstudianteController(EstudianteRepository EstudianteRepository) {
        this.EstudianteRepository = EstudianteRepository;
    }


    @RequestMapping("/")//index vacio para registrar un estudiante
    public String home(Model modelo){
        return "index";
    }

    @PostMapping("/registrar-estudiante")//crear y editar estudiante
    public String registarEstudiante(Estudiante estudiante) {
        EstudianteRepository.save(estudiante);
        return "redirect:/";
    }

    @PostMapping("/modificar-estudiante")//index con datos del estudiante selecionado para editarlo
    public String editarEstudiante(Estudiante estudiante){
        EstudianteRepository.save(estudiante);
        return "redirect:/listado-estudiantes";
    }

    @GetMapping("/listado-estudiantes")
    public String showListado(Model modelo){
        modelo.addAttribute("estudiante", EstudianteRepository.findAll());
        return "listado-est";
    }

    @PostMapping("/delete-estudiante/{id}")//index con datos del estudiante selecionado para editarlo
    public String editarEstudiante(@PathVariable int id){
        Estudiante estudiante = EstudianteRepository.getOne(id);
        EstudianteRepository.delete(estudiante);
        return "redirect:/listado-estudiantes";
    }

}
/**
        get("/student-registry/", (request, response) -> {//Student list
            Template select = configuration.getTemplate("studentTable.ftl");
            Map<String, Object> attr = new HashMap<>();
            attr.put("student", Main.getEstudiantes());
            StringWriter writer = new StringWriter();
            select.process(attr, writer);
            return writer;
        });

        post("/register/", (request, response) -> {//Insert new student
            Map<String, Object> attr = new HashMap<>();//key value command for the student data
            String name = request.queryParams("firstName");
            String lastName = request.queryParams("lastName");
            String mat = request.queryParams("matricula");
            Main.insertEstudiante(name, lastName, mat);
            response.redirect("/home/");
            return "";
        });


    }
}
        **/