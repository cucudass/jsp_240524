package question;

public class Money {
	private int money;

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}
	
	public String process() {
		StringBuffer strbuf = new StringBuffer();
		int[] arr = {50000,10000,1000,500,100,50,10,1};
		int res = 0;
		for (int i = 0; i < arr.length; i++) {
			res = money / arr[i];
			if(res > 0)
				strbuf.append(arr[i]+"원 짜리 : " + res +"개<br>");
			money %= arr[i];
		}
		return strbuf.toString();
	}
}
