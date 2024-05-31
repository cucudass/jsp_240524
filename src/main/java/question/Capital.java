package question;

public class Capital {
	private String str;

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}
	
	public String process() {
		StringBuffer strbuf = new StringBuffer();
		char ch = 'A';
		char c = str.charAt(0);
		for (char i = c; i >= ch ; i--) {
			for (char j = ch; j <= i; j++) {
				strbuf.append(j);
			}
			strbuf.append("<br>");
		}
		return strbuf.toString();
	}
}
