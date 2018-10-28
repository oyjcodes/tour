package jx.tour.pojo;


public class SpecialtycommentVo extends Spcomment {
	//特产区域
	private Integer areanum;
	private String username;//用户名
    private String tname;//特产名

	public Integer getAreanum() {
		return areanum;
	}

	public void setAreanum(Integer areanum) {
		this.areanum = areanum;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}
}