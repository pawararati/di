
package com.smsone.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Store;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smsone.model.User;
import com.smsone.service.UserService;

@Controller
@RequestMapping("/")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private MailSender mailSender;
	//save user
	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	public String saveUser(@RequestParam("firstName") String firstName,@RequestParam("contactNumber")Long contactNumber,@RequestParam("aadharNumber")Long aadharNumber,@RequestParam("motherTounge")String motherTongue,@RequestParam("address")String address,@RequestParam("pincode")Integer pincode,
			@RequestParam("subcategory1")String state,@RequestParam("password1")String password,@RequestParam("lastName")String lastName,@RequestParam("email")String email,@RequestParam("foodPreference")String foodPreference,@RequestParam("profession")String profession,@RequestParam("city")String city,
			@RequestParam("subcategory")String area,@RequestParam("subcategory2")String country,HttpSession session,@RequestParam("userImg")MultipartFile userImg) throws IOException
	{
		Date date=new Date();
		User user=new User();
		user.setFirstName(firstName);
		user.setContactNumber(contactNumber);
		user.setAddress(address); 
		user.setPincode(pincode);
		user.setCountry(country);
		user.setMotherTongue(motherTongue);
		user.setProfession(profession);
		user.setPassword(password);
		user.setAddress(address);
		user.setLastName(lastName);
		user.setEmail(email);
		user.setCity(city);
		user.setState(state);
		user.setFoodPreference(foodPreference);
		user.setAadharNumber(aadharNumber);
		user.setArea(area);
		byte[] userImg1 = userImg.getBytes();
		user.setUserImg(userImg1);
		//user reference
		User user1=(User)session.getAttribute("user");
		if(user1!=null)
		{
			Long refId=user1.getuId();
			user.setRefId(refId);
		}
		else
		{

		}
		String hashcode = UUID.randomUUID().toString();
		user.setHashcode(hashcode);
		user.setUserCreation_date(date);
		userService.saveUser(user);		
		String link="http://localhost:8080/PGHOSTEL/emailVerify"+"?hashcode="+hashcode+"&email="+email;
		String msg="Thank You For Your Interest..\r\n"+ "Your account"+" " +email+" " +"will be activated..\r\n"+" Please click on the below link.\r\n\r\n"+" "+link;
		sendDivastaysMail(email,msg,"Divastays Email Activation Link");
		return "success";
	}
	public String sendDivastaysMail(String email,String message,String subject)
	{
		SimpleMailMessage simpleMailMessage=new SimpleMailMessage();
		simpleMailMessage.setTo(email);
		simpleMailMessage.setSubject(subject);
		simpleMailMessage.setText(message);
		mailSender.send(simpleMailMessage);
		return "success";
	}
	@RequestMapping(value = "/emailVerify")
	public String emailVerify(@RequestParam(required = false, defaultValue = "hashcode", value="hashcode") String hashcode,@RequestParam(required = false, defaultValue = "email", value="email") String email,Model model)
	{
		User user=new User();
		user.setHashcode(hashcode);
		user.setEmail(email);
		user=userService.verifyUserAccount(user);
		if(user==null)
		{	
			model.addAttribute("status", "InvalidUser");
		}
		else
		{
			String status=user.getStatus();
			if(status.equals("Activated"))
			{
				model.addAttribute("status", "Activated");
			}
			else
			{
				model.addAttribute("status", "Expired");
			}

		}
		model.addAttribute("email", email);
		return "home";
	}
		//save user
				@RequestMapping(value = "/saveEditedUser", method = RequestMethod.POST)
				public String saveEditedUser(@RequestParam("uId") Long uId,@RequestParam("firstName") String firstName,@RequestParam("contactNumber")Long contactNumber,@RequestParam("aadharNumber")Long aadharNumber,@RequestParam("motherTounge")String motherTongue,@RequestParam("address")String address,@RequestParam("pincode")Integer pincode,
						@RequestParam("subcategory1")String state,@RequestParam("password1")String password,@RequestParam("lastName")String lastName,@RequestParam("email")String email,@RequestParam("foodPreference")String foodPreference,@RequestParam("profession")String profession,@RequestParam("city")String city,
						@RequestParam("subcategory")String area,@RequestParam("subcategory2")String country,HttpSession session,@RequestParam("userImg")MultipartFile userImg) throws IOException
				{
					Date date=new Date();
					User user=new User();
					user.setuId(uId);
					user.setFirstName(firstName);
					user.setContactNumber(contactNumber);
					user.setAddress(address);
					user.setPincode(pincode);
					user.setCountry(country);
					user.setMotherTongue(motherTongue);
					user.setProfession(profession);
					user.setPassword(password);
					user.setAddress(address);
					user.setLastName(lastName);
					user.setEmail(email);
					user.setCity(city);
					user.setState(state);
					user.setFoodPreference(foodPreference);
					user.setAadharNumber(aadharNumber);
					user.setArea(area);
					byte[] userImg1 = userImg.getBytes();
					user.setUserImg(userImg1);
					User user1= userService.getUser(user);
					if(user1.getEmail().equals(email) )
					{			
						user.setHashcode(user1.getHashcode());
						user.setUserCreation_date(user1.getUserCreation_date());
						user.setStatus(user1.getStatus());						
					}
					else
					{
						String hashcode = UUID.randomUUID().toString();
						user.setHashcode(hashcode);
						user.setUserCreation_date(date);
						String link="http://localhost:8080/PGHOSTEL/emailVerify"+"?hashcode="+hashcode+"&email="+email;
						String msg="Thank You For Your Interest..\r\n"+ "Your account"+" " +email+" " +"will be activated..\r\n"+" Please click on the below link.\r\n\r\n"+" "+link;
						sendDivastaysMail(email,msg,"Divastays Email Activation Link");
					}	
					userService.updateUser(user);
					return "success";
				}
		@RequestMapping(value = "/resendEmailVerify")
		public String resendEmailVerify(@RequestParam(required = false, defaultValue = "hashcode", value="hashcode") String hashcode,@RequestParam(required = false, defaultValue = "email", value="email") String email,Model model)
		{
			User user=new User();
			user.setHashcode(hashcode);
			user.setEmail(email);
			user=userService.sendNewLink(user);
			if(user==null)
			{	
				model.addAttribute("status", "InvalidUser");
			}
			else
			{
				String status=user.getStatus();
				if(status.equals("Activated"))
				{
					model.addAttribute("status", "Activated");
				}
				else
				{
					model.addAttribute("status", "Expired");
				}

			}
			model.addAttribute("email", email);
			return "home";
		}
		@RequestMapping(value = "/emailExpirePopup",method = RequestMethod.POST)
		public String userExpirePopup(@RequestParam("email") String email)
		{
			Date date=new Date();
			System.out.println(date);
			User user=new User();
			String hashcode = UUID.randomUUID().toString();
			user.setEmailResendTime(date);
			user.setHashcode(hashcode);
		    user.setEmail(email);
		    user=userService.sendNewLink(user);
			String newLink="http://localhost:8080/PGHOSTEL/resendEmailVerify"+"?hashcode="+hashcode+"&email="+email;	
			String msg="Thank You For Your Interest..\r\n"+ "Your account"+" " +email+" " +"will be activated..\r\n"+" Please click on the below link.\r\n\r\n"+" "+newLink;
			sendDivastaysMail(email, msg," Divastays Email Verification Link");
			return "home";
		}
	@RequestMapping(value = "/showUserReg")
	public String showUserRegistration()
	{
		return "userRegistration";
	}
	@RequestMapping(value = "/editUserDetails/{uId}")
	public String editUserDetails(@PathVariable("uId") Long uId,RedirectAttributes ra)
	{
		ra.addAttribute("uId", uId);
		return "redirect:/editUserDetails1";
	}
	@RequestMapping(value = "/editUserDetails1")
	public String editUserDetails1(@RequestParam("uId") Long uId,Model model)
	{	
		User user=new User();
		user.setuId(uId);
		model.addAttribute("user",userService.getUser(user));
		return "editUserRegistration";
	}
	//check user contact number
	@RequestMapping(value = "/checkContactNumber")
	public @ResponseBody String checkContactNumber(@RequestParam("contactNumber") Long contactNumber)
	{
		String msg=null;
		User user=new User();
		user.setContactNumber(contactNumber);
		boolean flag=userService.checkContactNumber(user);
		if(flag==true)
		{
			msg="allreday used contact number";
		}
		else
		{
			msg="";
		}
		return msg;
	}
	@RequestMapping(value = "/checkUserMail")
	public @ResponseBody String checkEmail(@RequestParam("email") String email)
	{
		String msg=null;
		User user=new User();
		user.setEmail(email);
		boolean flag=userService.checkEmail(user);
		if(flag==true)
		{
			msg="allreday used mail id";
		}
		else
		{
			msg="";
		}
		return msg;
	}
	//check user aadhar Number
	@RequestMapping(value = "/checkAadharNumber")
	public @ResponseBody String checkAadharNumber(@RequestParam("aadharNumber") Long aadharNumber)
	{
		String msg=null;
		User user=new User();
		user.setAadharNumber(aadharNumber);
		boolean flag=userService.checkAadharNumber(user);
		if(flag==true)
		{
			msg="allreday used Aadhar number";
		}
		else
		{
			msg="";
		}
		return msg;
	}	
	//send mail
	@RequestMapping(value="/sendMail",method = RequestMethod.POST)
	public String sendMail(@RequestParam("firstName")String firstName,@RequestParam("email")String email,@RequestParam("phoneNumber")String phoneNumber,@RequestParam("message")String message)
	{
		SimpleMailMessage simpleMailMessage=new SimpleMailMessage();
		simpleMailMessage.setTo("randivemayuri123@gmail.com");
		simpleMailMessage.setFrom("mayurandive3@gmail.com");
		simpleMailMessage.setSubject("for contact us");	
		simpleMailMessage.setText("first name:"+firstName+" email:"+email+" phoneNumber:"+phoneNumber+" message:"+message);
		mailSender.send(simpleMailMessage);		
		return "redirect:/showHome";
	}
	// user logout
	@RequestMapping(value ={"/logoutHome","/logoutShortTerm","/logoutLongTerm"})
	public String logout(HttpSession session,HttpServletRequest request) {
		session.removeAttribute("User");
		session.removeAttribute("email");
		session.invalidate();
		if(request.getRequestURI().equals("/PGHOSTEL/logoutHome"))
		{
			return "redirect:/showHome";
		}
		else if(request.getRequestURI().equals("/PGHOSTEL/logoutShortTerm"))
		{
			return "redirect:/showShortTerm";
		}
		else if(request.getRequestURI().equals("/PGHOSTEL/logoutLongTerm"))
		{
			return "redirect:/showLongTerm";
		}
		else if(request.getRequestURI().equals("/PGHOSTEL/logoutFilter"))
		{
			return "redirect:/showFilter";
		}
		else
		{
			return "redirect:/showHome";
		}
	}	
	//login check
	@RequestMapping(value ={"/loginHome","/loginShortTerm","/loginLongTerm","/loginFilter"}, method = RequestMethod.POST)
	public String login(@RequestParam("email") String email,@RequestParam("password") String password,HttpSession session,Model model,HttpServletRequest request,RedirectAttributes ra)
	{
		User user=new User();
		user.setEmail(email);
		user.setPassword(password);
		user=userService.checkLogin(user);
		if(user==null)
		{
			ra.addAttribute("invalid",400);
		}
		else
		{
			session.setAttribute("user",user);
			Long uId=user.getuId();
			ra.addAttribute("uId", uId);
			ra.addAttribute("invalid",0000);
		}
		if(request.getRequestURI().equals("/PGHOSTEL/loginHome"))
		{
			return "redirect:/showHome1";
		}
		else if(request.getRequestURI().equals("/PGHOSTEL/loginShortTerm"))
		{
			return "redirect:/showShortTerm1";
		}
		else if(request.getRequestURI().equals("/PGHOSTEL/loginLongTerm"))
		{
			return "redirect:/showLongTerm1";
		}
		else if(request.getRequestURI().equals("/PGHOSTEL/loginFilter"))
		{
			return "redirect:/showFilter1";
		}
		else
		{
			return "redirect:/showHome1";
		}
	}	
	public String readEmail()
	{
		 Properties props = new Properties();		 
	        try {
	            props.load(new FileInputStream(new File("D:\\smtp.properties")));
	            Session session = Session.getDefaultInstance(props, null);	 
	            Store store = session.getStore("imaps");
	            store.connect("smtp.gmail.com", "mayurandive3@gmail.com", "mayu@1994");	 
	            Folder inbox = store.getFolder("inbox");
	            inbox.open(Folder.READ_ONLY);
	            int messageCount = inbox.getMessageCount();	 
	            Message[] messages = inbox.getMessages();
	            for (int i = 0; i < messages.length; i++) {
	               System.out.println("Mail Subject:- " + messages[i].getSubject());
	                System.out.println("Text: " + messages[i].getContent().toString());
	            	 System.out.println("From: " + messages[i].getFrom()[0]); 
	            	   System.out.println("To: " + messages[i].getDescription());
	            }
	            inbox.close(true);
	            store.close();
	 
	        } catch (Exception e) {
	            e.printStackTrace();
	        }		  
		return null;		
	}	
	

//autofill script





}











