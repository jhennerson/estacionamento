package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.OperadorController;
import model.Operador;

@WebServlet(name = "autenticador", urlPatterns = { "/autenticador" })
public class AutenticadorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AutenticadorServlet() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession sessao = request.getSession(false);
    	if(sessao != null) {
    		sessao.invalidate();
    	}
    	
    	response.sendRedirect("Login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String nome = request.getParameter("nome");
		String senha = request.getParameter("senha");
		
		if(nome != null && !nome.isEmpty() && senha != null && !senha.isEmpty()) {
			try {
				Operador operador = new Operador(nome, senha);
				OperadorController operadorController = new OperadorController();
				
				ResultSet rs = operadorController.read(operador);
				if(rs.next()) {
					HttpSession sessao = request.getSession();
					sessao.setAttribute("nome", rs.getString("nome"));
					sessao.setMaxInactiveInterval(60 * 60 * 24);
					
					
					if(rs.getString("nome").equals("admin")) {												
						RequestDispatcher redirecionar = request.getRequestDispatcher("PainelAdmin.jsp");
						redirecionar.forward(request, response);
					} else {
						RequestDispatcher redirecionar = request.getRequestDispatcher("PainelOperador.jsp");
						redirecionar.forward(request, response);
					}
				} else {
					RequestDispatcher redirecionar = request.getRequestDispatcher("Login.jsp");
					request.setAttribute("msg", "Dados inválidos!");
					redirecionar.forward(request, response);
				}				
			} catch(SQLException e) {
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			}
			
		} else if(!nome.equals("admin") && nome != null){
			RequestDispatcher redirecionar = request.getRequestDispatcher("PainelOperador.jsp");
			redirecionar.forward(request, response);			
		} else if(nome.equals("admin")){
			RequestDispatcher redirecionar = request.getRequestDispatcher("PainelAdmin.jsp");
			redirecionar.forward(request, response);		
		} else {
			RequestDispatcher redirecionar = request.getRequestDispatcher("Login.jsp");
			request.setAttribute("msg", "Preencha todos os campos!");
			redirecionar.forward(request, response);
		}
	}
}