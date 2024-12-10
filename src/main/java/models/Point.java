package models;

import java.util.Objects;

public class Point {
    private Double x;
    private Double y;
    private Double r;
    private Boolean hit;

    public Double getX() {
        return x;
    }

    public Double getY() {
        return y;
    }

    public Double getR() {
        return r;
    }

    public Boolean isHit() {
        return hit;
    }

    public void setX(Double x) {
        this.x = x;
    }

    public void setY(Double y) {
        this.y = y;
    }

    public void setR(Double r) {
        this.r = r;
    }

    public void setHit(Boolean hit) {
        this.hit = hit;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Point point = (Point) o;
        return Double.compare(x, point.x) == 0 && Double.compare(y, point.y) == 0 && Double.compare(r, point.r) == 0 && hit == point.hit;
    }

    @Override
    public int hashCode() {
        return Objects.hash(x, y, r, hit);
    }

    @Override
    public String toString() {
        return "models.Point{" +
                "x=" + x +
                ", y=" + y +
                ", r=" + r +
                ", hit=" + hit +
                '}';
    }
}
