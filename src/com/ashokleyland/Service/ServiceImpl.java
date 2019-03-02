package com.ashokleyland.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ashokleyland.Dao.DaoInterface;
import com.ashokleyland.model.Ceo;
import com.ashokleyland.model.Labour;
import com.ashokleyland.model.Manager;
import com.ashokleyland.model.Stationentry;
import com.ashokleyland.model.Supervisor;

@Service
public class ServiceImpl implements ServiceInterface{
	
	@Autowired
	HttpSession session;
	
	@Autowired
	DaoInterface dao;
	
	@Override
	public boolean checkadmin(String email, String pass) {
		boolean res = dao.checkadmin(email, pass);
		return res;
	}

	@Override
	public List<Labour> labourlogin(String email, String pass) {
		List<Labour> res = dao.labourlogin(email, pass);
		return res;
	}

	@Override
	public List<Supervisor> supervisorlogin(String email, String pass) {
		List<Supervisor> res = dao.supervisorlogin(email, pass);
		return res;
	}

	@Override
	public List<Manager> managerlogin(String email, String pass) {
		List<Manager> res = dao.managerlogin(email, pass);	
		return res;
	}

	@Override
	public List<Ceo> ceologin(String email, String pass) {
		List<Ceo> res = dao.ceologin(email, pass);	
		return res;
	}

	@Override
	public boolean checkmail(String email, String category) {
		boolean res = dao.checkmail(email, category);
		return res;
	}

	@Override
	public void addlabour(Labour lab) {
		dao.addlabour(lab);
	}

	@Override
	public void addsupervisor(Supervisor sup) {
		dao.addsupervisor(sup);
	}

	@Override
	public void addmanager(Manager man) {
		dao.addmanager(man);
	}

	@Override
	public void addceo(Ceo ceo) {
		dao.addceo(ceo);
	}

	@Override
	public List<Labour> getAllLabour() {
		return dao.getAllLabour();
	}

	@Override
	public List<Supervisor> getAllSupervisor() {
		return dao.getAllSupervisor();
	}

	@Override
	public List<Manager> getAllManager() {
		return dao.getAllManager();
	}

	@Override
	public List<Ceo> getAllCeo() {
		return dao.getAllCeo();
	}

	@Override
	public void addStationentry(Stationentry temp) {
		dao.addStationentry(temp);
		
	}

	@Override
	public void reset(String uid, String utype) {
		dao.reset(uid, utype);
		
	}

	@Override
	public boolean checkpass(String cpass, String type) {
		System.out.println("into service");
		return dao.checkpass(cpass, type);
	}

	@Override
	public void uppass(String npass, String type) {
		dao.uppass(npass, type);
	}

