/*2018-07-03 이광재*/
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberAddrDao {
	//DAO는 멤버변수를 만들면 안된다. 필요한 변수는 모두 메소드내의 지역변수로 만들어야한다.
	
	public ArrayList<MemberAddr> selectMemberAddrByPage(int memberNo) { //리스트에서 이름 클릭시 해당하는 사람의 주소를 출력해주는 메소드.
		//객체의 주소값을 담을 리스트 객체 생성
		ArrayList<MemberAddr> address = new ArrayList<>();
		
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
			
			preparedStatementAddress = connection.prepareStatement("SELECT member_addr_content FROM member_addr WHERE member_no=?");
			preparedStatementAddress.setInt(1, memberNo);
			
			resultsetAddress = preparedStatementAddress.executeQuery();
			System.out.println(resultsetAddress + " : resultsetAddress 객체 생성 완료");
			
			while(resultsetAddress.next()) {
				//주소를 저장해줄 객체 생성
				MemberAddr memberaddr = new MemberAddr();
				//객체에 주소값 저장
				memberaddr.setMemberAddrContent(resultsetAddress.getString(1));
				//객체의 주소값을 리스트의 마지막 인덱스에 추가
				address.add(memberaddr);
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
		//리스트의 주소값 반환
		return address;
	}
	
	public void insertMemberAddr(MemberAddr memberaddr) {	//Member_addr 테이블에 1행을 추가 하기 위한 메소드의 호출. 매개변수는 member 객체의 주소값과 MemberAddr 객체의 주소값
		
		Connection connection = null;
		PreparedStatement preparedStatementAddress = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			System.out.println(connection + " : Connection 객체 생성 완료");
			
			preparedStatementAddress = connection.prepareStatement("INSERT INTO member_addr (member_no,member_addr_content) VALUES (?,?)");
			preparedStatementAddress.setInt(1, memberaddr.getMemberNo());
			preparedStatementAddress.setString(2, memberaddr.getMemberAddrContent());
			
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