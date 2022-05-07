package q5;

public class ExprValue implements Expression {
	
	private int value;
	
	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}
	
	public String toString() {
		return this.value + "";
	}

	@Override
	public void solve() {
		System.out.println(this.value);
	}

	@Override
	public String show() {
		return this.toString();
	}
}
