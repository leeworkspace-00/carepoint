package com.aws.team.domain;

public class TodoVo {
	
	private int todo_pk;
	private String selectdate;
	private String content;
	private int num;
	private String check_yn;
	private int user_pk;
	
	public int getTodo_pk() {
		return todo_pk;
	}
	public void setTodo_pk(int todo_pk) {
		this.todo_pk = todo_pk;
	}
	public String getSelectdate() {
		return selectdate;
	}
	public void setSelectdate(String selectdate) {
		this.selectdate = selectdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCheck_yn() {
		return check_yn;
	}
	public void setCheck_yn(String check_yn) {
		this.check_yn = check_yn;
	}
	public int getUser_pk() {
		return user_pk;
	}
	public void setUser_pk(int user_pk) {
		this.user_pk = user_pk;
	}
}
