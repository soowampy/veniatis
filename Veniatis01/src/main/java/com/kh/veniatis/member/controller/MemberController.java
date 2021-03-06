package com.kh.veniatis.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.veniatis.common.Pagination;
import com.kh.veniatis.common.files.model.vo.Files;
import com.kh.veniatis.member.model.exception.MemberException;
import com.kh.veniatis.member.model.service.MemberService;
import com.kh.veniatis.member.model.vo.Member;
import com.kh.veniatis.member.model.vo.QnA;
import com.kh.veniatis.project.creator.model.vo.Creator;
import com.kh.veniatis.project.user.model.vo.ProjectView;

@SessionAttributes({ "loginUser", "msg" })
@Controller
public class MemberController {
	@Autowired
	private MemberService mService;

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("loginView.do")
	public String loginView() {
		return "myPage/My/memberLogin";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String memberLogin(Member m, Model model) {
		// HttpSession ????????? ?????? ??????
		Member loginUser = mService.loginMember(m);
		if (loginUser != null) {

			// ?????? ?????? ??? Model??? loginUser ????????? ?????????.
			model.addAttribute("loginUser", loginUser);
			// -> ???????????? ???????????? requestScope?????? ??????
			// ?????? ?????? ???????????? @SessionAttributes?????? ?????????????????? ????????????.

			return "main";
		} else {
			// Exception??? ???????????? errorPage ??????

			// RuntimeException?????? ?????? ????????? ?????? ?????????
			// -> throws??? ?????? ?????? ????????? try-catch??? ?????? ????????? ??????
			throw new MemberException("????????? ??????!!");
			// ?????????????????? ???????????? ?????? -> web.xml??? ?????? ?????? ???????????? ????????????
			// ?????? ????????? ?????? ??? ??? ???????????? ????????? ??????
		}

	}

	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		// ???????????? ????????? ?????? ????????? ????????? ????????? ????????? ????????? ??? ?????? SessionStatus ????????? ??????

		status.setComplete();
		// ????????? ????????? ?????? ???????????? ????????? ????????? ?????????.

		// return "home"; : forward ??????
		return "redirect:home.do"; // redirect ??????
	}

	@RequestMapping("managerMain.do")
	public String managerMain() {

		return "myPage/Manager/managerMain";
	}

	@RequestMapping("selectMemberList.do")
	public ModelAndView selectMemberList() {
		ArrayList<Member> mList = mService.selectMemberList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("mList", mList);
		mv.setViewName("myPage/Manager/memberList");

		return mv;
	}

	@RequestMapping("selectCreatorList.do")
	public String selectCreatorList() {
		return "myPage/Manager/creatorList";
	}

	@RequestMapping("joinProject.do")
	public String joinProject() {
		return "myPage/Manager/okProject";
	}

	@RequestMapping("selectProjectList.do")
	public String selectProjectList() {
		return "myPage/Manager/projectList";
	}

	@RequestMapping("selectCompetitionList.do")
	public String selectCompetitionList() {
		return "myPage/Manager/competitionList";
	}

	@RequestMapping("joinCompetition.do")
	public String joinCompetition() {
		return "myPage/Manager/competitionInsert";
	}

	@RequestMapping("Answer.do")
	public String Answer() {
		return "myPage/Manager/Answer";
	}

	@RequestMapping("memberUpdateForm.do")
	public String memberUpdateForm() {
		return "myPage/My/memberUpdate";
	}

	@RequestMapping("memberUpdate.do")
	public ModelAndView memberUpdate(Member m, @RequestParam(value = "post") String post, Model model,
			@RequestParam(value = "address1") String address1, @RequestParam(value = "address2") String address2) {
		m.setmAddress(post + "#" + address1 + "#" + address2);
		int result = mService.memberUpdate(m);

		if (result > 0) {
			Member loginUser = mService.loginMember(m);
			model.addAttribute("loginUser", loginUser);
			ModelAndView mv = new ModelAndView();
			mv.addObject("Member", loginUser);
			mv.addObject("msg", "??????????????? ?????????????????????.");
			mv.setViewName("redirect:memberUpdateForm.do");
			return mv;
		} else {
			throw new MemberException("???????????? ???????????? ??????!!");
		}

	}

