package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import controller.OperadorController;
import model.Operador;
import model.Usuario;

@WebServlet(name = "operador", urlPatterns = { "/operador" })
public class OperadorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OperadorServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OperadorController operadorController = new OperadorController();
	    List<Usuario> operadores = operadorController.getList();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        String json = gson.toJson(operadores);
        response.getWriter().write(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Operador operadorGson = gson.fromJson(reader, Operador.class);		
		OperadorController operadorController = new OperadorController();
		
		try {
			operadorController.create(operadorGson);
		} catch(Exception e) {
			e.printStackTrace();
		}
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Dados recebidos pelo servlet com sucesso!");
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idOperador = request.getParameter("id");
        
        if (idOperador != null) {
            try {
                Integer id = Integer.parseInt(idOperador);
                OperadorController operadorController = new OperadorController();
                
                operadorController.delete(id);
                
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
	}
}
