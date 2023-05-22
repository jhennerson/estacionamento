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

        //configurar a resposta como JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        //converter a lista de blocos em JSON e enviar a resposta
        Gson gson = new Gson();
        String json = gson.toJson(blocos);
        response.getWriter().write(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//lê o corpo da requisição e converte para objeto JSON
		BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Bloco blocoGson = gson.fromJson(reader, Bloco.class);		
		BlocoController blocoController = new BlocoController();
		VagaController vagaController = new VagaController();
		
		//categorias de vagas
		Integer carro = 1;
		Integer moto = 2;
		Integer deficiente = 3;
		
		//cria o bloco e as vagas de acordo com a quantidade solicitada
		try {
			blocoController.create(blocoGson);
			vagaController.create(new Vaga(carro, blocoGson.getDescricao()), blocoGson.getVagasCarros());
			vagaController.create(new Vaga(moto, blocoGson.getDescricao()), blocoGson.getVagasMotos());
			vagaController.create(new Vaga(deficiente, blocoGson.getDescricao()), blocoGson.getVagasDeficientes());
		} catch(Exception e) {
			e.printStackTrace();
		}
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Dados recebidos pelo servlet com sucesso!");
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//obter o ID do bloco a ser excluído a partir dos parâmetros da requisição
        String idBloco = request.getParameter("id");
        
        if (idBloco != null) {
            try {
                //converte o ID para Integer
                Integer id = Integer.parseInt(idBloco);
                
                //chama o método de exclusão do bloco com o ID fornecido
                BlocoController blocoController = new BlocoController();
                blocoController.delete(id);
                
                //define o código de resposta como 200 (OK) indicando sucesso
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (NumberFormatException e) {
                //se o ID fornecido não for um número válido, define o código de resposta como 400 (Bad Request)
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } else {
            //se o ID do bloco não for fornecido, define o código de resposta como 400 (Bad Request)
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
	}

}
