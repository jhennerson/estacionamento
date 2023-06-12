package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.VagaController;

@WebServlet(name = "vaga_update", urlPatterns = { "/vaga_update" })
public class VagaUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public VagaUpdateServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		//obtém o ID enviado como parâmetro no POST
        Integer idVaga = Integer.parseInt(request.getParameter("id"));
		
		VagaController vagaController = new VagaController();
		
		try {
			vagaController.alterarEstado(idVaga);
		} catch(Exception e) {
			e.printStackTrace();
		}
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Dados recebidos pelo servlet com sucesso!");
	}
}
