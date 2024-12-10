public class PointChecker {
    public static boolean isPointInArea(double x, double y, double R) {
        if (x >= 0 && y >= 0 && (x * x + y * y <= R * R)) {
            return true;
        }

        if (x <= 0 && y <= 0 && (y >= -x - R)) {
            return true;
        }

        if (x >= -R  && y >= 0 && y <= R/2 && x <= 0) {
            return true;
        }

        return false;
    }

}


