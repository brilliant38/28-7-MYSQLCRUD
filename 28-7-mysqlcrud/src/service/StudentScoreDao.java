package service;

import java.util.ArrayList;

public class StudentScoreDao {
	/**/
	public ArrayList<StudentAndScore> selectStudnetAndScored() {
		ArrayList<StudentAndScore> list = new ArrayList<>(StudentAndScore();
		String sql = "";
		
		while(rs.next());
		Student student = new Student();
		//rs.get...
		StudentScore studentScore= new 	StudentScore();
		//rs.get...
		StudentAndScore studentAndScore = new 	StudentAndScore();
		studentAndScore.setStudent(student);
		StudentAndScore.setStudnetScore(studentScore);
		list.add(studentAndScore);
		}
	return list;
	}
}
