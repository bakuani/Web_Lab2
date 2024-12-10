import com.google.gson.Gson;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Point;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.logging.Logger;

@WebServlet("/controllerServlet")
public class ControllerServlet extends HttpServlet {

    Logger logger = Logger.getLogger(ControllerServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Point point = parseRequest(request);
            if (point.getX() != null && point.getX() != null && point.getR() != null) {
                request.setAttribute("fromController", "true");
                request.setAttribute("point", point);

                logger.info(String.valueOf((Point) request.getAttribute("point")));

                Double x = point.getX();
                Double y = point.getY();
                Double r = point.getR();

                try {
                    if (x == 1 && y == 1 && r == 1) {
                        logger.info("Conditions met, removing filter...");
                        AreaCheckFilter.disableFilter();
                        logger.info("Filter is now destroying");
                    }
                } catch (NumberFormatException e) {
                    logger.warning("Invalid number format in parameters: x, y, r");
                }
                request.getRequestDispatcher("/areaCheck").forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/result.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input data");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    private Point parseRequest(HttpServletRequest request)
            throws IOException, NumberFormatException {
        StringBuilder stringBuilder = new StringBuilder();
        String line;

        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                stringBuilder.append(line);
            }
        }

        String jsonBody = stringBuilder.toString();

        Gson gson = new Gson();
        return gson.fromJson(jsonBody, Point.class);
    }
}
