package joyou.Orders.model;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

@Entity
@Table(name="OrderItem")
public class OrderItemBean {
	@Id
	@Column(name="orderitemid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Expose
	Integer orderitemId;
//	Integer orderId;
	@Expose
	Integer productId;
	@Expose
	String productName;
	@Expose
	Integer productPrice;
	@Expose
	String productLang;
	@Expose
	Integer orderitemQty;
	@Expose
	Integer totalPrice;
	@Expose
	String imgName;
	

	@ManyToOne
	@JoinColumn(name = "orderId")
	OrdersBean ordersBean;
	
	
	public OrderItemBean() {
	}
	
	public OrderItemBean(Integer productId,String productName,Integer productPrice,String productLang,
	Integer orderitemQty,Integer totalPrice,String imgName) {
		this.productId=productId;
		this.productName=productName;
		this.productPrice=productPrice;
		this.productLang=productLang;
		this.orderitemQty=orderitemQty;
		this.totalPrice=totalPrice;
		this.imgName=imgName;
	}
	


	public Integer getOrderitemId() {
		return orderitemId;
	}
	
	public void setOrderitemId(Integer orderitemId) {
		this.orderitemId = orderitemId;
	}
	
	
	public Integer getProductId() {
		return productId;
	}
	
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	
	
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	
	public Integer getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}
	
	
	public String getProductLang() {
		return productLang;
	}
	
	public void setProductLang(String productLang) {
		this.productLang = productLang;
	}
	
	
	public Integer getOrderitemQty() {
		return orderitemQty;
	}
	
	public void setOrderitemQty(Integer orderitemQty) {
		this.orderitemQty = orderitemQty;
	}
	
	
	public Integer getTotalPrice() {
		return totalPrice;
	}
	
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}


	public OrdersBean getOrdersBean() {
		return ordersBean;
	}


	public void setOrdersBean(OrdersBean ordersBean) {
		this.ordersBean = ordersBean;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	
	
	
}
