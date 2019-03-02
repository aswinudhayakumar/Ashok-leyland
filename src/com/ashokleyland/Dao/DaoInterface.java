package com.ashokleyland.Dao;

import java.util.List;

import com.ashokleyland.model.Ceo;
import com.ashokleyland.model.Labour;
import com.ashokleyland.model.Manager;
import com.ashokleyland.model.Stationentry;
import com.ashokleyland.model.Supervisor;

public interface DaoInterface {

	boolean checkadmin(String email, String pass);

	List<Labour> labourlogin(String email, String pass);

	List<Supervisor> supervisorlogin(String email, String pass);

	List<Manager> managerlogin(String email, String pass);

	List<Ceo> ceologin(String email, String pass);

	boolean checkmail(String email, String category);

	void addlabour(Labour lab);

	void addsupervisor(Supervisor sup);

	void addmanager(Manager man);

	void addceo(Ceo ceo);

	List<Labour> getAllLabour();

	List<Supervisor> getAllSupervisor();

	List<Manager> getAllManager();

	List<Ceo> getAllCeo();

	void addStationentry(Stationentry temp);

	void reset(String uid, String utype);

	boolean checkpass(String cpass, String type);

	void uppass(String npass, String type);

	List<Stationentry> search(String sql);


}
