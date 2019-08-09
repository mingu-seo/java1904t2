package member;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mail.SendMail;
import manage.admin.AdminVO;
import manage.reserve.ReserveVO;
import member.MypettVO;
import util.DateUtil;
import util.Page;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public int[] count(MemberVO param) throws SQLException {
		int rowCount = memberDAO.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(MemberVO param) throws SQLException {
		ArrayList list = memberDAO.list(param);
		return list;
	}

	public int insert(MemberVO vo) throws SQLException {
		int no = memberDAO.insert(vo);
		return no;
	}

	public int update(MemberVO vo) throws SQLException {
		int cnt = memberDAO.update(vo);
		return cnt;
	}

	public int delete(int no) throws SQLException {
		int cnt = memberDAO.delete(no);
		return cnt;
	}

	public MemberVO read(int no) throws SQLException {
		MemberVO vo = memberDAO.read(no);
		return vo;
	}
	
	public boolean loginCheck(MemberVO vo) throws SQLException {
		int cnt = memberDAO.loginCheck(vo);
		boolean result = false;
		if (cnt == 1) {
			result = true;
		}
		return result;
	}

	public MemberVO getLoginSessionInfo(MemberVO vo) throws SQLException {
		MemberVO data = memberDAO.getLoginSessionInfo(vo);
		return data;
	}

	public int idcheck(String id) throws SQLException {
		int cnt=memberDAO.idcheck(id);
		
		return cnt; 
	}
	
	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i=0; i<no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += memberDAO.delete(nos);
		}
		return r;
	}
	
	public ArrayList<MypettVO> mypetList(int member_pk) throws Exception {
		return memberDAO.mypetList(member_pk);
	}
	
	public void insertLoginHistory(MemberVO vo) throws SQLException {
		memberDAO.insertLoginHistory(vo);
	}
	
	public String findPw(MemberVO vo) throws Exception {
		String pwd = util.Function.randomNumber("HAEMARU");
		vo.setPw(pwd);
		memberDAO.findPw(vo);
		String contents = "임시비밀번호 : "+pwd;
		SendMail.sendEmail("eungi-8@naver.com", vo.getEmail1(), "<해마루> 임시비밀번호입니다.", contents);
		return pwd;
	}
	
	public ReserveVO reservationSchedule(int member_pk) throws Exception {
		HashMap hm = new HashMap();
		hm.put("member_pk", member_pk);
		//hm.put("res_hour", res_hour);
		return memberDAO.reservationSchedule(hm);
	}
	
	public ArrayList memberReservationList(ReserveVO rvo) throws SQLException {
		ArrayList rlist = memberDAO.memberReservationList(rvo);
		return rlist;
	}
	
	public int reservationDelete(int no) throws SQLException {
		int cnt = memberDAO.reservationDelete(no);
		return cnt;
	}
	
//	public ReserveVO reservationRead(int member_pk) throws SQLException {
//		ReserveVO reservedata = memberDAO.reservationRead(member_pk);
//		return reservedata;
//	}
//	
}