	@RequestMapping("memberLogin.do")
	public String Login() {
		return "myPage/My/memberLogin";
	}

	@RequestMapping("memberInsertForm.do")
	public String memberInsertForm() {
		return "myPage/My/memberInsert";
	}

	@RequestMapping("memberInsertInfo.do")
	public String memberInsertInfo() {
		return "myPage/My/memberInsertInfo";
	}

	@RequestMapping("attendProject.do")
	public ModelAndView attendProject(HttpSession session, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "align", required = false) String align) {

		
		int currentPage = page != null ? page : 1;
		String sort = align != null ? align : "All";
		Member loginUser = (Member) session.getAttribute("loginUser");

		Map map = new HashMap();
		map.put("getmNo", loginUser.getmNo());
		map.put("sort", sort);
		ArrayList<ProjectView> allList = mService.selectLikesList(loginUser.getmNo());
		System.out.println("allList : " + allList);
		ArrayList<ProjectView> likeProject = mService.selectLikes(currentPage, map);
		int[] index = new int[3];
		int allIndex = 0;
		int ingIndex = 0;
		int endIndex = 0;
		Date date = new Date();
		ModelAndView mv = new ModelAndView();
		if (allList != null) {
			allIndex = allList.size();
			for (int i = 0; i < allList.size(); i++) {
				if (allList.get(i).getEndDate().getTime() > date.getTime()) {
					ingIndex++;
				} else {
					endIndex++;
				}
			}
			for (int i = 0; i < likeProject.size(); i++) {
				if (likeProject.get(i).getEndDate().getTime() >= date.getTime()
						&& likeProject.get(i).getSumAmount() >= likeProject.get(i).getTargetAmount()) {
					likeProject.get(i).setProgress("?????????(??????)");
				} else if (likeProject.get(i).getEndDate().getTime() >= date.getTime()
						&& likeProject.get(i).getSumAmount() < likeProject.get(i).getTargetAmount()) {
					likeProject.get(i).setProgress("?????????");
				} else if (likeProject.get(i).getEndDate().getTime() < date.getTime()
						&& likeProject.get(i).getSumAmount() >= likeProject.get(i).getTargetAmount()) {
					likeProject.get(i).setProgress("??????(??????)");
				} else {
					likeProject.get(i).setProgress("??????(??????)");
				}
			}
			System.out.println(likeProject);
			index = new int[] { allIndex, ingIndex, endIndex };
			mv.addObject("likeProject", likeProject);
			mv.addObject("pi", Pagination.getPageInfo());
			if (align != null)
				mv.addObject("align", align);
			mv.addObject("index", index);
			mv.setViewName("myPage/My/attendProject");

			return mv;

		} else {
			throw new MemberException("???????????? ?????? ??????!!");
		}

	}

	@RequestMapping("myInterestProject.do")
	public ModelAndView myInterestProject(HttpSession session,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "align", required = false) String align) {

		int currentPage = page != null ? page : 1;
		String sort = align != null ? align : "All";
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		Map map = new HashMap();
		map.put("getmNo", loginUser.getmNo());
		map.put("sort", sort);
		
		ArrayList<ProjectView> allList = mService.selectInterestList(loginUser.getmNo());
		ArrayList<ProjectView> interestList = mService.myInterestProject(currentPage, map);
		int[] index = new int[3];
		int allIndex = 0;
		int ingIndex = 0;
		int endIndex = 0;
		Date date = new Date();
		ModelAndView mv = new ModelAndView();
		if (allList != null) {
			allIndex = allList.size();
			for (int i = 0; i < allList.size(); i++) {
				if (allList.get(i).getEndDate().getTime() > date.getTime()) {
					ingIndex++;
				} else {
					endIndex++;
				}
			}
			for (int i = 0; i < interestList.size(); i++) {
				if (interestList.get(i).getEndDate().getTime() > date.getTime()
						&& interestList.get(i).getSumAmount() >= interestList.get(i).getTargetAmount()) {
					interestList.get(i).setProgress("?????????(??????)");
				} else if (interestList.get(i).getEndDate().getTime() > date.getTime()
						&& interestList.get(i).getSumAmount() < interestList.get(i).getTargetAmount()) {
					interestList.get(i).setProgress("?????????");
				} else if (interestList.get(i).getEndDate().getTime() < date.getTime()
						&& interestList.get(i).getSumAmount() >= interestList.get(i).getTargetAmount()) {
					interestList.get(i).setProgress("??????(??????)");
				} else {
					interestList.get(i).setProgress("??????(??????)");
				}
			}
			index = new int[] { allIndex, ingIndex, endIndex };
			mv.addObject("interestList", interestList);
			mv.addObject("pi", Pagination.getPageInfo());
			if (align != null)
				mv.addObject("align", align);
			mv.addObject("index", index);
			mv.setViewName("myPage/My/myInterestProject");

			return mv;

		} else {
			throw new MemberException("???????????? ?????? ??????!!");
		}
	}

	@RequestMapping("myOpenProject.do")
	public ModelAndView myOpenProject(HttpSession session,
			@RequestParam(value = "page", required = false) Integer page) {

		int currentPage = page != null ? page : 1;

		Member loginUser = (Member) session.getAttribute("loginUser");
		ModelAndView mv = new ModelAndView();
		int[] index = new int[4];
		int allIndex = 0;
		int ingIndex = 0;
		int endIndex = 0;
		int waitIndex = 0;
		Date date = new Date();
		ArrayList<ProjectView> pList = mService.myOpenProject(loginUser.getmNo(), currentPage);
		allIndex = pList.size();
		for (int i = 0; i < pList.size(); i++) {
			if (pList.get(i).getpStatus().equals("N")) {
				pList.get(i).setProgress("????????????");
				waitIndex++;
			} else {
				if (pList.get(i).getEndDate().getTime() > date.getTime()
						&& pList.get(i).getSumAmount() >= pList.get(i).getTargetAmount()) {
					pList.get(i).setProgress("?????????(??????)");
					ingIndex++;
				} else if (pList.get(i).getEndDate().getTime() > date.getTime()
						&& pList.get(i).getSumAmount() < pList.get(i).getTargetAmount()) {
					pList.get(i).setProgress("?????????");
					ingIndex++;
				} else if (pList.get(i).getEndDate().getTime() < date.getTime()
						&& pList.get(i).getSumAmount() >= pList.get(i).getTargetAmount()) {
					pList.get(i).setProgress("??????(??????)");
					endIndex++;
				} else {
					pList.get(i).setProgress("??????(??????)");
					endIndex++;
				}
			}
		}
		index = new int[] { allIndex, ingIndex, endIndex, waitIndex };
		if (pList != null) {
			mv.addObject("pList", pList);
			mv.addObject("pi", Pagination.getPageInfo());
			mv.addObject("index", index);
			mv.setViewName("myPage/My/myOpenProject");

			return mv;
		} else {
			throw new MemberException("???????????? ?????? ??????!!");
		}
	}

	@RequestMapping("questionForm.do")
	public String questionForm() {
		return "myPage/My/question";
	}

	@RequestMapping("question.do")
	public ModelAndView question(QnA qa, HttpSession session) {
		qa.setmNo(((Member) session.getAttribute("loginUser")).getmNo());
		int result = mService.question(qa);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "?????? ??????");
		mv.setViewName("redirect:questionForm.do");
		return mv;
	}

	@RequestMapping("revenue.do")
	public String revenue() {
		return "myPage/Manager/revenue";
	}

	@RequestMapping("memberInsert.do")
	public ModelAndView memberInsert(Member m, HttpServletRequest request,
			@RequestParam(value = "UserImg", required = false) MultipartFile file,
			@RequestParam(value = "post") String post, @RequestParam(value = "address1") String address1,
			@RequestParam(value = "address2") String address2) {
		m.setmAddress(post + "#" + address1 + "#" + address2);
		int result = mService.memberInsert(m);
		Member member = mService.selectOneMember(m.getmId());
		Files files = new Files(3, "basicImg.jpg", "basicImg.jpg", "resources/memberPhoto/basicImg.jpg");
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			if (!file.getOriginalFilename().equals("")) {
				files = saveFile(file, request);
			}
			files.setmNo(member.getmNo());
			int result2 = mService.mPhotoInsert(files);

			mv.addObject("msg", "??????????????? ??????????????????!");
			mv.setViewName("redirect:home.do");
			return mv;
		} else {
			throw new MemberException("???????????? ??????!!");

		}

	}

	private Files saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\memberPhoto";

		File folder = new File(savePath);

		// ?????? ?????? ????????? ???????????? ????????????
		if (!folder.exists()) {
			folder.mkdirs(); // ?????? ?????????????????? ?????????
		}
		int index = file.getOriginalFilename().indexOf(".");

		String extend = file.getOriginalFilename().substring(index);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		Calendar c = Calendar.getInstance();
		String renameFilename = sdf.format(c.getTime()) + extend;

		String filePath = folder + "\\" + renameFilename;
		Files files = new Files(3, file.getOriginalFilename(), renameFilename,
				"resources/memberPhoto/" + renameFilename);
		try {
			// ??? ?????? ????????? ????????? ?????? ??????
			file.transferTo(new File(filePath));
		} catch (Exception e) {
			System.out.println("?????? ?????? ?????? : " + e.getMessage());
		}
		return files;
	}

	@RequestMapping(value = "email.do")
	@ResponseBody
	public String mailSending(HttpServletRequest request, String email) {
		String setfrom = "VENIATIS";
		String tomail = email; // ?????? ?????? ?????????
		String title = "???????????? ?????? ?????????????????????(VENIATIS)"; // ??????

		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}

		String content = temp.toString(); // ??????
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(new InternetAddress(setfrom, "VENIATIS")); // ??????????????? ??????????????? ?????? ??????????????? ??????
			messageHelper.setTo(tomail); // ???????????? ?????????
			messageHelper.setSubject(title); // ??????????????? ????????? ????????????
			messageHelper.setText(content); // ?????? ??????
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return content;
	}

	@RequestMapping(value = "mPhotoUpdate.do")
	@ResponseBody
	public String mPhotoUpdatedo(HttpServletRequest request, HttpSession session,
			@RequestParam(value = "file", required = false) MultipartFile file, Model model) {
		Member m = (Member) session.getAttribute("loginUser");
		if (file != null && !file.isEmpty()) {
			// ?????? ?????? ??????
			deleteFile(m.getFilePath(), request);
			int result3 = mService.mPhotoDelete(m);

			// ????????? ?????? ????????? ??????
			Files files = new Files();
			if (!file.getOriginalFilename().equals("")) {
				files = saveFile(file, request);
			}
			files.setmNo(m.getmNo());

			// DB??? ??????
			int result2 = mService.mPhotoInsert(files);
			if (result2 > 0) {
				// DB??? ????????? ?????? DB??? ?????? ?????? ???????????? ?????? loginUser??? ?????? ?????????

				m.setFilePath(files.getFilePath());
				model.addAttribute("loginUser", m);
			}

		}
		return m.getFilePath();

	}

	private void deleteFile(String filePath, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath(filePath);

		File deleteFile = new File(root);

		if (deleteFile != null) {
			deleteFile.delete();
		}

	}

}
