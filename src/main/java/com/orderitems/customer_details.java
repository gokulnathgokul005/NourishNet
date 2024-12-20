package com.orderitems;

public class customer_details {
	 public String customer_name;;
	 public String customer_email;;
	 public String customer_address;
	 public String customer_phno;
	 public String itemname;
	 int item_id;
	 int itemprice;
	 int itemquantity;
	 byte[]itemimg;
	 
	 public customer_details(String customer_name, String customer_email, String customer_address, String customer_phno,
			String itemname, int item_id, int itemprice, int itemquantity, byte[] itemimg) {
		super();
		this.customer_name = customer_name;
		this.customer_email = customer_email;
		this.customer_address = customer_address;
		this.customer_phno = customer_phno;
		this.itemname = itemname;
		this.item_id = item_id;
		this.itemprice = itemprice;
		this.itemquantity = itemquantity;
		this.itemimg = itemimg;
	}
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public String getCustomer_address() {
		return customer_address;
	}
	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}
	public String getCustomer_phno() {
		return customer_phno;
	}
	public void setCustomer_phno(String customer_phno) {
		this.customer_phno = customer_phno;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public int getItemprice() {
		return itemprice;
	}
	public void setItemprice(int itemprice) {
		this.itemprice = itemprice;
	}
	public int getItemquantity() {
		return itemquantity;
	}
	public void setItemquantity(int itemquantity) {
		this.itemquantity = itemquantity;
	}
	public byte[] getItemimg() {
		return itemimg;
	}
	public void setItemimg(byte[] itemimg) {
		this.itemimg = itemimg;
	}
	 
}
