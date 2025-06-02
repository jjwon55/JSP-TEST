package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class EncodingFilter implements Filter {
	
	private String encoding;

	@Override
	public void doFilter(ServletRequest requeest, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		filterChain.doFilter(requeest, response);
		// TODO Auto-generated method stub
		
	} 
	
}







