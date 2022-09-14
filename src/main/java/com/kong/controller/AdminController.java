package com.kong.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kong.Service.AdminService;
import com.kong.domain.CategoryVO;
import com.kong.domain.MemberVO;
import com.kong.domain.OrderListVO;
import com.kong.domain.OrderVO;
import com.kong.domain.itemReplyListVO;
import com.kong.domain.itemReplyVO;
import com.kong.domain.itemVO;
import com.kong.domain.itemViewVO;
import com.kong.utils.UploadFileUtils;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	AdminService service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 회원 목록
	@RequestMapping(value = "/memberList")
	public String memberList(Model model) throws Exception {
		List<MemberVO> list = service.memberList();

		logger.info("회원 목록 로그입니다.");

		model.addAttribute("list", list);

		return "admin/memberList";

	}

	// 상품 등록 get
	@RequestMapping(value = "/item/register", method = RequestMethod.GET)
	public void getItemRegister(Model model) throws Exception {
		logger.info("get item register");

		List<CategoryVO> category = null;
		category = service.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}

	// 상품 등록 Post
	@RequestMapping(value = "/item/register", method = RequestMethod.POST)
	public String postItemRegister(itemVO vo, MultipartFile file) throws Exception {

		String imgUploadPath = uploadPath + File.separator + "imgUpload"; // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath); // 위의 폴더를 기준으로 연월일 폴더를 생성
		String fileName = null; // 기본 경로와 별개로 작성되는 경로 + 파일이름

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)

			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			// gdsImg에 원본 파일 경로 + 파일명 저장
			vo.setItemImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			vo.setItemThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 첨부된 파일이 없으면
			fileName = File.separator + "images" + File.separator + "none.png";
			// 미리 준비된 none.png파일을 대신 출력함

			vo.setItemImg(fileName);
			vo.setItemThumbImg(fileName);
		}

		service.register(vo);

		return "redirect:/";
	}

	// 상품 목록
	@RequestMapping(value = "/item/list", method = RequestMethod.GET)
	public void getItemList(Model model) throws Exception {
		logger.info("get item list");

		List<itemViewVO> list = service.itemlist();

		model.addAttribute("list", list);
	}

	// 상품 조회
	@RequestMapping(value = "/item/view", method = RequestMethod.GET)
	public void getitemview(@RequestParam("n") int itemNum, Model model) throws Exception {
		logger.info("get item view");

		itemViewVO item = service.itemView(itemNum);

		model.addAttribute("item", item);
	}

	// 상품 수정 GET
	@RequestMapping(value = "/item/modify", method = RequestMethod.GET)
	public void getItemModify(@RequestParam("n") int itemNum, Model model) throws Exception {
		logger.info("get item modify");

		itemViewVO item = service.itemView(itemNum);
		model.addAttribute("item", item);

		List<CategoryVO> category = null;
		category = service.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}

	// 상품 수정 POST
	@RequestMapping(value = "/item/modify", method = RequestMethod.POST)
	public String postItemModify(itemVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		logger.info("post item modify");

		// 새로운 파일이 등록되었는지 확인
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadPath + req.getParameter("itemImg")).delete();
			new File(uploadPath + req.getParameter("itemThumbImg")).delete();

			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			vo.setItemImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setItemThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			vo.setItemImg(req.getParameter("itemImg"));
			vo.setItemThumbImg(req.getParameter("itemThumbImg"));

		}

		service.itemModify(vo);

		return "redirect:/";
	}

	// 상품 삭제
	@RequestMapping(value = "/item/delete", method = RequestMethod.POST)
	public String postItemDelete(@RequestParam("n") int itemNum) throws Exception {
		logger.info("post goods delete");

		service.itemDelete(itemNum);

		return "redirect:/";
	}

	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/item/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res,
			@RequestParam MultipartFile upload) throws Exception {
		logger.info("post CKEditor img upload");

		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		try {

			String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();

			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화

			printWriter = res.getWriter();
			String fileUrl = "/resources/ckUpload/" + uid + "_" + fileName; // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");

			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}

	// 주문 목록
	@RequestMapping(value = "/shop/orderList", method = RequestMethod.GET)
	public void getOrderList(Model model) throws Exception {
		logger.info("get order list");

		List<OrderVO> orderList = service.orderList();

		model.addAttribute("orderList", orderList);
	}

	// 주문 상세 목록
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.GET)
	public void getOrderList(@RequestParam("n") String orderId, OrderVO order, Model model) throws Exception {
		logger.info("get order view");

		order.setOrderId(orderId);
		List<OrderListVO> orderView = service.orderView(order);

		model.addAttribute("orderView", orderView);
	}

	// 주문 상세 목록 - 상태 변경
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception {
		logger.info("post order view");

		service.delivery(order);

		List<OrderListVO> orderView = service.orderView(order);

		itemVO item = new itemVO();

		for (OrderListVO i : orderView) {
			item.setItemNum(i.getItemNum());
			item.setItemStock(i.getCartStock());
			service.changeStock(item);
		}

		return "redirect:/admin/shop/orderView?n=" + order.getOrderId();
	}

	// 모든 소감(댓글)
	@RequestMapping(value = "/shop/allReply", method = RequestMethod.GET)
	public void getAllReply(Model model) throws Exception {
		logger.info("get all reply");

		List<itemReplyListVO> reply = service.allReply();

		model.addAttribute("reply", reply);
	}

	// 모든 소감(댓글)
	@RequestMapping(value = "/shop/allReply", method = RequestMethod.POST)
	public String postAllReply(itemReplyVO reply) throws Exception {
		logger.info("post all reply");

		service.deleteReply(reply.getRepNum());

		return "redirect:/admin/shop/allReply";
	}

}