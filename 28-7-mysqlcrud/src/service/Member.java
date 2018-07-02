/*2018-06-26 이광재*/
package service;

public class Member {
	private int MemberNo = 0;	//Domain class내의 필드는 무조건 접근제한자는 private로 작성하는 것이 원칙이다.
	private String member_name = null;
	private int member_age = 0;
	private int rowNumber = 0;
	
	
	public int getMemberNo() {	//전역변수 값을 리턴
		return MemberNo;
	}
	public void setMemberNo(int memberNo) { //매개변수에 입력된 값을 전역변수에 저장함.
		this.MemberNo = memberNo;
	}
	public String getMember_name() {	
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getMember_age() {
		return member_age;
	}
	public void setMember_age(int member_age) {
		this.member_age = member_age;
	}
	public int getRowNumber() {
		return rowNumber;
	}
	public void setRowNumber(int rowNumber) {
		this.rowNumber = rowNumber;
	}
	
	
}
