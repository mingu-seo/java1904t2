package manage.reserve;

import java.sql.Timestamp;
import util.Parameter;

public class ReserveVO extends Parameter {
	
	private int no;
	private int member_pk;
	private int doctor_pk;
	private int route;
	private int res_hour;
	private String res_date;
	private String doctor_name;
	private int doctor_department;
	private String name;
	private String tel1;
	private String tel2;
	private String tel3;
	private String res_contents;
	
	public ReserveVO() {
		super.setPageRows(10);
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMember_pk() {
		return member_pk;
	}

	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}

	public int getDoctor_pk() {
		return doctor_pk;
	}

	public void setDoctor_pk(int doctor_pk) {
		this.doctor_pk = doctor_pk;
	}

	public int getRoute() {
		return route;
	}

	public void setRoute(int route) {
		this.route = route;
	}


	public int getRes_hour() {
		return res_hour;
	}

	public void setRes_hour(int res_hour) {
		this.res_hour = res_hour;
	}


	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public String getDoctor_name() {
		return doctor_name;
	}

	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}


	public int getDoctor_department() {
		return doctor_department;
	}

	public void setDoctor_department(int doctor_department) {
		this.doctor_department = doctor_department;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}


	public String getRes_contents() {
		return res_contents;
	}

	public void setRes_contents(String res_contents) {
		this.res_contents = res_contents;
	}
	
}
