package question;

public class Alphabet {
	String alphabet = "";

	public String getAlphabet() {
		return alphabet;
	}

	public void setAlphabet(String alphabet) {
		this.alphabet = alphabet;
	}
	
	public String process() {
		char cha = alphabet.charAt(0);
		char start = 'a';
		String result = "";
		
		for (int i = start; i <= cha; i++) {
			result += Character.toString(i);
		}
		
		return result;
	}
	
	public String process2() {
		StringBuffer strBuf = new StringBuffer();
		char c = 'a';
		char c2 = alphabet.charAt(0);
		
		do {
			strBuf.append(c);
			c = (char)(c+1);
		} while(c <= c2);
		
		return strBuf.toString();
	}
}
