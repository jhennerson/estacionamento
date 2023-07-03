package servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.VendaController;
import model.Venda;

@WebServlet(name = "calculadora", urlPatterns = { "/calculadora" })
public class CalculadoraServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CalculadoraServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VendaController vendaController = new VendaController();		
		DecimalFormat formato = new DecimalFormat("#.##");
	    List<Venda> vendas = vendaController.getList();
	    Double total = 0.0;	    
	    
	    total = calcularTotal(vendas);
	    
        response.getWriter().write(formato.format(total));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String timestamp = request.getParameter("timestamp");
		Double precoHora = Double.parseDouble(request.getParameter("valorHora"));
		DecimalFormat formato = new DecimalFormat("#.##");
		Double resultado = calcularPreço(timestamp, precoHora);		
		
		response.getWriter().write(formato.format(resultado));
	}

	private Double calcularPreço(String timestamp, Double precoHora) {
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		df.setTimeZone(TimeZone.getTimeZone("America/Sao_Paulo"));
        Date horaAtual = new Date();
        Date horaUtilizada;
        
        try {
        	horaUtilizada = df.parse(timestamp);
			
			Double resultado = ((horaAtual.getTime() - horaUtilizada.getTime()) / (1000.0 * 60.0 * 60.0)) * precoHora;
			
			return resultado;
		} catch (ParseException e) {
			return null;
		}
	}
	
	private Double calcularTotal(List<Venda> vendas) {		
		Double total = 0.0;
	    
	    for (Venda venda : vendas) {
	        total += venda.getValor();
	    }
		
		return total;
	}
}