package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmployeeAddrDao {
	
	public ArrayList<EmployeeAddr> selectEmployeeAddrByPage(int employeeNo) {
		ArrayList<EmployeeAddr> list = new ArrayList<EmployeeAddr>();
		
		Connection connection = null;
		PreparedStatement preparedStatementAddress = null;
		ResultSet resultsetAddress = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			System.out.println(connection + " : Connection 객체 생성 완료");
			
			preparedStatementAddress = connection.prepareStatement("SELECT employee_addr_no,employee_no,employee_addr_content FROM employee_addr WHERE employee_no=?");
			preparedStatementAddress.setInt(1, employeeNo);
			
			resultsetAddress = preparedStatementAddress.executeQuery();
			System.out.println(resultsetAddress + " : resultsetAddress 객체 생성 완료");
			
			while(resultsetAddress.next()) {
				//주소를 저장해줄 객체 생성
				EmployeeAddr employeeAddr = new EmployeeAddr();
				//객체에 주소값 저장
				employeeAddr.setEmployeeAddrNo(resultsetAddress.getInt(1));
				employeeAddr.setEmployeeNo(resultsetAddress.getInt(2));
				employeeAddr.setEmployeeAddrContent(resultsetAddress.getString(3));
				//객체의 주소값을 리스트의 마지막 인덱스에 추가
				list.add(employeeAddr);
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
		} finally {	// 작업 완료시 종료
			
			if(resultsetAddress != null) {	//PreparedStatement 객체 종료
				try {
					resultsetAddress.close();
				} catch (SQLException e) {
					System.out.println("SQL 쿼리문 작성문제");
					e.printStackTrace();
				}
			}
			
			if(preparedStatementAddress != null) {	//PreparedStatement 객체 종료
				try {
					preparedStatementAddress.close();
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
		
		return list;
	}
	
	public void insertEmployeeAddr(EmployeeAddr employeeAddr) {
		
		Connection connection = null;
		PreparedStatement preparedStatementAddress = null;
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			System.out.println(connection + " : Connection 객체 생성 완료");
			
			preparedStatementAddress = connection.prepareStatement("INSERT INTO employee_addr (employee_no,employee_addr_content) VALUES (?,?)");
			preparedStatementAddress.setInt(1, employeeAddr.getEmployeeNo());
			preparedStatementAddress.setString(2, employeeAddr.getEmployeeAddrContent());
			
			//번호를 참조하여 주소 테이블에 행 추가.
			preparedStatementAddress.executeUpdate();
			
		} catch (ClassNotFoundException e) {	//클래스 예외처리 작성
			System.out.println("컴파일된 자바 클래스 파일을 찾을 수 없는 문제");
			e.printStackTrace();
		} catch (SQLException e) {	//쿼리문 예외처리 작성
			System.out.println("SQL 쿼리문 작성문제");
			e.printStackTrace();
			
		} finally {	// 작업 완료시 종료 
			
			if(preparedStatementAddress != null) {	//PreparedStatement 객체 종료
				try {
					preparedStatementAddress.close();
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
		
	}
}
