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

import controller.PrecoController;
import model.Preco;

@WebServlet(name = "preco", urlPatterns = { "/preco" })
public class PrecoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PrecoServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrecoController precoController = new PrecoController();
	    List<Preco> precos = precoController.getList();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        String json = gson.toJson(precos);
        response.getWriter().write(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Preco precoGson = gson.fromJson(reader, Preco.class);
		PrecoController precoController = new PrecoController();
		
		try {
			precoController.create(precoGson);
		} catch(Exception e) {
			e.printStackTrace();
		}
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Dados recebidos pelo servlet com sucesso!");
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idPreco = request.getParameter("id");
        
        if (idPreco != null) {
            try {
                Integer id = Integer.parseInt(idPreco);
                PrecoController precoController = new PrecoController();
                
                precoController.delete(id);
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
	}

}
