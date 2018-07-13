// 28-07 구해성
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import service.Student;
import service.StudentAddr;
public class StudentDao {        
	
	public ArrayList<Student> searchStudentList(int currentPage, int pagePerRow, String searchWord) {
		ArrayList<Student> searchList = new ArrayList<Student>();
		
		Connection connection = null;
		PreparedStatement preparedstatementRowNumber = null;
		PreparedStatement preparedstatementSearch = null;
		ResultSet resultsetRowNumber = null;
		ResultSet resultsetSearch = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	//Database 연결
			
			String dataBaseAddress = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dataBaseID = "root";
			String DataBasePW = "java0000";
			System.out.println(dataBaseAddress + " : dataBaseAddress");
			
			connection = DriverManager.getConnection(dataBaseAddress, dataBaseID, DataBasePW);
			System.out.println(connection + " : 01 connection");
			
			preparedstatementRowNumber = connection.prepareStatement("SELECT count(*) FROM student"); //변수에 저장된 쿼리문 입력
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
				preparedstatementSearch = connection.prepareStatement("SELECT student_no,student_name,student_age FROM student ORDER BY student_no DESC LIMIT ?,?");
				preparedstatementSearch.setInt(1, startRow);
				preparedstatementSearch.setInt(2, pagePerRow);
				System.out.println(preparedstatementSearch + " : 07 preparedstatementSearch 객체 생성 완료");
				
				resultsetSearch = preparedstatementSearch.executeQuery();
			
			} else {//searchWord 변수에 값이 입력되었을때 동작되는 쿼리문이다.
				preparedstatementSearch = connection.prepareStatement("SELECT student_no,student_name,student_age FROM student WHERE student_name LIKE ? ORDER BY student_no DESC LIMIT ?,?");
				preparedstatementSearch.setString(1, "%"+searchWord+"%");
				preparedstatementSearch.setInt(2, startRow);
				preparedstatementSearch.setInt(3, pagePerRow);
				System.out.println(preparedstatementSearch + " : 07 preparedstatementSearch 객체 생성 완료");
				
				resultsetSearch = preparedstatementSearch.executeQuery();
			}
			
			while(resultsetSearch.next()) {
				Student student = new Student();
				student.setStudent_age(resultsetSearch.getInt(3));
				student.setStudent_name(resultsetSearch.getString(2));
				student.setStudent_no(resultsetSearch.getInt(1));
				student.setRowNumber(rowNumber);
				student.setSearchWord(searchWord);
				searchList.add(student);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 파일을 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("쿼리문장이 잘못 되었습니다.");
			e.printStackTrace();
		} finally {
			
			try {
				resultsetSearch.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				preparedstatementSearch.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				preparedstatementRowNumber.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return searchList;
	}
	public ArrayList<Student> selectStudent(int currentPage, int pagePerRow) {
		
		ArrayList<Student> list = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedstatementRowNumber = null;
		PreparedStatement preparedstatementSearch = null;
		ResultSet resultsetRowNumber = null;
		ResultSet resultsetSearch = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "root"; //드라이버 id
			String dbPass = "java0000"; // 드라이버 pw
			connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			preparedstatementRowNumber = connection.prepareStatement( "SELECT count(*) FROM student");
			
			resultsetRowNumber = preparedstatementRowNumber.executeQuery();
			
			if(resultsetRowNumber.next()) {
				resultsetRowNumber.getInt(1);
			}
			
			int rowNumber = resultsetRowNumber.getInt(1);
			System.out.println( rowNumber + "<- rowNumber확인");
			int startRow = (currentPage -1) * pagePerRow;
			
			int end = startRow + (pagePerRow -1);
			if (end > pagePerRow-1) {
				end = pagePerRow;
			}
			preparedstatementSearch = connection.prepareStatement( "SELECT student_no, student_name, student_age FROM student ORDER BY student_no DESC LIMIT ?,?");
			preparedstatementSearch.setInt(1, startRow);
			preparedstatementSearch.setInt(2, pagePerRow);
			
			resultsetSearch= preparedstatementSearch.executeQuery();
			
			while(resultsetSearch.next()) {
				Student student = new Student();
				student.setStudent_no(resultsetSearch.getInt(1));
				student.setStudent_name(resultsetSearch.getString(2));
				student.setStudent_age(resultsetSearch.getInt(3));
				student.setRowNumber(rowNumber);
				
				list.add(student);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				resultsetSearch.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				preparedstatementSearch.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				preparedstatementRowNumber.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;

		
	// TODO: handle exception
}
	public ArrayList<Student> updateForSelectStudent(int studentNo) {
		ArrayList<Student> list = new ArrayList<Student>();
		
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
			
			preparedstatementUpdateForSelect = connection.prepareStatement("select student_no, student_name, student_age from student where student_no=?"); //변수에 저장된 쿼리문 입력
			preparedstatementUpdateForSelect.setInt(1, studentNo);
			System.out.println(preparedstatementUpdateForSelect + " : 02 preparedstatementUpdateForSelect");
			
			resultsetUpdateForSelect = preparedstatementUpdateForSelect.executeQuery();
			
			while(resultsetUpdateForSelect.next()) {
				Student student = new Student();
				student.setStudent_no(resultsetUpdateForSelect.getInt("student_no"));
				student.setStudent_name(resultsetUpdateForSelect.getString("student_name"));
				student.setStudent_age(resultsetUpdateForSelect.getInt("student_age"));
				list.add(student);
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
	
	public void updateStudent(Student student) {
		System.out.println(01 + "<-update 확인");
		Connection connection = null;
		PreparedStatement preparedstatementUpdateForSelect = null;
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "root"; //드라이버 id
			String dbPass = "java0000"; // 드라이버 pw
			connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			preparedstatementUpdateForSelect= connection.prepareStatement("UPDATE student SET student_name = ?, student_age = ? where student_no = ?");
			preparedstatementUpdateForSelect.setString(1, student.getStudent_name());
			preparedstatementUpdateForSelect.setInt(2,student.getStudent_age());
			preparedstatementUpdateForSelect.setInt(3,student.getStudent_no());
			
			preparedstatementUpdateForSelect.executeUpdate();
		}catch (Exception e) {

		}
	}

		
	
	public void StudentDelete(int studentNo) {
		Connection connection = null;
		PreparedStatement preparedstatementDeleteStudent = null;
		ResultSet rs = null;
		System.out.println("!!DELETE확인");
		try{
			Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "root"; //드라이버 id
			String dbPass = "java0000"; // 드라이버 pw
			
			connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			preparedstatementDeleteStudent = connection.prepareStatement("DELETE FROM student WHERE student_no=?");
			System.out.println(preparedstatementDeleteStudent + "<-- pstmt 1");
			preparedstatementDeleteStudent.setInt(1, studentNo);
			preparedstatementDeleteStudent.executeUpdate();
			preparedstatementDeleteStudent.close();
			connection.close();
		}catch (Exception e) {
			
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (preparedstatementDeleteStudent != null) try { preparedstatementDeleteStudent.close(); } catch(SQLException ex) {}
			
			// 7. 커넥션 종료
			if (connection != null) try { connection.close(); } catch(SQLException ex) {}
		}
		}
	
	}
	

		
		
			