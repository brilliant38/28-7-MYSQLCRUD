/*2018-06-26 �̱���*/
package service;

public class Member {
	private int MemberNo = 0;	//Domain class���� �ʵ�� ������ ���������ڴ� private�� �ۼ��ϴ� ���� ��Ģ�̴�.
	private String member_name = null;
	private int member_age = 0;
	
	public int getMemberNo() { //�������� ���� ����
		return MemberNo;
	}
	public void setMemberNo(int memberNo) { //�Ű������� �Էµ� ���� ���������� ������.
		this.MemberNo = memberNo;
	}
	public String getMember_name() {//�������� ���� ����
		return member_name;
	}
	public void setMember_name(String member_name) {//�Ű������� �Էµ� ���� ���������� ������.
		this.member_name = member_name;
	}
	public int getMember_age() {//�������� ���� ����
		return member_age;
	}
	public void setMember_age(int member_age) {//�Ű������� �Էµ� ���� ���������� ������.
		this.member_age = member_age;
	}
	
	
}
