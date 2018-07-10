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
	
	public void insertMemberAddr(Member member, MemberAddr memberaddr) {	//Member_addr 테이블에 1행을 추가 하기 위한 메소드의 호출. 매개변수는 member 객체의 주소값과 MemberAddr 객체의 주소값
		
		String addrMember = member.getMemberName();
		String addrMemberAddr = memberaddr.getMemberAddrContent();
		
		Connection connection = null;
		PreparedStatement preparedStatementRowNumber = null;
		PreparedStatement preparedStatementAddress = null;
		ResultSet resultsetRowNumber = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			System.out.println(connection + " : Connection 객체 생성 완료");
			
			preparedStatementRowNumber = connection.prepareStatement("SELECT member_no FROM member WHERE member_name=?");
			preparedStatementRowNumber.setString(1, addrMember);
			System.out.println(preparedStatementRowNumber + " : PreparedStatement 객체 생성 완료");
			
			resultsetRowNumber = preparedStatementRowNumber.executeQuery();	

			int rowNumber = 0;
			
			if(resultsetRowNumber.next()) {
				resultsetRowNumber.getInt(1);
			}
			//현재 전체 선택된 사람의 행 번호 조회 후 저장
			rowNumber = resultsetRowNumber.getInt(1);
			
			preparedStatementAddress = connection.prepareStatement("INSERT INTO member_addr (member_no,member_addr_content) VALUES (?,?)");
			preparedStatementAddress.setInt(1, rowNumber);
			preparedStatementAddress.setString(2, addrMemberAddr);
			
			//저장 된 번호를 참조하여 주소 테이블에 행 추가.
			preparedStatementAddress.executeUpdate();
			
		} catch (ClassNotFoundException e) {	//클래스 예외처리 작성
			System.out.println("컴파일된 자바 클래스 파일을 찾을 수 없는 문제");
			e.printStackTrace();
		} catch (SQLException e) {	//쿼리문 예외처리 작성
			System.out.println("SQL 쿼리문 작성문제");
			e.printStackTrace();
			
		} finally {	// 작업 완료시 종료 
			
			if(resultsetRowNumber != null) {	//PreparedStatement 객체 종료
				try {
					resultsetRowNumber.close();
				} catch (SQLException e) {
					System.out.println("SQL 쿼리문 작성문제");
					e.printStackTrace();
				}
			}
			
			if(preparedStatementRowNumber != null) {	//PreparedStatement 객체 종료
				try {
					preparedStatementRowNumber.close();
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
	}
}