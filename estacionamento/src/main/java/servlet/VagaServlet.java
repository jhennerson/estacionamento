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

import controller.VagaController;
import model.Vaga;

@WebServlet(name = "vaga", urlPatterns = { "/vaga" })
public class VagaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public VagaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VagaController vagaController = new VagaController();
	    List<Vaga> vagas = vagaController.getList();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        String json = gson.toJson(vagas);
        
        response.getWriter().write(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Vaga vagaGson = gson.fromJson(reader, Vaga.class);
		VagaController vagaController = new VagaController();
		
		try {
			vagaController.create(vagaGson);
		} catch(Exception e) {
			e.printStackTrace();
		}
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Dados recebidos pelo servlet com sucesso!");
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idVaga = request.getParameter("id");
        
        if (idVaga != null) {
            try {
                Integer id = Integer.parseInt(idVaga);
                VagaController vagaController = new VagaController();
                vagaController.delete(id);

                response.setStatus(HttpServletResponse.SC_OK);
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
	}

}
