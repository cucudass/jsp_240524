package question;

public class ThreeSixNine {
	private int num;

	public int getNum() { return num; }

	public void setNum(int num) { this.num = num; }
	
	public String process() {
		String result = "";
		int ten = num / 10;
		int one = num % 10;
		
		if(ten % 3 == 0 && (one % 3 == 0 && one > 0))
			result = "박수짝짝";
		else if (ten % 3 == 0 || (one % 3 == 0 && one > 0))
			result = "박수짝";
		else
			result = "박수 없음";
		
		return "입력된 정수가 " + num + "은 "+result;
	}
}
