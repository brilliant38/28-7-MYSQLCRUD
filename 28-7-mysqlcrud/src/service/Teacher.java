//*2018-07-01 김준영*//

package service;//패키지명


 

public class Teacher {
	private int teacherNo; //teacher의 번호
	private String teacherName; //teacher의 이름
	private int teacherAge; //teacher의 나이
	//해당 클래스 내에서만 사용하기 위해서 변수를 private을 사용하여 만들어 줍니다.
	
	
	//같은 프로젝트 내에서 호출하기 위하여 setter, getter 메서드는 public을 사용하여 만들어 줍니다.
	public int getTeacherNo() {
		return teacherNo; //메서드가 호출한 곳으로 반환됩니다.
	}
	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo; //매개변수 teacherNo에 담겨있는 값을 전역변수 teacherNo에 대입합니다.
	}
	public String getTeacherName() {
		return teacherName; //메서드가 호출한 곳으로 반환됩니다.
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName; //매개변수 teacherName에 담겨있는 값을 전역변수 teacherName에 대입합니다.
	}
	public int getTeacherAge() {
		return teacherAge; //메서드가 호출한 곳으로 반환됩니다.
	}
	public void setTeacherAge(int teacherAge) {
		this.teacherAge = teacherAge; //매개변수 teacherAge에 담겨있는 값을 전역변수 teacherAge에 대입합니다.
	}
}