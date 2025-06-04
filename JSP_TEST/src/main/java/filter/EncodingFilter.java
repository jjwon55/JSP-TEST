package filter;

import java.io.IOException;

<<<<<<< HEAD
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
=======

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
>>>>>>> branch 'ys_shin' of https://github.com/jjwon55/JSP-TEST.git
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class EncodingFilter implements Filter {
	
	private String encoding;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
        chain.doFilter(request, response);
    }
	

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	    encoding = filterConfig.getInitParameter("encoding");
	    if (encoding == null) {
	        encoding = "UTF-8";
	    }
	}

}



