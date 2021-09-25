import java.util.ArrayList;
import static spark.Spark.*;
import static spark.Spark.get;
public class Main {

    public static void main(String[] args) {

        ProcessBuilder processBuilder = new ProcessBuilder();
        if (processBuilder.environment().get("PORT") != null) {
            port(Integer.parseInt(processBuilder.environment().get("PORT")));
        }else{
            port(8080);
        }

        staticFileLocation("/public");
        get("/testconnection", (request, response) -> {
            return "Connected!";
        });

        new Paths().pathControl();
    }

    private static ArrayList<Estudiante> estudiantesList = new ArrayList<>();
    private static Integer studentCounter = 0;

    public static ArrayList<Estudiante> getEstudiantes () {
        return estudiantesList;
    }

    public static void insertEstudiante(String name , String lastName, String mat){
        studentCounter++;
        Estudiante newStudent = new Estudiante(studentCounter, name, lastName, mat);
        estudiantesList.add(newStudent);
    }

}
