package board.review;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import manage.adopt.AdoptVO;
import property.SiteProperty;
import util.FileUtil;
import util.Function;
import util.Page;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDAO reviewDao;
	
 
	public int[] count(ReviewVO vo) throws Exception {
		int rowCount = reviewDao.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(ReviewVO param) throws SQLException {
		ArrayList list = reviewDao.list(param);
		return list;
	}
 
	public int insert(ReviewVO vo, HttpServletRequest request) throws Exception {

		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file = (MultipartFile) fileMap.get("filename_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.REVIEW_UPLOAD_PATH, SiteProperty.REAL_PATH, "review");
			vo.setFilename(fu.getName());
			vo.setFilename_org(fu.getSrcName());

		}
		int r = (Integer)reviewDao.insert(vo);
		return r;
	}

	public int update(ReviewVO vo, HttpServletRequest request) throws Exception {
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file = (MultipartFile) fileMap.get("filename_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.REVIEW_UPLOAD_PATH, SiteProperty.REAL_PATH, "review");
			vo.setFilename(fu.getName());
			vo.setFilename_org(fu.getSrcName());

		}

		ReviewVO data = reviewDao.read(vo.getNo());
		int r = (Integer)reviewDao.update(vo);
		if (r > 0) {
			if ("1".equals(vo.getFilename_chk()) || !"".equals(Function.checkNull(vo.getFilename()))) {
				System.out.println(vo.getUploadPath());
				System.out.println(data.getFilename());
				Function.fileDelete(vo.getUploadPath(), data.getFilename());
			}
		}
		return r;

	}
	public int delete(int no) throws SQLException {
		int cnt = reviewDao.delete(no);
		return cnt;
	}

	public ReviewVO read(int no) throws SQLException {
		ReviewVO vo = reviewDao.read(no);
		return vo;
	}


	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i=0; i<no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += reviewDao.delete(nos);
		}
		return r;
	}
	public ArrayList<ReviewVO> Intro(ReviewVO rparam) throws Exception {
		return reviewDao.Intro(rparam);
	}
	
	public ArrayList<ReviewVO> IntroA(ReviewVO rparam) throws Exception {
		return reviewDao.IntroA(rparam);
	}
	
	
}
