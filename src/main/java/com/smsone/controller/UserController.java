
package com.smsone.controller;

import java.io.IOException;

import java.util.Date;
import java.util.UUID;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
		String link="http://localhost:2018/PGHOSTEL/emailVerify"+"?hashcode="+hashcode+"&email="+email;
		user.setHashcode(hashcode);
		user.setUserCreation_date(date);
		userService.saveUser(user);		
		SimpleMailMessage simpleMailMessage=new SimpleMailMessage();
		simpleMailMessage.setTo(email);
		simpleMailMessage.setSubject(" Divastays Email Verification Link");
		simpleMailMessage.setText("Thank You For Your Interest..\r\n"+ "Your account"+" " +email+" " +"will be activated..\r\n"+" Please click on the below link.\r\n\r\n"+" "+link);
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
		return "redirect:/showHome";
	}

	@RequestMapping(value = "/emailExpirePopup",method = RequestMethod.POST)
	public String userExpirePopup(@RequestParam("email") String email)
	{
		User user=new User();
		user.setEmail(email);
		user=userService.sendNewLink(user);
		return "redirect:/showHome";
	}
	@RequestMapping(value = "/showUserReg")
	public String showUserRegistration()
	{
		return "userRegistration";
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
		simpleMailMessage.setFrom("swapnildesai162@gmail.com");
		simpleMailMessage.setSubject("for contact us");
		simpleMailMessage.setText("first name:"+firstName+" email:"+email+" phoneNumber:"+phoneNumber+" message:"+message);
		mailSender.send(simpleMailMessage);
		return "redirect:/showHome";
	}
	//login check
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("email") String email,@RequestParam("password") String password,HttpSession session,Model model,HttpServletResponse response)
	{
		//String msg=null;
		User user=new User();
		user.setEmail(email);
		user.setPassword(password);
		user=userService.checkLogin(user);
		if(user==null)
		{
			session.setAttribute("invalid", "invalid");
		}
		else
		{
			String email1=user.getEmail();
			session.setAttribute("email", email1);
			session.setAttribute("user",user);
		}
		return "redirect:/showHome";
	}
	//filter page login check
	@RequestMapping(value = "/loginFilter", method = RequestMethod.POST)
	public String loginFilter(@RequestParam("email") String email,@RequestParam("password") String password,HttpSession session,Model model,HttpServletResponse response)
	{
		//String msg=null;
		User user=new User();
		user.setEmail(email);
		user.setPassword(password);

		user=userService.checkLogin(user);

		if(user==null)
		{
			session.setAttribute("invalid", "invalid");
		}
		else
		{
			String email1=user.getEmail();
			session.setAttribute("email", email1);
			session.setAttribute("user",user);
		}
		return "redirect:/showFilter";

	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("User");
		session.removeAttribute("email");
		session.invalidate();
		return "redirect:/showHome";
	}	
}				






