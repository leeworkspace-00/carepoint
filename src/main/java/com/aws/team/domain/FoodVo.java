package com.aws.team.domain;

public class FoodVo {
	
	
	private int foodPk;
	private int userPk;
	private String selectdate;
	private String foodtype;
	private int foodlistPk;
	private String menu;
	private int kcal;
	
	
	// api 호출용 
    private String descKor; // 음식 이름
    private String nutrCont1; // 칼로리
    private String nutrCont2; // 탄수화물
    private String nutrCont3; // 단백질
    

	public String getDescKor() {
		return descKor;
	}
	public void setDescKor(String descKor) {
		this.descKor = descKor;
	}
	public String getNutrCont1() {
		return nutrCont1;
	}
	public void setNutrCont1(String nutrCont1) {
		this.nutrCont1 = nutrCont1;
	}
	public String getNutrCont2() {
		return nutrCont2;
	}
	public void setNutrCont2(String nutrCont2) {
		this.nutrCont2 = nutrCont2;
	}
	public String getNutrCont3() {
		return nutrCont3;
	}
	public void setNutrCont3(String nutrCont3) {
		this.nutrCont3 = nutrCont3;
	}
	
	
	
	
	
	
	
	public int getFoodPk() {
		return foodPk;
	}
	public void setFoodPk(int foodPk) {
		this.foodPk = foodPk;
	}
	public int getUserPk() {
		return userPk;
	}
	public void setUserPk(int userPk) {
		this.userPk = userPk;
	}
	public int getFoodlistPk() {
		return foodlistPk;
	}
	public void setFoodlistPk(int foodlistPk) {
		this.foodlistPk = foodlistPk;
	}	
	public String getSelectdate() {
		return selectdate;
	}
	public void setSelectdate(String selectdate) {
		this.selectdate = selectdate;
	}
	public String getFoodtype() {
		return foodtype;
	}
	public void setFoodtype(String foodtype) {
		this.foodtype = foodtype;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getKcal() {
		return kcal;
	}
	public void setKcal(int kcal) {
		this.kcal = kcal;
	}
	
}
