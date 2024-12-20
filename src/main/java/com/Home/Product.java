package com.Home;

import java.util.Arrays;

public class Product {
private int id;
private String name;
private double price;
private int available;
private byte[] image;


public Product(int id, String name, double price, int available, byte[]image) {
	super();
	this.id = id;
	this.name = name;
	this.price = price;
	this.available = available;
	this.image = image;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public int getAvailable() {
	return available;
}
public void setAvailable(int available) {
	this.available = available;
}
public byte[] getImage() {
	return image;
}
public void setImage(byte[] image) {
	this.image = image;
}
@Override
public String toString() {
	return "Product [id=" + id + ", name=" + name + ", price=" + price + ", available=" + available + ", image="
			+ Arrays.toString(image) + "]";
}
 
}
