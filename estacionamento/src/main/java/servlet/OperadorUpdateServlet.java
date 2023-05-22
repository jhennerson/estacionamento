package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import controller.OperadorController;
import model.Operador;

@WebServlet(name = "operadorupdate", urlPatterns = { "/operadorupdate" })
public class OperadorUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OperadorUpdateServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//lê o corpo da requisição e converte para objeto JSON
		BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Operador operadorGson = gson.fromJson(reader, Operador.class);		
		OperadorController operadorController = new OperadorController();
		
		try {
			operadorController.update(operadorGson);
		} catch(Exception e) {
			e.printStackTrace();
		}
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Dados recebidos pelo servlet com sucesso!");
	}
}
