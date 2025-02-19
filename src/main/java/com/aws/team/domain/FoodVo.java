package com.aws.team.domain;

public class FoodVo {
	
	
	private int foodPk;
	private int user_pk;
	private java.sql.Date selectdate; // 날짜 필드 추가
	private String foodtype;
	private int foodlistPk;
	private String menu;
	private int kcal;
	
	
	// API용 
    private String menuName;  // 메뉴 이름
    private double calorie;  // 칼로리
    private double protein;  // 단백질
    private double fat;      // 지방
    private double carb;     // 탄수화물
    
    
    @Override // 객체의 데이터를 문자열로 출력
    public String toString() {
        return "FoodVo{" +
               "menuName='" + menuName + '\'' +
               ", calorie=" + calorie +
               ", protein=" + protein +
               ", fat=" + fat +
               ", carb=" + carb +
               '}';
    }
	
    
    
	

	public int getUser_pk() {
		return user_pk;
	}
	public void setUser_pk(int user_pk) {
		this.user_pk = user_pk;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public double getCalorie() {
		return calorie;
	}
	public void setCalorie(double calorie) {
		this.calorie = calorie;
	}
	public double getProtein() {
		return protein;
	}
	public void setProtein(double protein) {
		this.protein = protein;
	}
	public double getFat() {
		return fat;
	}
	public void setFat(double fat) {
		this.fat = fat;
	}
	public double getCarb() {
		return carb;
	}
	public void setCarb(double carb) {
		this.carb = carb;
	}
	
	
	
	
	public int getFoodPk() {
		return foodPk;
	}
	public void setFoodPk(int foodPk) {
		this.foodPk = foodPk;
	}
	public int getFoodlistPk() {
		return foodlistPk;
	}
	public void setFoodlistPk(int foodlistPk) {
		this.foodlistPk = foodlistPk;
	}	
    public java.sql.Date getSelectdate() {
        return selectdate;
    }

    public void setSelectdate(java.sql.Date selectdate) {
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
