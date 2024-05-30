package question;

public class Arithmetic {
	private int num1, num2;
	private String ari;
	
	public String process(int num1, int num2, String ari) {
		String str = "";
		switch (ari) {
		case "+":
			str = (num1 + num2)+"";
			break;
		case "-":
			str = (num1 - num2)+"";		
			break;
		case "*":
			str = (num1 * num2)+"";
			break;
		case "/":
			try {
				str = (num1 / num2)+"";
			} catch (Exception e) {
				str = "0으로 나눌 수 없습니다.";
			}
			break;
		default:
			str = "사칙 연산이 아닙니다.";
			break;
		}
		return str;
	}
	
	public int getNum1() { return num1;	}
	public int getNum2() { return num2;	}
	public String getAri() { return ari; }
	
	public void setNum1(int num1) { this.num1 = num1; }
	public void setNum2(int num2) { this.num2 = num2; }
	public void setAri(String ari) { this.ari = ari; }
	
}
