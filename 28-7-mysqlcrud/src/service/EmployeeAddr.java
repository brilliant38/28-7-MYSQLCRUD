package service;

public class EmployeeAddr {
	private int employeeAddrNo = 0;	//Domain class내의 필드는 무조건 접근제한자는 private로 작성하는 것이 원칙이다.
	private int employeeNo = 0;
	private String employeeAddrContent = null;
	
	public int getEmployeeAddrNo() {
		return employeeAddrNo;
	}
	public void setEmployeeAddrNo(int employeeAddrNo) {
		this.employeeAddrNo = employeeAddrNo;
	}
	public int getEmployeeNo() {
		return employeeNo;
	}
	public void setEmployeeNo(int employeeNo) {
		this.employeeNo = employeeNo;
	}
	public String getEmployeeAddrContent() {
		return employeeAddrContent;
	}
	public void setEmployeeAddrContent(String employeeAddrContent) {
		this.employeeAddrContent = employeeAddrContent;
	}

	
}
