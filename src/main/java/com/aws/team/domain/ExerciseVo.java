package com.aws.team.domain;

public class ExerciseVo {
	
	private int exercise_pk;
	private String selectdate;
	private String clear_yn;
	private int hour;
	private int minute;
	private int user_pk;
	private int detail_pk;
	
	public int getExercise_pk() {
		return exercise_pk;
	}
	public void setExercise_pk(int exercise_pk) {
		this.exercise_pk = exercise_pk;
	}
	public String getSelectdate() {
		return selectdate;
	}
	public void setSelectdate(String selectdate) {
		this.selectdate = selectdate;
	}
	public String getClear_yn() {
		return clear_yn;
	}
	public void setClear_yn(String clear_yn) {
		this.clear_yn = clear_yn;
	}
	public int getHour() {
		return hour;
	}
	public void setHour(int hour) {
		this.hour = hour;
	}
	public int getMinute() {
		return minute;
	}
	public void setMinute(int minute) {
		this.minute = minute;
	}
	public int getUser_pk() {
		return user_pk;
	}
	public void setUser_pk(int user_pk) {
		this.user_pk = user_pk;
	}
	public int getDetail_pk() {
		return detail_pk;
	}
	public void setDetail_pk(int detail_pk) {
		this.detail_pk = detail_pk;
	}
}
