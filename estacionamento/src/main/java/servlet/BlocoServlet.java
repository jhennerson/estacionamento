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

import controller.BlocoController;
import controller.VagaController;
import model.Bloco;
import model.Categoria;
import model.Vaga;

@WebServlet(name = "bloco", urlPatterns = { "/bloco" })
public class BlocoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BlocoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BlocoController blocoController = new BlocoController();
	    List<Bloco> blocos = blocoController.getList();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        String json = gson.toJson(blocos);
        response.getWriter().write(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Bloco blocoGson = gson.fromJson(reader, Bloco.class);		
		BlocoController blocoController = new BlocoController();
		VagaController vagaController = new VagaController();

		try {
			blocoController.create(blocoGson);
			vagaController.create(new Vaga(Categoria.CARRO, blocoGson.getDescricao()), blocoGson.getVagasCarros());
			vagaController.create(new Vaga(Categoria.MOTO, blocoGson.getDescricao()), blocoGson.getVagasMotos());
			vagaController.create(new Vaga(Categoria.DEFICIENTE, blocoGson.getDescricao()), blocoGson.getVagasDeficientes());
		} catch(Exception e) {
			e.printStackTrace();
		}
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Dados recebidos pelo servlet com sucesso!");
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idBloco = request.getParameter("id");
        
        if (idBloco != null) {
            try {
                Integer id = Integer.parseInt(idBloco);
                BlocoController blocoController = new BlocoController();
                VagaController vagaController = new VagaController();
                
                vagaController.deleteAll(blocoController.find(id).getDescricao());
                blocoController.delete(id);
                
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
	}

}
