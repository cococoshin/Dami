package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("RestaurantDTO")
public class RestaurantDTO {
	String restaurant;
	String phone1;
	String phone2;
	String phone3;
	String addr1;
	String addr2;
	String image;
	String category;
	String price;
	String parking;
	String menu;
	String time;
	String breaktime;
	String mood;
	public RestaurantDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RestaurantDTO(String restaurant, String phone1, String phone2, String phone3, String addr1, String addr2,
			String image, String category, String price, String parking, String menu, String time, String breaktime,
			String mood) {
		super();
		this.restaurant = restaurant;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.image = image;
		this.category = category;
		this.price = price;
		this.parking = parking;
		this.menu = menu;
		this.time = time;
		this.breaktime = breaktime;
		this.mood = mood;
	}
	@Override
	public String toString() {
		return "RestaurantDTO [restaurant=" + restaurant + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3="
				+ phone3 + ", addr1=" + addr1 + ", addr2=" + addr2 + ", image=" + image + ", category=" + category
				+ ", price=" + price + ", parking=" + parking + ", menu=" + menu + ", time=" + time + ", breaktime="
				+ breaktime + ", mood=" + mood + "]";
	}
	public String getRestaurant() {
		return restaurant;
	}
	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getBreaktime() {
		return breaktime;
	}
	public void setBreaktime(String breaktime) {
		this.breaktime = breaktime;
	}
	public String getMood() {
		return mood;
	}
	public void setMood(String mood) {
		this.mood = mood;
	}
	
}
