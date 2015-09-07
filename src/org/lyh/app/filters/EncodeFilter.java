package org.lyh.app.filters;


import java.io.IOException;
import java.util.logging.LogRecord;
import javax.servlet.*;

/**
 * Created by lvyahui on 2015-06-28.
 */
public class EncodeFilter implements Filter{
    private String charSet;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.charSet = filterConfig.getInitParameter("charset");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletResponse.setCharacterEncoding(charSet);
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
