/*2018-06-26 �̱���*/
package service;

public class MemberAddr {	//Domain class���� �ʵ�� ������ ���������ڴ� private�� �ۼ��ϴ� ���� ��Ģ�̴�.
	private int member_addr_no = 0;
	private int member_no = 0;
	private String member_addr_content = null;
	
	public int getMember_addr_no() {
		return member_addr_no;
	}
	public void setMember_addr_no(int member_addr_no) {
		this.member_addr_no = member_addr_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMember_addr_content() {
		return member_addr_content;
	}
	public void setMember_addr_content(String member_addr_content) {
		this.member_addr_content = member_addr_content;
	}

	
}
