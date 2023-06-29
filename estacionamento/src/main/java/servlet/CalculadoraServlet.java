package servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "calculadora", urlPatterns = { "/calculadora" })
public class CalculadoraServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CalculadoraServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String timestamp = request.getParameter("timestamp");
		Double precoHora = Double.parseDouble(request.getParameter("valorHora"));
		
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
        Date horaAtual = new Date();
        Date horaUtilizada;
        
        try {
        	horaUtilizada = df.parse(timestamp);
			
			Double resultado = ((horaAtual.getTime() - horaUtilizada.getTime()) / (1000.0 * 60.0 * 60.0)) * precoHora;
			
			response.getWriter().write(String.format("%,.2f", resultado));
		} catch (ParseException e) {
			response.getWriter().write("Erro na conversão do timestamp.");
		}
        
	}

}
