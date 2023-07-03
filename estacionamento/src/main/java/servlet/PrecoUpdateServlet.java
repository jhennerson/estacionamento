package servlet;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import controller.PrecoController;
import model.Preco;

@WebServlet(name = "preco_update", urlPatterns = { "/preco_update" })
public class PrecoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PrecoUpdateServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Preco precoGson = gson.fromJson(reader, Preco.class);
		PrecoController precoController = new PrecoController();
		
		try {
			precoController.update(precoGson);
		} catch(Exception e) {
			e.printStackTrace();
		}
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Dados recebidos pelo servlet com sucesso!");
	}

}
