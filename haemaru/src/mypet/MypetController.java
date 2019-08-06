package mypet;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;
import member.MemberVO;
import mypet.MypetVO;
import property.SiteProperty;
import util.Function;

@Controller
public class MypetController {

	@Autowired
	private MypetService mypetService;
	
	@RequestMapping("/manage/mypet/index")
	public String index(Model model, MypetVO param) throws Exception {
		int[] rowPageCount = mypetService.count(param);
		ArrayList<MypetVO> list = mypetService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
	
		return "manage/mypet/index";
	}
	
	//MypetVO data = mypetService.read(param.getNo());
	@RequestMapping("/manage/mypet/read")
	public String read(Model model, MypetVO param) throws Exception {
		MypetVO data = mypetService.read(param);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/mypet/read";
	}
	
	@RequestMapping("/manage/mypet/edit")
	public String edit(Model model, MypetVO param) throws Exception {
		MypetVO data = mypetService.read(param);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/mypet/edit";
	}
	
	@RequestMapping("/manage/mypet/write")
	public String write(Model model, MypetVO param) throws Exception {
		model.addAttribute("vo", param);
		
		return "manage/mypet/write";
	}
	
	@RequestMapping("/my/my-pet.do")
	public String myPet(Model model, MypetVO param, HttpSession session) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("memberInfo");
		param.setMember_pk(member.getNo());
		ArrayList list = mypetService.mypetsList(param);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "my/my-pet";
	}
	
	@RequestMapping("/my/my-pet-edit.do")
	public String myPetEdit(Model model, MypetVO param, HttpServletRequest request) throws Exception {
		mypetService.update(param, request);
		model.addAttribute("vo", param);
		
		return "redirect:my-pet.do";
	}
	
	@RequestMapping("/my/my-pet-editJson.do")
	public String myPetEditJson(Model model, MypetVO param) throws Exception {
		MypetVO data = mypetService.read(param);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "my/my-pet-editJson";
	}
	
	@RequestMapping("/my/my-pet-add.do")
	public String myPetAdd(Model model, MypetVO param, HttpServletRequest request) throws Exception {
		mypetService.insert(param, request);
		model.addAttribute("vo", param);
		
		return "redirect:my-pet.do";
	}
	
	@RequestMapping("/manage/mypet/process")
	public String process(Model model, MypetVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("mypet");
		
		if ("write".equals(param.getCmd())) {
			int r = mypetService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "/manage/mypet/read?no="+param.getNo());
		} else if ("edit".equals(param.getCmd())) {
			int r = mypetService.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = mypetService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = mypetService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("myedit".equals(param.getCmd())) {
			int r = mypetService.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		return "include/alert";
	
	}
	
}
