//package com.kh.final3.chatting.config;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.messaging.simp.config.MessageBrokerRegistry;
//import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
//import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
//import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
//
//public class StompConfiguration {
//	@Configuration
//	@EnableWebSocketMessageBroker
//	public class WebSockConfig implements WebSocketMessageBrokerConfigurer {
//
//	    //private final StompHandler stompHandler;
//
//	    @Override
//	    public void configureMessageBroker(MessageBrokerRegistry config) {
//	        config.enableSimpleBroker("/sub","/online");
//	        config.setApplicationDestinationPrefixes("/pub");
//	    }
//
//	    @Override
//	    public void registerStompEndpoints(StompEndpointRegistry registry) {
//	        registry.addEndpoint("${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/ws-stomp").setAllowedOrigins("*")
//	                .withSockJS(); // sock.js를 통하여 낮은 버전의 브라우저에서도 websocket이 동작할수 있게 합니다.
//	    }
//
////	    @Override
////	    public void configureClientInboundChannel(ChannelRegistration registration) {
////	        registration.interceptors(stompHandler);
////	    }
//	}
//}
