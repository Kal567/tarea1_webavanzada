
import freemarker.cache.ClassTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.Version;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import static spark.Spark.*;

public class Paths {
    public void pathControl(){
        final Configuration configuration = new Configuration(Configuration.VERSION_2_3_0);
        //final Configuration config = new Configuration(new Version(2, 3, 0));
        //configuration.setClassForTemplateLoading(Main.class, "src/main/resources/spark/template/freemarker");

        final ClassTemplateLoader loader = new ClassTemplateLoader(Main.class, "/freemarker");
        configuration.setTemplateLoader(loader);
        configuration.setDefaultEncoding("UTF-8");
        configuration.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);

        get("/home", (request, response) -> {//show
            Template index = configuration.getTemplate("index.ftl");
            return index;
        });

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
