package question;

public class TwoArray {
	private int num;

	public int getNum() { return num; }

	public void setNum(int num) { this.num = num; }
	
	public String process() {
		int[][] arr = new int[num][num];
		StringBuffer strbuf = new StringBuffer();
		
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				arr[i][j] = (int) (Math.random()*10)+1;
				strbuf.append(arr[i][j] + "&nbsp;&nbsp;&nbsp;");
			}
			strbuf.append("<br>");
		}
		return strbuf.toString();
	}
}
