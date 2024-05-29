package area;

public class Circle {
	private int r;

	public int getR() { return r; }
	
	public void setR(int r) { this.r = r; }
	
	public double process() {
		return Math.pow(r, 2) * 3.14;
	}
}
