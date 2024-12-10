import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Point;

import java.io.IOException;
import java.util.logging.Logger;

@WebFilter("/areaCheck")
public class AreaCheckFilter implements Filter {

    private static final Logger logger = Logger.getLogger(AreaCheckFilter.class.getName());


    private static boolean isEnabled = true;

    public static void disableFilter() {
        isEnabled = false;
    }



    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        logger.info("AreaCheckFilter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        logger.info("LOGGED IN SUCCESSFULLY");

        if (!isEnabled) {
            logger.info("Filter is destroyed");
            chain.doFilter(request, response);
            return;
        }

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        Object controllerAttribute = httpRequest.getAttribute("fromController");

        if (controllerAttribute != null && controllerAttribute.equals("true")) {
            chain.doFilter(request, response);
        } else {
            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
        }
    }

    @Override
    public void destroy() {
        logger.info("Filter gone");
    }
}
