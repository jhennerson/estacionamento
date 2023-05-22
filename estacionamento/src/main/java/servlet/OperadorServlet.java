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

        //configurar a resposta como JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        //converter a lista de blocos em JSON e enviar a resposta
        Gson gson = new Gson();
        String json = gson.toJson(operadores);
        response.getWriter().write(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//lê o corpo da requisição e converte para objeto JSON
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
        //obter o ID do usuário a ser excluído a partir dos parâmetros da requisição
        String idUsuario = request.getParameter("id");
        
        if (idUsuario != null) {
            try {
                //converte o ID para Integer
                Integer id = Integer.parseInt(idUsuario);
                
                //chama o método de exclusão do usuário com o ID fornecido
                OperadorController operadorController = new OperadorController();
                operadorController.delete(id);
                
                //define o código de resposta como 200 (OK) indicando sucesso
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (NumberFormatException e) {
                //se o ID fornecido não for um número válido, define o código de resposta como 400 (Bad Request)
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } else {
            //se o ID do usuário não for fornecido, define o código de resposta como 400 (Bad Request)
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
	}
}
