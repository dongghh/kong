package com.kong.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kong.Service.MemberService;
import com.kong.domain.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService service;

	@Inject
	BCryptPasswordEncoder pwdEncoder;

	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}

	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("post register");
		int result = service.idChk(vo);
		try {
			if (result == 1) {
				return "/member/register";
			} else if (result == 0) {
				String inputPass = vo.getUserPass();
				String pwd = pwdEncoder.encode(inputPass);
				vo.setUserPass(pwd);

				service.register(vo);
				logger.info("회원가입 완료");
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/";
	}

	// 로그인 get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getLogin() throws Exception {
		logger.info("get login");
	}

	// 로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		logger.info("post login");

		session.getAttribute("member");
		MemberVO login = service.login(vo);
		boolean pwdMatch = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());

		if (login != null && pwdMatch == true) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/login";
		}

		return "redirect:/";
	}

	// 로그아웃 post
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

	// 회원정보 수정 get
	@RequestMapping(value = "/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception {
		return "member/memberUpdateView";
	}

	// 회원정보 수정 post
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception {

		service.memberUpdate(vo);

		session.invalidate();

		return "redirect:/";
	}

	// 회원 탈퇴 get
	@RequestMapping(value = "/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {
		return "member/memberDeleteView";
	}

	// 회원 탈퇴 post
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {

		service.memberDelete(vo);
		session.invalidate();

		return "redirect:/";
	}

	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value = "/passChk", method = RequestMethod.POST)
	public boolean passChk(MemberVO vo) throws Exception {

		MemberVO login = service.login(vo);
		boolean pwdChk = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
		return pwdChk;
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}

	// 아이디 찾기 실행
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findIdAction() throws Exception {
		return "/member/findId";
	}

	// 비밀번호 찾기 실행
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String findPasswordAction() throws Exception {
		return "/member/findPw";
	}

	// 아이디 찾기 실행
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String findIdAction(MemberVO vo, Model model) throws Exception {
		MemberVO user = service.findId(vo);

		if (user == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("id", user.getUserId());
		}

		return "/member/findId";
	}

	// 비밀번호 찾기 실행
	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public String findPasswordAction(MemberVO vo, Model model) throws Exception {
		MemberVO user = service.findPw(vo);

		if (user == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("updateid", user.getUserId());
		}

		return "/member/findPw";
	}

	// 비밀번호 바꾸기 실행
	@RequestMapping(value = "updatePw", method = RequestMethod.POST)
	public String updatePwAction(@RequestParam(value = "updateid", defaultValue = "", required = false) String id,
			MemberVO vo) throws Exception {
		vo.setUserId(id);
		System.out.println(vo);
		service.updatePw(vo);
		return "member/findPasswordConfirm";
	}

}