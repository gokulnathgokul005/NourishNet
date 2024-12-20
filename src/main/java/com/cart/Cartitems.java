package com.cart;
public class Cartitems {
	
	public int cartItemId;
	public String itemname;
	public int itemquantity;
	public int itemprice;
	public byte[]itemimage;
	
	public Cartitems(int cartItemId,String itemname, int itemquantity, int itemprice, byte[] itemimage) {
		this.cartItemId=cartItemId;
		this.itemname = itemname;
		this.itemquantity = itemquantity;
		this.itemprice = itemprice;
		this.itemimage = itemimage;
	}
	
	public int getCartItemId() {
		return cartItemId;
	}

	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getItemname()
	{
		return itemname;
	}
	public int getItemquantity() {
		return itemquantity;
	}
	public void setItemquantity(int itemquantity) {
		this.itemquantity = itemquantity;
	}
	public int getItemprice() {
		return itemprice;
	}
	public void setItemprice(int itemprice) {
		this.itemprice = itemprice;
	}
	public byte[] getItemimage() {
		return itemimage;
	}
	public void setItemimage(byte[] itemimage) {
		this.itemimage = itemimage;
	}
	
}