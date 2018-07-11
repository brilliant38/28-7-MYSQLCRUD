package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmployeeScoreDao {
	
	public ArrayList<EmployeeScore> personalScore(int employeeNo) {
		ArrayList<EmployeeScore> list = new ArrayList<EmployeeScore>();
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		ResultSet resultset = null;
		String personalScoreSql = "SELECT score FROM employee_score WHERE employee_no=?";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			System.out.println(connection + " : Connection 객체 생성 완료");
			
			preparedstatement = connection.prepareStatement(personalScoreSql);
			preparedstatement.setInt(1, employeeNo);
			
			resultset = preparedstatement.executeQuery();
			
			if(resultset.next()) {
				EmployeeScore employeeScore = new EmployeeScore();
				employeeScore.setScore(resultset.getInt(1));
				
				list.add(employeeScore);
			}
			
			
		} catch (ClassNotFoundException e) {	//클래스 예외처리 작성
			System.out.println("컴파일된 자바 클래스 파일을 찾을 수 없는 문제");
			e.printStackTrace();
		} catch (SQLException e) {	//쿼리문 예외처리 작성
			System.out.println("SQL 쿼리문 작성문제");
			e.printStackTrace();
			
		} catch (IndexOutOfBoundsException e) {
			System.out.println("인덱스의 크기를 벗어났습니다.");
			e.printStackTrace();
		} finally {
			
			try {
				resultset.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				preparedstatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		
		return list;
	}
	
	public int averageScore() {
		int average = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatementaverage = null;
		ResultSet resultsetaverage = null;
		String averageSql = "SELECT LEFT(AVG(score),2) Average FROM employee_score";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			System.out.println(connection + " : Connection 객체 생성 완료");
			
			preparedStatementaverage = connection.prepareStatement(averageSql);
			
			resultsetaverage = preparedStatementaverage.executeQuery();
			
			if(resultsetaverage.next()) {
				average = resultsetaverage.getInt(1);
			}
			
			System.out.println(average + " : average called");
			
		} catch (ClassNotFoundException e) {	//클래스 예외처리 작성
			System.out.println("컴파일된 자바 클래스 파일을 찾을 수 없는 문제");
			e.printStackTrace();
		} catch (SQLException e) {	//쿼리문 예외처리 작성
			System.out.println("SQL 쿼리문 작성문제");
			e.printStackTrace();
			
		} catch (IndexOutOfBoundsException e) {
			System.out.println("인덱스의 크기를 벗어났습니다.");
			e.printStackTrace();
		} finally {
			
			try {
				preparedStatementaverage.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return average;
	}
	
	
	public ArrayList<EmployeeAndScore> selectEmployeeAndScored(int currentPage, int pagePerRow, String searchWord) {
		ArrayList<EmployeeAndScore> list = new ArrayList<EmployeeAndScore>();
		
		Connection connection = null;
		PreparedStatement preparedStatementScore = null;
		PreparedStatement preparedstatementRowNumber = null;
		ResultSet resultsetScore = null;
		ResultSet resultsetRowNumber = null;
		String selectEmployeeAndScoredSql = "SELECT es.employee_score_no, es.employee_no, e.employee_name, e.employee_age, es.score FROM employee_score es INNER JOIN employee e ON es.employee_no = e.employee_no ORDER BY es.employee_score_no ASC LIMIT ?,?";
		String rowNumberSql = "SELECT count(score) FROM employee_score WHERE score >= (SELECT AVG(score) FROM employee_score)";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			System.out.println(connection + " : Connection 객체 생성 완료");
			
			preparedstatementRowNumber = connection.prepareStatement(rowNumberSql); //변수에 저장된 쿼리문 입력
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
			
			System.out.println(end + " : 06 end");
			
			if(searchWord.equals("")) {//searchWord 변수에 공백이 넘어왔을때 동작하는 쿼리문이다.
				preparedStatementScore = connection.prepareStatement(selectEmployeeAndScoredSql);
				preparedStatementScore.setInt(1, startRow);
				preparedStatementScore.setInt(2, pagePerRow);
				System.out.println(resultsetScore + " : 07 preparedStatementScore 객체 생성 완료");
				
				resultsetScore = preparedStatementScore.executeQuery();
			
			} else {//searchWord 변수에 값이 입력되었을때 동작되는 쿼리문이다.
				preparedStatementScore = connection.prepareStatement("SELECT es.employee_score_no, es.employee_no, e.employee_name, e.employee_age, es.score FROM employee_score es INNER JOIN employee e ON es.employee_no = e.employee_no WHERE employee_name LIKE ? ORDER BY es.employee_score_no ASC LIMIT ?,?");
				preparedStatementScore.setString(1, "%"+searchWord+"%");
				preparedStatementScore.setInt(2, startRow);
				preparedStatementScore.setInt(3, pagePerRow);
				System.out.println(resultsetScore + " : 07 preparedStatementScore 객체 생성 완료");
				
				resultsetScore = preparedStatementScore.executeQuery();
			}
			
			//employee, employeeScore객체에 resultset 테이블에 담긴 값을 담은 뒤 employeeAndScore에 두 객체의 주소값을 담는다. 
			//그리고 list에 employeeAndScore의 주소값을 담는것을 더 이상 행이 없을때까지 반복한다.
			while(resultsetScore.next()) {
				Employee employee = new Employee();
				employee.setEmployeeName(resultsetScore.getString(3));
				employee.setEmployeeAge(resultsetScore.getInt(4));
				employee.setRowNumber(rowNumber);
				
				EmployeeScore employeeScore = new EmployeeScore();
				employeeScore.setEmployeeNo(resultsetScore.getInt(2));
				employeeScore.setEmployeeScoreNo(resultsetScore.getInt(1));
				employeeScore.setScore(resultsetScore.getInt(5));
				
				EmployeeAndScore employeeAndScore = new EmployeeAndScore();
				employeeAndScore.setEmployee(employee);
				employeeAndScore.setEmployeeScore(employeeScore);
				
				list.add(employeeAndScore);
			}
			
		} catch (ClassNotFoundException e) {	//클래스 예외처리 작성
			System.out.println("컴파일된 자바 클래스 파일을 찾을 수 없는 문제");
			e.printStackTrace();
		} catch (SQLException e) {	//쿼리문 예외처리 작성
			System.out.println("SQL 쿼리문 작성문제");
			e.printStackTrace();
			
		} catch (IndexOutOfBoundsException e) {
			System.out.println("DB에 주소값이 없습니다.");
			e.printStackTrace();
		} finally {
			try {
				resultsetScore.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				preparedStatementScore.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return list;
	}
}
