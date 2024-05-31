package question;

public class Array3 {
	private int num;

	public int getNum() { return num; }

	public void setNum(int num) { this.num = num; }
	
	public String process() {
		StringBuffer strbuf = new StringBuffer();
		int[] arr = new int[num];
		for (int i = 1; i <= num; i++) {
			arr[i-1] = (int) ((Math.random()*100) + 1);
			strbuf.append(arr[i-1]+" ");
			if(i % 10 == 0)
				strbuf.append("<br>");
		}
		return strbuf.toString();
	}
}
