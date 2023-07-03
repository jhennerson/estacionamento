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
import model.Sanitize;
import model.Venda;

@WebServlet(name = "venda", urlPatterns = { "/venda" })
public class VendaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Sanitize sanitize = new Sanitize();

    public VendaServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VendaController vendaController = new VendaController();
	    List<Venda> vendas = vendaController.getList();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

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
        String idVenda = request.getParameter("id");
        
        idVenda = sanitize.mysqlScapeString(idVenda);
        
        if (idVenda != null) {
            try {
                Integer id = Integer.parseInt(idVenda);
                VendaController vendaController = new VendaController();
                vendaController.delete(id);

                response.setStatus(HttpServletResponse.SC_OK);
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
	}
}
