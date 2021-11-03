package joyou.Shopping;
import java.util.*;
import joyou.Orders.model.OrderItemBean;


public class ShoppingCart {
  
	private Map<Integer, OrderItemBean> cart = new LinkedHashMap< >();
	
	public ShoppingCart() {
	}
	
	public Map<Integer, OrderItemBean>  getContent() { // ${ShoppingCart.content}
		return cart;
	}
	
	public void addToCart(int productId, OrderItemBean  oi) {
		if (oi.getOrderitemQty() <= 0 ) {
			return;
		}
		if ( cart.get(productId) == null ) {
		    cart.put(productId, oi);
		} else {
			OrderItemBean oib = cart.get(productId);		
			oib.setOrderitemQty(oi.getOrderitemQty() + oib.getOrderitemQty());
			oib.setTotalPrice(oib.getOrderitemQty()*oib.getProductPrice());
		}
	}

	public boolean modifyQty(int productId, int  newQty) {
		if ( cart.get(productId) != null ) {
			OrderItemBean  oi = cart.get(productId);
		   oi.setOrderitemQty(newQty);
		   Integer price = oi.getProductPrice();
		   int newTotal = price*newQty;
		   oi.setTotalPrice(newTotal);
	       return true;
		} else {
		   return false;
		}
	}
	
	
	
	// 刪除某項商品
	public int deleteBook(int productId) {
		if ( cart.get(productId) != null ) {
	       cart.remove(productId);  // Map介面的remove()方法
	       return 1;
		} else {
		   return 0;
		}
	}
	public int getItemNumber(){   // ShoppingCart.itemNumber
		return cart.size();
	}
	
	//計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)
	public Integer getSubtotal(){
		int subTotal=0;
		Set<Integer> set = cart.keySet();
		for(int n : set){
			Integer price    = cart.get(n).getProductPrice();
			int    qty      = cart.get(n).getOrderitemQty();
			subTotal +=  price * qty;
		}
		return subTotal;
	}
	
	
	public Integer getNewSubtotal(int Total,int Amount) {
		
		int newsubTotal = Total-Amount;
		return newsubTotal;
		
	}
	
	
	public void listCart() {
		Set<Integer> set = cart.keySet();
		for(Integer k : set){
			System.out.printf("BookID=%3d,  Qty=%3d,  price=%5.2f,  discount=%6.2f\n" , k , cart.get(k).getOrderitemQty(), cart.get(k).getProductPrice());
		}
		System.out.println("------------------");
	}
}
