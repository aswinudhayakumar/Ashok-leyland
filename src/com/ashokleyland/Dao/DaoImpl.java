package com.ashokleyland.Dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ashokleyland.model.Admin;
import com.ashokleyland.model.Ceo;
import com.ashokleyland.model.Labour;
import com.ashokleyland.model.Manager;
import com.ashokleyland.model.Stationentry;
import com.ashokleyland.model.Supervisor;

@Repository
public class DaoImpl implements DaoInterface{
	
	@Autowired
	HttpSession ses;
	
	@Autowired
	SessionFactory fact;

	@Override
	@Transactional
	public boolean checkadmin(String email, String pass) {
		Session session = fact.getCurrentSession();
		List<Admin> res = session.createQuery("from Admin s where s.email ='"+email+"' and s.password = '"+pass+"'").list();
		if(res.size() > 0) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	@Transactional
	public List<Labour> labourlogin(String email, String pass) {
		Session session = fact.getCurrentSession();
		List<Labour> res = session.createQuery("from Labour s where s.email ='"+email+"' and s.password = '"+pass+"'").list();
		return res;
	}

	@Override
	@Transactional
	public List<Supervisor> supervisorlogin(String email, String pass) {
		Session session = fact.getCurrentSession();
		List<Supervisor> res = session.createQuery("from Supervisor s where s.email ='"+email+"' and s.password = '"+pass+"'").list();
		return res;
	}

	@Override
	@Transactional
	public List<Manager> managerlogin(String email, String pass) {
		Session session = fact.getCurrentSession();
		List<Manager> res = session.createQuery("from Manager s where s.email ='"+email+"' and s.password = '"+pass+"'").list();
		return res;
	}

	@Override
	@Transactional
	public List<Ceo> ceologin(String email, String pass) {
		Session session = fact.getCurrentSession();
		List<Ceo> res = session.createQuery("from Ceo s where s.email ='"+email+"' and s.password = '"+pass+"'").list();
		return res;
	}

	@Override
	@Transactional
	public boolean checkmail(String email, String category) {
		Session session = fact.getCurrentSession();
		
		if(category.equals("labour")) {
			List<Labour> temp = session.createQuery("from Labour s where s.email = '"+ email +"'").list();
			if(temp.size() > 0) {
				return true;
			}
		}
		else if(category.equals("supervisor")) {
			List<Supervisor> temp = session.createQuery("from Supervisor s where s.email = '"+ email +"'").list();
			if(temp.size() > 0) {
				return true;
			}
		}
		else if(category.equals("manager")) {
			List<Manager> temp = session.createQuery("from Manager s where s.email = '"+ email +"'").list();
			if(temp.size() > 0) {
				return true;
			}
		}
		else if(category.equals("ceo")) {
			List<Ceo> temp = session.createQuery("from ceo s where s.email = '"+ email +"'").list();
			if(temp.size() > 0) {
				return true;
			}
		}
		
		return false;
	}

	@Override
	@Transactional
	public void addlabour(Labour lab) {
		Session session = fact.getCurrentSession();
		session.save(lab);		
	}

	@Override
	@Transactional
	public void addsupervisor(Supervisor sup) {
		Session session = fact.getCurrentSession();
		session.save(sup);		
	}

	@Override
	@Transactional
	public void addmanager(Manager man) {
		Session session = fact.getCurrentSession();
		session.save(man);	
	}

	@Override
	@Transactional
	public void addceo(Ceo ceo) {
		Session session = fact.getCurrentSession();
		session.save(ceo);	
	}

	@Override
	@Transactional
	public List<Labour> getAllLabour() {
		Session session = fact.getCurrentSession();
		List<Labour> temp = session.createQuery("from Labour").list();
		return temp;
	}

	@Override
	@Transactional
	public List<Supervisor> getAllSupervisor() {
		Session session = fact.getCurrentSession();
		List<Supervisor> temp = session.createQuery("from Supervisor").list();
		return temp;
	}

	@Override
	@Transactional
	public List<Manager> getAllManager() {
		Session session = fact.getCurrentSession();
		List<Manager> temp = session.createQuery("from Manager").list();
		return temp;
	}

	@Override
	@Transactional
	public List<Ceo> getAllCeo() {
		Session session = fact.getCurrentSession();
		List<Ceo> temp = session.createQuery("from Ceo").list();
		return temp;
	}

	@Override
	@Transactional
	public void addStationentry(Stationentry temp) {
		Session session = fact.getCurrentSession();
		session.save(temp);
	}

	@Override
	@Transactional
	public void reset(String uid, String utype) {
		Session session = fact.getCurrentSession();
		int id = Integer.parseInt(uid);
		if(utype.equals("labour")) {
			Labour a = session.get(Labour.class, id);
			String email = a.getEmail();
			a.setPassword(email);
		}
		if(utype.equals("manager")) {
			Manager a = session.get(Manager.class, id);
			String email = a.getEmail();
			a.setPassword(email);
		}
		if(utype.equals("supervisor")) {
			Supervisor a = session.get(Supervisor.class, id);
			String email = a.getEmail();
			a.setPassword(email);
		}
		if(utype.equals("ceo")) {
			Ceo a = session.get(Ceo.class, id);
			String email = a.getEmail();
			a.setPassword(email);
		}
		
	}

	@Override
	@Transactional
	public boolean checkpass(String cpass, String type) {
		Session session = fact.getCurrentSession();
		int id = 1;		
		if(id != 0) {
		if(type.equals("labour")) {
			String x = (String) ses.getAttribute("lab_id");
			if(x != null) {
				id = Integer.parseInt(x);
				System.out.println(id+" dao");
			}
			List<Labour> lab = session.createQuery("from Labour s where s.id = "+id+" and s.password ='"+cpass+"'").list();
			System.out.println(lab + " " +id);
			if(lab.size() > 0) {
				return true;
			}
			else {
				return false;
			}
		}
		if(type.equals("manager")) {
			String x = (String) ses.getAttribute("sup_id");
			if(x != null) {
				id = Integer.parseInt(x);
				System.out.println(id+" dao");
			}
			List<Manager> lab = session.createQuery("from Manager s where s.id = "+id+" and s.password ='"+cpass+"'").list();
			if(lab.size() > 0) {
				return true;
			}
			else {
				return false;
			}
		}
		if(type.equals("supervisor")) {
			String x = (String) ses.getAttribute("sup_id");
			if(x != null) {
				id = Integer.parseInt(x);
				System.out.println(id+" dao");
			}
			List<Supervisor> lab = session.createQuery("from Supervisor s where s.id = "+id+" and s.password ='"+cpass+"'").list();
			if(lab.size() > 0) {
				return true;
			}
			else {
				return false;
			}
		}
		if(type.equals("ceo")) {
			List<Ceo> lab = session.createQuery("from Ceo s where s.id = "+id+" and s.password ='"+cpass+"'").list();
			if(lab.size() > 0) {
				return true;
			}
			else {
				return false;
			}
		}
	}
		return false;
	}

	@Override
	@Transactional
	public void uppass(String npass, String type) {
		Session session = fact.getCurrentSession();
		
		int id = 0;
		
		System.out.println("into dao");

		if(type.equals("labour")) {
			String x = (String) ses.getAttribute("lab_id");
			if(x != null) {
				id = Integer.parseInt(x);
				System.out.println(id+" dao");
			}
			Labour temp = session.get(Labour.class, id);
			temp.setPassword(npass);
		}
		if(type.equals("manager")) {
			Manager temp = session.get(Manager.class, id);
			temp.setPassword(npass);
		}
		if(type.equals("supervisor")) {
			String x = (String) ses.getAttribute("sup_id");
			if(x != null) {
				id = Integer.parseInt(x);
				System.out.println(id+" dao");
			}
			Supervisor temp = session.get(Supervisor.class, id);
			temp.setPassword(npass);
		}
		if(type.equals("ceo")) {
			Labour temp = session.get(Labour.class, id);
			temp.setPassword(npass);
		}

		
	}

	@Override
	@Transactional
	public List<Stationentry> search(String sql) {
		
		Session session = fact.getCurrentSession();
		List<Stationentry> temp = session.createQuery(sql).list();
		return temp;
		
	}

}
