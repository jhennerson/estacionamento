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

import controller.VendaController;
import controller.VendaController;
import model.Venda;

@WebServlet(name = "venda", urlPatterns = { "/venda" })
public class VendaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public VendaServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VendaController vendaController = new VendaController();
	    List<Venda> vendas = vendaController.getList();

        //configurar a resposta como JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        //converter a lista de blocos em JSON e enviar a resposta
        Gson gson = new Gson();
        String json = gson.toJson(vendas);
        response.getWriter().write(json);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Venda vendaGson = gson.fromJson(reader, Venda.class);
		VendaController vendaController = new VendaController();
		
		try {
			vendaController.create(vendaGson);
		} catch(Exception e) {
			e.printStackTrace();
		}
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Dados recebidos pelo servlet com sucesso!");
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//obter o ID da venda a ser excluída a partir dos parâmetros da requisição
        String idVenda = request.getParameter("id");
        
        if (idVenda != null) {
            try {
                //converte o ID para Integer
                Integer id = Integer.parseInt(idVenda);
                
                //chama o método de exclusão da venda com o ID fornecido
                VendaController vendaController = new VendaController();
                vendaController.delete(id);
                
                //define o código de resposta como 200 (OK) indicando sucesso
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (NumberFormatException e) {
                //se o ID fornecido não for um número válido, define o código de resposta como 400 (Bad Request)
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } else {
            //se o ID da venda não for fornecido, define o código de resposta como 400 (Bad Request)
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
	}
}
