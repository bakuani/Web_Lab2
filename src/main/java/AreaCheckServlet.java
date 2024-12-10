import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import models.Point;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/areaCheck")
public class AreaCheckServlet extends HttpServlet {

    Logger logger = Logger.getLogger(AreaCheckServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Point point = (Point) request.getAttribute("point");

        if (point == null){
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        double x = point.getX();
        double y = point.getY();
        double radius = point.getR();

        point.setHit(PointChecker.isPointInArea(x, y, radius));

        ServletContext context = request.getServletContext();
        List<Point> results = (List<Point>) context.getAttribute("results");
        if (results == null) {
            results = new ArrayList<>();
        }
        results.add(point);

        context.setAttribute("results", results);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(point));
    }

}

