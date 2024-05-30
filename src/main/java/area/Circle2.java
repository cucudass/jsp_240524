package area;

public class Circle2 {
	private int r;

	public int getR() { return r; }
	
	public void setR(int r) { this.r = r; }
	
	public double process(int r) {
		return Math.pow(r, 2) * 3.14;
	}
}
