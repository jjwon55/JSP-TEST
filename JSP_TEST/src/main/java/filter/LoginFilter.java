package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import shop.dao.UserRepository;
import shop.dto.PersistentLogin;
import shop.dto.User;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/*")
public class LoginFilter extends HttpFilter implements Filter {
	
	private static final long serialVersionUID = 1L;

	@Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
        throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        HttpSession session = request.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        if (!isLoggedIn) {
            Cookie[] cookies = request.getCookies();
            String token = (cookies != null) ? getTokenFromCookies(cookies) : null;

            if (token != null) {
                UserRepository repo = new UserRepository();
                PersistentLogin pl = repo.selectTokenByToken(token);
                if (pl != null && pl.getUserId() != null) {
                    User user = repo.getUserById(pl.getUserId());
                    if (user != null) {
                        request.getSession(true).setAttribute("user", user);
                    }
                }
            }
        }

        chain.doFilter(req, res);
    }

    private String getTokenFromCookies(Cookie[] cookies) {
        for (Cookie cookie : cookies) {
            if ("login_token".equals(cookie.getName())) {
                return cookie.getValue();
            }
        }
        return null;
    }
	
}
