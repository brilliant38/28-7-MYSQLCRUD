package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmployeeDao {
	
	public ArrayList<Employee> selectEmployeeByPage(int currentPage, int pagePerRow) {
		
		ArrayList<Employee> List = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedstatementRowNumber = null;
		PreparedStatement preparedstatementPagePerRow = null;
		ResultSet resultsetRowNumber = null;
		ResultSet resultsetPagePerRow = null;
		String sqlRowNumber = "SELECT count(*) FROM employee";
		String sqlPage = "SELECT employee_no,employee_name, employee_age FROM employee ORDER BY employee_no LIMIT ?,?";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	//Database 연결
			
			String dataBaseAddress = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dataBaseID = "root";
			String DataBasePW = "java0000";
			System.out.println(dataBaseAddress + " : dataBaseAddress");
			
			connection = DriverManager.getConnection(dataBaseAddress, dataBaseID, DataBasePW);
			System.out.println(connection + " : 01 connection");
			
			preparedstatementRowNumber = connection.prepareStatement(sqlRowNumber); //변수에 저장된 쿼리문 입력
			System.out.println(preparedstatementRowNumber + " : 02 preparedstatementRowNumber");
			
			resultsetRowNumber = preparedstatementRowNumber.executeQuery();//쿼리문 실행
			System.out.println(resultsetRowNumber + " : 03 resultsetRowNumber");
			
			if(resultsetRowNumber.next()) {
				resultsetRowNumber.getInt(1); //총 행의 갯수 출력
			}
			
			int rowNumber = resultsetRowNumber.getInt(1);
			System.out.println(rowNumber + " : 04 rowNumber");
			
			int startRow = (currentPage -1) * pagePerRow; // currentPage, pagePerRow를 이용하여 구한다.
			System.out.println(startRow + " : 05 startRow");
			
			int end = startRow + (pagePerRow - 1); // end값이 전체 페이지 갯수를 초과하면 페이지를 표시할 수 없으므로 예외가 출력된다.
			if (end > pagePerRow-1) { //end의 값이 총 행의 갯수 -1 보다 크면 
				end = pagePerRow; // end의 값을 총 행의 갯수와 같게 만든다. = 배열 초과 금지.
			}
			System.out.println(end + " : 07 end");
			
			preparedstatementPagePerRow = connection.prepareStatement(sqlPage);	// 
			preparedstatementPagePerRow.setInt(1, startRow);
			preparedstatementPagePerRow.setInt(2, pagePerRow);
			System.out.println(preparedstatementPagePerRow + " : 06 preparedstatementPagePerRow");
			
			resultsetPagePerRow = preparedstatementPagePerRow.executeQuery(); // 쿼리문을 실행하여 결과 테이블을 resultsetPagePerRow 객체에 담는다.
			System.out.println(resultsetPagePerRow + " : 08 resultsetPagePerRow");
			
			while(resultsetPagePerRow.next()) {
				Employee employee = new Employee(); 
				employee.setEmployeeNo(resultsetPagePerRow.getInt(1));
				employee.setEmployeeName(resultsetPagePerRow.getString(2));;
				employee.setEmployeeAge(resultsetPagePerRow.getInt(3));;
				employee.setRowNumber(rowNumber);
				List.add(employee);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 파일을 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("쿼리문장이 잘못 되었습니다.");
			e.printStackTrace();
		} finally {
			try {
				resultsetPagePerRow.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				resultsetRowNumber.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				preparedstatementPagePerRow.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				preparedstatementRowNumber.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return List;
	}
	
	
	public int insertEmployee(Employee employee) {
		System.out.println("insertEmployee 메소드 실행 완료");
		
		String employeeName = employee.getEmployeeName(); //Member_addr 테이블에 1행을 추가 하기 위한 메소드의 호출. 매개변수는 member 객체의 주소값
		int employeeAge = employee.getEmployeeAge(); //MemberAddr객체의 getMember_no 메소드 호출 후 변수에 저장
		System.out.println(employeeName + " : employeeName 전송완료");
		System.out.println(employeeAge + " : employeeAge 전송완료");
		int result = 0;
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		//mysql 드라이버 로딩
		try {			
			//com.mysql.jdbc.Driver 클래스 로딩 완료 
			Class.forName("com.mysql.jdbc.Driver");

			//Database 연결(Connection 객체 생성)
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); 
			System.out.println(connection + " : Connection 객체 생성 완료");
			
			//prepareStatement메소드 호출하여 쿼리문 실행 준비
			preparedstatement = connection.prepareStatement("insert into employee (employee_name, employee_age) values (?,?)"); 
			preparedstatement.setString(1, employeeName);
			preparedstatement.setInt(2, employeeAge);
			System.out.println(preparedstatement + " : PreparedStatement 객체 생성 완료");
			
			result = preparedstatement.executeUpdate();	//executeUpdate메소드를 호출하여 쿼리문 실행
			
		} catch (ClassNotFoundException e) { //executeUpdate메소드를 호출하여 쿼리문 실행
			// TODO Auto-generated catch block
			System.out.println("컴파일된 자바 클래스 파일을 찾을 수 없는 문제");
			e.printStackTrace();
		} catch (SQLException e) {//쿼리문 예외처리 작성
			System.out.println("SQL 쿼리문 작성문제");
			e.printStackTrace();
		
		} finally {	// 작업 완료시 종료 
			if(preparedstatement != null) {	//PreparedStatement 객체 종료
				try {
					preparedstatement.close();
				} catch (SQLException e) {
					System.out.println("SQL 쿼리문 작성문제");
					e.printStackTrace();
				}
			}
			
			if(connection != null) {	//Database 연결 종료
				try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("SQL 쿼리문 작성문제");
					e.printStackTrace();
				}
			}
		}
		return result;
	}

}
