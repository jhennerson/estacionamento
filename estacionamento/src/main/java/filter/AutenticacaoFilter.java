package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class AutenticacaoFilter extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;

	public AutenticacaoFilter() {
        super();
    }
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;		
		HttpSession sessao = httpServletRequest.getSession();
		String url = httpServletRequest.getRequestURI();
		
		
		if(sessao.getAttribute("nome") != null || url.lastIndexOf("Login.jsp") > -1 || url.lastIndexOf("autenticador") > -1) {
			chain.doFilter(request, response);
		} else {
			RequestDispatcher redirecionar = request.getRequestDispatcher("Login.jsp");
			request.setAttribute("msg", "Você deve estar logado para acessar esta página!");
			redirecionar.forward(request, response);
		}
	}

}
