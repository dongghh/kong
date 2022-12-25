package com.kong.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Controller
@RequestMapping(value = "/chat") // 주소 패턴
public class ChatController extends TextWebSocketHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	// 클라이언트 연결
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		sessionList.add(session);

		logger.info("{} 연결됨", session.getId());
	}

	// 클라이언트 웹소켓 서버로 메세지 전송
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());

		for (WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(message.getPayload()));
		}
	}

	// 클라이언트 연결 해제
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		sessionList.remove(session);

		logger.info("{} 연결 끊김.", session.getId());
	}

}
