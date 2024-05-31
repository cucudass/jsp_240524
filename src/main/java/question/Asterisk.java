package question;

public class Asterisk {
	private int num;

	public int getNum() { return num; }

	public void setNum(int num) { this.num = num; }
	
	public String process(int i) {
		String str = "";
		for (int j = 0; j < i; j++) {
			str += "*";
		}
		return str;
	}
	
	public String process2() {
		StringBuffer strbuf = new StringBuffer();
		for (int i = num; i > 0; i--) {
			for(int j = 0; j < i; j++) {
				strbuf.append('*');
			}
			strbuf.append("<br>");
		}
		return strbuf.toString();
	}
}