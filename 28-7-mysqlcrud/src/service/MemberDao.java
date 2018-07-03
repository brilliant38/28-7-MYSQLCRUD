/*2018-07-03 이광재*/
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDao {
	//insertMemberForm,inserMemberAction.jsp
	//DAO는 멤버변수를 만들면 안된다. 필요한 변수는 모두 메소드내의 지역변수로 만들어야한다.
	//Model1에서는 DAO 클래스를 만들때 반드시 try..catch..finally를 사용한다. throws로 예외를 처리하지 않는다.
	
	public void updateMember(Member member) {
		
		Connection connection = null;
		PreparedStatement preparedstatementupdateMember = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	//Database 연결
			
			String dataBaseAddress = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dataBaseID = "root";
			String DataBasePW = "java0000";
			System.out.println(dataBaseAddress + " : dataBaseAddress");
			
			connection = DriverManager.getConnection(dataBaseAddress, dataBaseID, DataBasePW);
			System.out.println(connection + " : 01 connection");
			
			preparedstatementupdateMember = connection.prepareStatement("UPDATE member SET member_name = ?, member_age = ? where member_no = ?"); //변수에 저장된 쿼리문 입력
			preparedstatementupdateMember.setString(1, member.getMemberName());
			preparedstatementupdateMember.setInt(2, member.getMemberAge());
			preparedstatementupdateMember.setInt(3, member.getMemberNo());
			System.out.println(preparedstatementupdateMember + " : 02 preparedstatementupdateMember");
			
			preparedstatementupdateMember.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 파일을 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("쿼리문장이 잘못 되었습니다.");
			e.printStackTrace();
		} finally {
			try {
				preparedstatementupdateMember.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<Member> updateForSelectMember(int memberNo) {
		ArrayList<Member> list = new ArrayList<Member>();
		
		Connection connection = null;
		PreparedStatement preparedstatementUpdateForSelect = null;
		ResultSet resultsetUpdateForSelect = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	//Database 연결
			
			String dataBaseAddress = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dataBaseID = "root";
			String DataBasePW = "java0000";
			System.out.println(dataBaseAddress + " : dataBaseAddress");
			
			connection = DriverManager.getConnection(dataBaseAddress, dataBaseID, DataBasePW);
			System.out.println(connection + " : 01 connection");
			
			preparedstatementUpdateForSelect = connection.prepareStatement("select member_no, member_name, member_age from member where member_no=?"); //변수에 저장된 쿼리문 입력
			preparedstatementUpdateForSelect.setInt(1, memberNo);
			System.out.println(preparedstatementUpdateForSelect + " : 02 preparedstatementUpdateForSelect");
			
			resultsetUpdateForSelect = preparedstatementUpdateForSelect.executeQuery();
			
			while(resultsetUpdateForSelect.next()) {
				Member member = new Member();
				member.setMemberNo(resultsetUpdateForSelect.getInt("member_no"));
				member.setMemberName(resultsetUpdateForSelect.getString("member_name"));
				member.setMemberAge(resultsetUpdateForSelect.getInt("member_age"));
				list.add(member);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 파일을 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("쿼리문장이 잘못 되었습니다.");
			e.printStackTrace();
		} finally {
			try {
				resultsetUpdateForSelect.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				preparedstatementUpdateForSelect.close();
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
	
	public void deleteMember(int memberNo) {
		Connection connection = null;
		PreparedStatement preparedstatementDeleteMember = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	//Database 연결
			
			String dataBaseAddress = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dataBaseID = "root";
			String DataBasePW = "java0000";
			System.out.println(dataBaseAddress + " : dataBaseAddress");
			
			connection = DriverManager.getConnection(dataBaseAddress, dataBaseID, DataBasePW);
			System.out.println(connection + " : 01 connection");
			
			preparedstatementDeleteMember = connection.prepareStatement("delete from member where member_no = ?"); //변수에 저장된 쿼리문 입력
			preparedstatementDeleteMember.setInt(1, memberNo);
			System.out.println(preparedstatementDeleteMember + " : 02 preparedstatementDeleteMember");
			
			preparedstatementDeleteMember.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 파일을 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("쿼리문장이 잘못 되었습니다.");
			e.printStackTrace();
		} finally {
			try {
				preparedstatementDeleteMember.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		

	}
	
	public ArrayList<Member> selectMemberByPage(int currentPage, int pagePerRow) {	//현재 페이지 숫자, 페이지당 행의 갯수를 입력받아 정해진 행의 갯수만큼을 조회하는 메소드
		/*
		 * List :  갯수가 동적, list.size 입력된 값
		 * 배열 : 갯수가 정적, [].length 만들어진 배열이 모두 존재.
		 * 배열의 사용을 편하게 -> List, Set, Map
		 * JDBC API SELECT의 결과물은 ResultSet이므로 JDBC API를 JSP 페이지에서 사용하지 않기 위해 배열(ArrayList<Member>)로 타입을 전환시킨다.
		 * 
		 */
		ArrayList<Member> List = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedstatementRowNumber = null;
		PreparedStatement preparedstatementPagePerRow = null;
		ResultSet resultsetRowNumber = null;
		ResultSet resultsetPagePerRow = null;
		String sqlRowNumber = "SELECT count(*) FROM member";
		String sqlPage = "SELECT member_no, member_name, member_age FROM member ORDER BY member_no LIMIT ?,?";
		
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
				Member member = new Member(); 
				member.setMemberNo(resultsetPagePerRow.getInt(1));
				member.setMemberName(resultsetPagePerRow.getString(2));;
				member.setMemberAge(resultsetPagePerRow.getInt(3));;
				member.setRowNumber(rowNumber);
				List.add(member);
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
		
		return List; // list 최대 pagePerRow~1
	}
	
	
	public int insertMember(Member member) {
		System.out.println("insertMember 메소드 실행 완료");
		
		String memberName = member.getMemberName(); //Member_addr 테이블에 1행을 추가 하기 위한 메소드의 호출. 매개변수는 member 객체의 주소값
		int memberAge = member.getMemberAge(); //MemberAddr객체의 getMember_no 메소드 호출 후 변수에 저장
		System.out.println(memberName + " : memberName 전송완료");
		System.out.println(memberAge + " : memberAge 전송완료");
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		//mysql 드라이버 로딩
		try {			
			//com.mysql.jdbc.Driver 클래스 로딩 완료 
			Class.forName("com.mysql.jdbc.Driver");

			//Database 연결(Connection 객체 생성)
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); 
			System.out.println(conn + " : Connection 객체 생성 완료");
			
			//prepareStatement메소드 호출하여 쿼리문 실행 준비
			pstmt = conn.prepareStatement("insert into member (member_name, member_age) values (?,?)"); 
			pstmt.setString(1, memberName);
			pstmt.setInt(2, memberAge);
			System.out.println(pstmt + " : PreparedStatement 객체 생성 완료");
			
			result = pstmt.executeUpdate();	//executeUpdate메소드를 호출하여 쿼리문 실행
			
		} catch (ClassNotFoundException e) { //executeUpdate메소드를 호출하여 쿼리문 실행
			// TODO Auto-generated catch block
			System.out.println("컴파일된 자바 클래스 파일을 찾을 수 없는 문제");
			e.printStackTrace();
		} catch (SQLException e) {//쿼리문 예외처리 작성
			System.out.println("SQL 쿼리문 작성문제");
			e.printStackTrace();
		
		} finally {	// 작업 완료시 종료 
			if(pstmt != null) {	//PreparedStatement 객체 종료
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("SQL 쿼리문 작성문제");
					e.printStackTrace();
				}
			}
			
			if(conn != null) {	//Database 연결 종료
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("SQL 쿼리문 작성문제");
					e.printStackTrace();
				}
			}
		}
		return result;
	}
}
