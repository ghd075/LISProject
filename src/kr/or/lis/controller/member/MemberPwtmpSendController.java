package kr.or.lis.controller.member;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.lis.common.Controller;
import kr.or.lis.service.MemberService;
import kr.or.lis.service.MemberServiceImpl;

public class MemberPwtmpSendController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String nextPage = null;
		
		//기존에 받아온 이메일을 string으로 받음.
		String memail = request.getParameter("memail");
		
		System.out.println("이메일 : " + memail);

		// mail server 설정
		String host = "smtp.gmail.com";
		String user = "rlfls54@gmail.com"; // 자신의 네이버 계정
		String password = "bqocuxhcktjkwlyp";// 자신의 네이버 패스워드

		// 메일 받을 주소
		/* String to_email = m.getEmail(); */
		String to_email = memail;

		// SMTP 서버 정보를 설정한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		// 임시 비밀번호 생성키
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
		
		String tempPw = temp.toString();
		System.out.println("임시비밀번호 : " + tempPw);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		System.out.println("session : " + session);
		
		//임시 비밀번호 update로 비밀번호 변경시키기
		MemberService msv = MemberServiceImpl.getInstance();
		String mid = request.getParameter("mid");
		System.out.println("id : " + mid);
		int rs = msv.tmpPwUpdate(mid, tempPw);
		System.out.println(rs + "개의 비밀번호 변경, 임시비밀번호 : " + tempPw);
		
		if(rs == 1) {
			// 비밀번호가 업데이트 되고나서 email 전송
			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user, "LIS"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

				System.out.println("msg : " + msg.toString());
				// 메일 제목
				msg.setSubject("안녕하세요.  LIS의 임시 비밀번호입니다..");
				
				// 메일 내용
				//msg.setText("임시 비밀번호는 " + temp + "입니다.");
				
                // 이메일 내용
				// 텍스트 본문 추가
                String htmlContent = "<html><body>";
                htmlContent += "<p style='font-weight: bold;'>임시 비밀번호는 " + temp + "입니다.</p>";
                htmlContent += "<p style='color: red;'>로그인 후 보안 위험이 있으니 꼭 변경하시기 바랍니다.</p>";
                
                // 이미지를 본문에 추가
                htmlContent += "<img src='https://i.postimg.cc/13jMPy2Q/LIS-pw.gif'>";
                htmlContent += "</body></html>";

                MimeMultipart multipart = new MimeMultipart();
                // 텍스트 본문
                MimeBodyPart textPart = new MimeBodyPart();
                textPart.setContent(htmlContent, "text/html; charset=UTF-8");
                multipart.addBodyPart(textPart);

                msg.setContent(multipart);

				Transport.send(msg);
				System.out.println("이메일 전송");
				
				request.setAttribute("login_error", "임시비밀번호가 전송되었습니다. 메일 확인 후 로그인해주세요.");
				
				nextPage = "memberLogin";
				
			} catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
			
		}else {
			request.setAttribute("pw_Search_error", "에러가 발생했습니다. 다시 시도해주세요");
			nextPage = "memberPwSearch";
		}
			
		HttpSession saveKey = request.getSession();
		saveKey.setAttribute("tempPw", tempPw);
		return nextPage;
	}

}
