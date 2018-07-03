/*2018-06-26 이광재*/
package service;

public class MemberAddr {	//Domain class내의 필드는 무조건 접근제한자는 private로 작성하는 것이 원칙이다.
	private int memberAddrNo = 0;
	private int memberNo = 0;
	private String memberAddrContent = null;
	
	public int getMemberAddrNo() {
		return memberAddrNo;
	}
	public void setMemberAddrNo(int memberAddrNo) {
		this.memberAddrNo = memberAddrNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberAddrContent() {
		return memberAddrContent;
	}
	public void setMemberAddrContent(String memberAddrContent) {
		this.memberAddrContent = memberAddrContent;
	}
	 

	
}