	@Override
	public List<Stationentry> search(String fdate, String tdate, String station, String shift) throws ParseException {
		
		String type = (String) session.getAttribute("type");
		if(type == null) {
			type = "";
		}
		
		String sql = "from Stationentry s where s.id >0 ";
		
		if(!type.equals("labour")) {
			
			if(fdate.equals("") && tdate.equals("")) {
				
				if(station.equals("Any") && shift.equals("Any")) {
					
				}
				else if(!station.equals("Any") && shift.equals("Any")) {
					sql = sql + "and s.station = '"+station+"'";
				}
				else if(station.equals("Any") && !shift.equals("Any")) {
					sql = sql + "and s.shift = '"+shift+"'";
				}
				else {
					sql = sql + "and s.station = '"+station+"' and s.shift = '"+shift+"'";
				}
				
			}
			
			else if(!fdate.equals("") && tdate.equals("")) {
		
				
				DateFormat sourceFormat = new SimpleDateFormat("dd/MM/yyyy");
				Date from = sourceFormat.parse(fdate);
				
				if(station.equals("Any") && shift.equals("Any")) {
					sql = sql + "and date >= "+from+"";
				}
				else if(!station.equals("Any") && shift.equals("Any")) {
					sql = sql + "and s.station = '"+station+"' and date >= "+from+"";
				}
				else if(station.equals("Any") && !shift.equals("Any")) {
					sql = sql + "and s.shift = '"+shift+"' and date >= "+from+"";
				}
				else {
					sql = sql + "and s.station = '"+station+"' and s.shift = '"+shift+"' and date >= "+from+"";
				}
				
			}
			
			else if(fdate.equals("") && !tdate.equals("")) {
				
				DateFormat sourceFormat = new SimpleDateFormat("dd/MM/yyyy");
				Date to = sourceFormat.parse(tdate);
				
				if(station.equals("Any") && shift.equals("Any")) {
					sql = sql + "and date <= "+to+"";
				}
				else if(!station.equals("Any") && shift.equals("Any")) {
					sql = sql + "and s.station = '"+station+"' and date <= "+to+"";
				}
				else if(station.equals("Any") && !shift.equals("Any")) {
					sql = sql + "and s.shift = '"+shift+"' and date <= "+to+"";
				}
				else {
					sql = sql + "and s.station = '"+station+"' and s.shift = '"+shift+"' and date <= "+to+"";
				}
				
			}
			
			else{
				
				DateFormat sourceFormat = new SimpleDateFormat("dd/MM/yyyy");
				Date from = sourceFormat.parse(fdate);
				Date to = sourceFormat.parse(tdate);
							
				if(station.equals("Any") && shift.equals("Any")) {
					sql = sql + "and date >= "+from+" and date <= "+to+"";
				}
				else if(!station.equals("Any") && shift.equals("Any")) {
					sql = sql + "and s.station = '"+station+"' and date >= "+from+" and date <= "+to+"";;
				}
				else if(station.equals("Any") && !shift.equals("Any")) {
					sql = sql + "and s.shift = '"+shift+"' and date >= "+from+" and date <= "+to+"";
				}
				else {
					sql = sql + "and s.station = '"+station+"' and s.shift = '"+shift+"' and date >= "+from+" and date <= "+to+"";
				}
				
			}
		}
		
		else {
			
			String user = (String) session.getAttribute("lab-name");
			if(user == null) {
				user = "";
			}
			
			if(fdate.equals("") && tdate.equals("")) {
				
				if(station.equals("Any") && shift.equals("Any")) {
					sql = sql + "and s.enteredby = '"+user+"'";
				}
				else if(!station.equals("Any") && shift.equals("Any")) {
					sql = sql + "and s.station = '"+station+"' and s.enteredby = '"+user+"'";
				}
				else if(station.equals("Any") && !shift.equals("Any")) {
					sql = sql + "and s.shift = '"+shift+"' and s.enteredby = '"+user+"'";
				}
				else {
					sql = sql + "and s.station = '"+station+"' and s.shift = '"+shift+"' and s.enteredby = '"+user+"'";
				}
				
			}
			
			else if(!fdate.equals("") && tdate.equals("")) {
				
				if(station.equals("Any") && shift.equals("Any")) {
					sql = sql + "and date >= '"+fdate+"' and s.enteredby = '"+user+"'";
				}
				else if(!station.equals("Any") && shift.equals("Any")) {
					sql = sql + "and s.station = '"+station+"' and date >= '"+fdate+"' and s.enteredby = '"+user+"'";
				}
				else if(station.equals("Any") && !shift.equals("Any")) {
					sql = sql + "and s.shift = '"+shift+"' and date >= '"+fdate+"' and s.enteredby = '"+user+"'";
				}
				else {
					sql = sql + "and s.station = '"+station+"' and s.shift = '"+shift+"' and date >= '"+fdate+"' and s.enteredby = '"+user+"'";
				}
				
			}
			
			else if(fdate.equals("") && !tdate.equals("")) {
				
				if(station.equals("Any") && shift.equals("Any")) {
					sql = sql + "and date <= '"+tdate+"' and s.enteredby = '"+user+"'";
				}
				else if(!station.equals("Any") && shift.equals("Any")) {
					sql = sql + "and s.station = '"+station+"' and date <= '"+tdate+"' and s.enteredby = '"+user+"'";
				}
				else if(station.equals("Any") && !shift.equals("Any")) {
					sql = sql + "and s.shift = '"+shift+"' and date <= '"+tdate+"' and s.enteredby = '"+user+"'";
				}
				else {
					sql = sql + "and s.station = '"+station+"' and s.shift = '"+shift+"' and date <= '"+tdate+"' and s.enteredby = '"+user+"'";
				}
				
			}
			
			else{
				
				if(station.equals("Any") && shift.equals("Any")) {
					sql = sql + "and date >= '"+fdate+"' and date <= '"+tdate+"' and s.enteredby = '"+user+"'";
				}
				else if(!station.equals("Any") && shift.equals("Any")) {
					sql = sql + "and s.station = '"+station+"' and date >= '"+fdate+"' and date <= '"+tdate+"' and s.enteredby = '"+user+"'";
				}
				else if(station.equals("Any") && !shift.equals("Any")) {
					sql = sql + "and s.shift = '"+shift+"' and date >= '"+fdate+"' and date <= '"+tdate+"' and s.enteredby = '"+user+"'";
				}
				else {
					sql = sql + "and s.station = '"+station+"' and s.shift = '"+shift+"' and date >= '"+fdate+"' and date <= '"+tdate+"' and s.enteredby = '"+user+"'";
				}
				
			}
			
		}
		

		System.out.println(sql);
		List<Stationentry> temp =  dao.search(sql);
		
		for(Stationentry i : temp) {
			System.out.println(i.getId());
		}
		
		return temp;
	}


}
