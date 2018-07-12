/*2018-06-26 이광재*/
package service;

public class Member {
	private int MemberNo = 0;	//Domain class내의 필드는 무조건 접근제한자는 private로 작성하는 것이 원칙이다.
	private String memberName = null;
	private int memberAge = 0;
	private String searchWord = null;
	private int rowNumber = 0;
	
	 
	public int getMemberNo() {	//전역변수 값을 리턴
		return MemberNo;
	}
	public void setMemberNo(int memberNo) { //매개변수에 입력된 값을 전역변수에 저장함.
		this.MemberNo = memberNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getMemberAge() {
		return memberAge;
	}
	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;
	}
	
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public int getRowNumber() {
		return rowNumber;
	}
	public void setRowNumber(int rowNumber) {
		this.rowNumber = rowNumber;
	}
	
	
}
