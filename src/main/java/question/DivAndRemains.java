package question;

public class DivAndRemains {
	private int num;

	public int getNum() { return num; }

	public void setNum(int num) { this.num = num; }
	
	public String process(int num) {
		String str = "";
		int a = num / 10;
		int b = num % 10;
		
		if(a == b)
			str = "10의 자리와 1의 자리가 같습니다.";
		else
			str = "10의 자리와 1의 자리가 다릅니다.";
		
		return str;
	}
}
