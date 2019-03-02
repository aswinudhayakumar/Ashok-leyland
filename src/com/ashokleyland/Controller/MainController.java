package com.ashokleyland.Controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ashokleyland.Service.ServiceInterface;
import com.ashokleyland.model.Ceo;
import com.ashokleyland.model.Labour;
import com.ashokleyland.model.Manager;
import com.ashokleyland.model.Stationentry;
import com.ashokleyland.model.Supervisor;

@Controller
public class MainController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServiceInterface service;
	
	@RequestMapping("/")
	public String home() {
		session.invalidate();
		return "login";
	}
	
	@RequestMapping("/adminlogin")
	public String adminlogin(Model themodel){
		String email = request.getParameter("admin-email");
		String pass = request.getParameter("admin-pass");
		boolean res = service.checkadmin(email, pass);
		
		if(res == true) {
			session.setAttribute("email", email);
			session.setAttribute("type", "admin");
			return "adminpannel";
		}
		else {
			themodel.addAttribute("error", "true");
			return "login";
		}
		
	}
	
	@RequestMapping("/labourlogin")
	public String labourlogin(Model themodel) {
		String email = request.getParameter("labour-email");
		String pass = request.getParameter("labour-pass");
		List<Labour> res = service.labourlogin(email, pass);
		if(res.size() > 0) {
			for(Labour i:res) {
				session.setAttribute("lab_id",  Integer.toString(i.getId()) );
				session.setAttribute("email", i.getEmail());
				session.setAttribute("lab-name", i.getName());
				session.setAttribute("type", "labour");
			}
			return "labourpannel";
		}
		else {
			System.out.println("error in labour");
			themodel.addAttribute("laborerror", "true");
			return "login";
		}
	}
	
	@RequestMapping("/supervisorlogin")
	public String supervisorlogin(Model themodel) {
		String email = request.getParameter("supervisor-email");
		String pass = request.getParameter("supervisor-pass");
		List<Supervisor> res = service.supervisorlogin(email, pass);
		if(res.size() > 0) {
			for(Supervisor i:res) {
				session.setAttribute("sup_id", Integer.toString(i.getId()));
				session.setAttribute("email", i.getEmail());
				session.setAttribute("type", "supervisor");
				session.setAttribute("name", i.getName());
			}
			return "suppannel";
		}
		else {
			themodel.addAttribute("supervisorerror", "true");
			return "login";
		}
	}
	
	@RequestMapping("/managerlogin")
	public String managerlogin(Model themodel) {
		String email = request.getParameter("manager-email");
		String pass = request.getParameter("manager-pass");
		List<Manager> res = service.managerlogin(email, pass);
		if(res.size() > 0) {
			for(Manager i:res) {
				session.setAttribute("man_id", i.getId());
				session.setAttribute("email", i.getEmail());
				session.setAttribute("name", i.getName());
				session.setAttribute("type", "manager");
			}
			return "managerpannel";
		}
		else {
			themodel.addAttribute("managererror", "true");
			return "login";
		}
	}
	
	@RequestMapping("/ceologin")
	public String ceologin(Model themodel) {
		String email = request.getParameter("ceo-email");
		String pass = request.getParameter("ceo-pass");
		List<Ceo> res = service.ceologin(email, pass);
		if(res.size() > 0) {
			for(Ceo i:res) {
				session.setAttribute("ceo_id", i.getId());
				session.setAttribute("email", i.getEmail());
				session.setAttribute("name", i.getName());
				session.setAttribute("type", "ceo");
			}
			return "ceopannel";
		}
		else {
			themodel.addAttribute("ceoerror", "true");
			return "login";
		}
	}
	
	@RequestMapping("/adminpannel")
	public String adminpannel(){
		String email = (String) session.getAttribute("email");
		String type = (String) session.getAttribute("type");
		if(email != null && type.equals("admin")) {
			return "adminpannel";
		}
		return "redirect:/";
	}
	
	@RequestMapping("/viewuser")
	public String viewuser(){
		String email = (String) session.getAttribute("email");
		String type = (String) session.getAttribute("type");
		if(email != null && type.equals("admin")) {
			return "viewuser";
		}
		return "redirect:/";
	}
	
	@RequestMapping("/createuser")
	public String createlabour(Model themodel) {
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String category = request.getParameter("category");
		boolean checkage = false;
		boolean checkmobile = true;
		boolean mail = service.checkmail(email, category); 
		
		if(mobile.length() == 10) {
			checkmobile = false; 
		}
		
		if(mail == true && checkage == true && checkmobile == true) {
			themodel.addAttribute("mail", "true");
			themodel.addAttribute("age", "true");
			themodel.addAttribute("mobile", "true");
			return "login";
		}
		else if(mail == true && checkage == true && checkmobile == false) {
			themodel.addAttribute("mail", "true");
			themodel.addAttribute("age", "true");
			themodel.addAttribute("mobile", "false");
			return "login";
		}
		else if(mail == true && checkage == false && checkmobile == true) {
			themodel.addAttribute("mail", "true");
			themodel.addAttribute("age", "false");
			themodel.addAttribute("mobile", "true");
			return "login";
		}
		else if(mail == false && checkage == true && checkmobile == true) {
			themodel.addAttribute("mail", "false");
			themodel.addAttribute("age", "true");
			themodel.addAttribute("mobile", "true");
			return "login";
		}
		else if(mail == true && checkage == false && checkmobile == false) {
			themodel.addAttribute("mail", "true");
			themodel.addAttribute("age", "false");
			themodel.addAttribute("mobile", "false");
			return "login";
		}
		else if(mail == false && checkage == true && checkmobile == false) {
			themodel.addAttribute("mail", "false");
			themodel.addAttribute("age", "true");
			themodel.addAttribute("mobile", "false");
			return "login";
		}
		else if(mail == false && checkage == false && checkmobile == true) {
			themodel.addAttribute("mail", "false");
			themodel.addAttribute("age", "false");
			themodel.addAttribute("mobile", "true");
			return "login";
		}
		else if(mail == false && checkage == false && checkmobile == false) {
			themodel.addAttribute("added", "true");
			String pass = email;
			
			if(category.equals("labour")) {
				Labour lab = new Labour(email, name, age, mobile, pass);
				service.addlabour(lab);
			}
			else if(category.equals("supervisor")) {
				Supervisor sup = new Supervisor(email, name, age, mobile, pass);
				service.addsupervisor(sup);
			}
			else if(category.equals("manager")) {
				Manager man = new Manager(email, name, age, mobile, pass);
				service.addmanager(man);
			}
			else if(category.equals("ceo")) {
				Ceo ceo = new Ceo(email, name, age, mobile, pass);
				service.addceo(ceo);
			}
		
			return "adminpannel";
		}
		else {
			return "login";
		}
	}
	
	@RequestMapping("/selectuser")
	public String selectuser(Model themodel) {
		String category = request.getParameter("category");
		if(category.equals("labour")) {
			List<Labour> lab = service.getAllLabour();
			themodel.addAttribute("lablist", lab);
			themodel.addAttribute("type", category);
			return "viewuser";
		}
		else if(category.equals("supervisor")) {
			List<Supervisor> sup = service.getAllSupervisor();
			themodel.addAttribute("suplist", sup);
			themodel.addAttribute("type", category);
			return "viewuser";
		}
		else if(category.equals("manager")) {
			List<Manager> man = service.getAllManager();
			themodel.addAttribute("manlist", man);
			themodel.addAttribute("type", category);
			return "viewuser";
		}
		else {
			List<Ceo> ceo = service.getAllCeo();
			themodel.addAttribute("ceolist", ceo);
			themodel.addAttribute("type", category);
			return "viewuser";
		}
	}
	
	@RequestMapping("/labourpannel")
	public String labourpannel() {
		String email = (String) session.getAttribute("email");
		String type = (String) session.getAttribute("type");
		if(email != null && type.equals("labour")) {
			return "labourpannel";
		}
		else
			return "redirect:/";
	}
	
	@RequestMapping("/addstationdetails")
	public String addstationdetails() throws ParseException {
		String email = (String) session.getAttribute("email");
		String type = (String) session.getAttribute("type");
		if(email != null && type.equals("labour")) {
			
			String station = request.getParameter("station");
			String shift = request.getParameter("shift");
			String count = request.getParameter("count");
			
			String date1 = request.getParameter("fdate");
			
			String description = request.getParameter("desc");
			String enteredby = (String) session.getAttribute("lab-name");
			String uid =  "";
			String fault =  request.getParameter("fault");
			if(session.getAttribute("lab_id") != null) {
				uid = session.getAttribute("lab_id").toString();
			}
			Stationentry temp = new Stationentry(station, date1, shift, count , description, enteredby, uid, fault);
			service.addStationentry(temp);
			return "redirect:/labourpannel";
			
		}
		else
			return "redirect:/";
	}
	
	@RequestMapping("/labview")
	public String labview() {	
		String email = (String) session.getAttribute("email");
		String type = (String) session.getAttribute("type");
		if(email != null && type.equals("labour")) {
			return "labview";
		}
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/reset")
	public String reset(Model themodel) {
		String uid = request.getParameter("uid");
		String utype = request.getParameter("utype");
		service.reset(uid, utype);
		themodel.addAttribute("reset", "true");
		return "viewuser";
	}
	
	@RequestMapping("/changepassword")
	public String changepassword(Model themodel){	
		String email = (String) session.getAttribute("email");
		if(email != null ) {
			return "changepassword";
		}
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/cpassword")
	public String cpassword(Model themodel){
		
		String cpass = request.getParameter("cpass");
		String npass = request.getParameter("npass");
		String type = (String) session.getAttribute("type");
		
		if(service.checkpass(cpass,type) == true) {
			System.out.println("cpass");
			service.uppass(npass, type);
			themodel.addAttribute("change", "true");
			return "login";
		}
		else {
			themodel.addAttribute("change", "false");
			return "changepassword";
		}
	}
	
	@RequestMapping("/search")
	public String search(Model themodel) throws ParseException{
		
		String fdate = request.getParameter("fdate");
		String tdate = request.getParameter("tdate");
		String station = request.getParameter("station");
		String shift = request.getParameter("shift");
		
		List<Stationentry> temp = service.search(fdate, tdate, station, shift);
		themodel.addAttribute("list", temp);
		
		String type = (String) session.getAttribute("type");
		if(type.equals("labour")) {
			return "labview";
		}
		else {
			return "suppannel";
		}
		
	}
	
	@RequestMapping("/suppannel")
	public String suppannel() {
		return "suppannel";
	}
	
	@RequestMapping("/logout")
	public String logout(Model themodel) {
		session.invalidate();
		return "redirect:/";
	}
	
	
}
