package com.aws.team.domain;

public class CommentVo {
	private int comment_pk;
	private String content;
	private String delyn;
	private String writedate;
	private String ip;
	private String usernick;
	private int user_pk;
	private int board_pk;
	
	public int getComment_pk() {
		return comment_pk;
	}
	public void setComment_pk(int comment_pk) {
		this.comment_pk = comment_pk;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getUsernick() {
		return usernick;
	}
	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}
	public int getUser_pk() {
		return user_pk;
	}
	public void setUser_pk(int user_pk) {
		this.user_pk = user_pk;
	}
	public int getBoard_pk() {
		return board_pk;
	}
	public void setBoard_pk(int board_pk) {
		this.board_pk = board_pk;
	}
}
