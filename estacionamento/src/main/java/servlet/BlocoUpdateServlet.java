package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import controller.BlocoController;
import model.Bloco;

@WebServlet(name = "bloco_update", urlPatterns = { "/bloco_update" })
public class BlocoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BlocoUpdateServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Bloco blocoGson = gson.fromJson(reader, Bloco.class);		
		BlocoController blocoController = new BlocoController();
		
		try {
			blocoController.update(blocoGson);
		} catch(Exception e) {
			e.printStackTrace();
		}
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Dados recebidos pelo servlet com sucesso!");
	}

}