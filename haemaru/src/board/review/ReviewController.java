package board.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;
import util.Function;


@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("/adopt/review/review")
	public String review(Model model, ReviewVO param) throws Exception {
		param.setTablename("review");
		int[] rowPageCount = reviewService.count(param);
		ArrayList<ReviewVO> list = reviewService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "adopt/review/review";
	}	
	 
	
	@RequestMapping("/adopt/review/addreview")
	public String addreview(Model model, ReviewVO param) throws Exception {
		model.addAttribute("vo", param);
		
		return "adopt/review/addreview";
	}
	

	@RequestMapping("/adopt/review/process.do")
	public String process(Model model, ReviewVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("review");
		System.out.println(param.getCmd());
		
		if ("write".equals(param.getCmd())) {
			int r = reviewService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "review");
		} else if ("edit".equals(param.getCmd())) {
			int r = reviewService.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("review", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = reviewService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("review", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = reviewService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("review", param, 0));
		}
		
		return "include/alert";
	}
	
	@RequestMapping("/manage/review/index")
	public String manageReview(Model model, ReviewVO param) throws Exception {
		param.setTablename("review");
		int[] rowPageCount = reviewService.count(param);
		ArrayList<ReviewVO> list = reviewService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/review/index";
	}	
	
	@RequestMapping("/manage/review/process.do")
	public String manageProcess(Model model, ReviewVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("review");
		System.out.println(param.getCmd());
		
		if ("write".equals(param.getCmd())) {
			int r = reviewService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = reviewService.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = reviewService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = reviewService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		
		return "include/alert";
	}
	
	
}
