package com.aws.team.domain;

public class GraphVo {

	private int graph_pk;
	private int weight;
	private int blood_press;
	private int blood_sugar;
	private String writedate;
	private int user_pk;
	
	public int getGraph_pk() {
		return graph_pk;
	}
	public void setGraph_pk(int graph_pk) {
		this.graph_pk = graph_pk;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getBlood_press() {
		return blood_press;
	}
	public void setBlood_press(int blood_press) {
		this.blood_press = blood_press;
	}
	public int getBlood_sugar() {
		return blood_sugar;
	}
	public void setBlood_sugar(int blood_sugar) {
		this.blood_sugar = blood_sugar;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getUser_pk() {
		return user_pk;
	}
	public void setUser_pk(int user_pk) {
		this.user_pk = user_pk;
	}
	
	
}
