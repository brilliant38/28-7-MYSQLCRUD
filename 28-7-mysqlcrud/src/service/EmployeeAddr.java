package service;

public class EmployeeAddr {
	private int employeeAddrNo = 0;	//Domain class내의 필드는 무조건 접근제한자는 private로 작성하는 것이 원칙이다.
	private String employeeAddrName = null;
	private int employeeAddrAge = 0;
	private int rowNumber = 0;
	public int getEmployeeAddrNo() {
		return employeeAddrNo;
	}
	public void setEmployeeAddrNo(int employeeAddrNo) {
		this.employeeAddrNo = employeeAddrNo;
	}
	public String getEmployeeAddrName() {
		return employeeAddrName;
	}
	public void setEmployeeAddrName(String employeeAddrName) {
		this.employeeAddrName = employeeAddrName;
	}
	public int getEmployeeAddrAge() {
		return employeeAddrAge;
	}
	public void setEmployeeAddrAge(int employeeAddrAge) {
		this.employeeAddrAge = employeeAddrAge;
	}
	public int getRowNumber() {
		return rowNumber;
	}
	public void setRowNumber(int rowNumber) {
		this.rowNumber = rowNumber;
	}
	
}
