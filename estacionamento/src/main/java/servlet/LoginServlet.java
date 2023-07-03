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

import controller.OperadorController;
import model.Operador;

@WebServlet(name = "login", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
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
					request.getSession().setAttribute("nome", rs.getString("nome"));
					
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
			
		} else {
			RequestDispatcher redirecionar = request.getRequestDispatcher("Login.jsp");
			request.setAttribute("msg", "Preencha todos os campos!");
			redirecionar.forward(request, response);
		}
	}

}
