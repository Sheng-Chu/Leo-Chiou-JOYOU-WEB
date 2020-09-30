package joyou.Discounts.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Discounts")
public class DiscountsBean {
	Integer discountId;
	String code ;
	String amount ;
	String condition;
	
	
	public DiscountsBean() {
		
	}
	
	public DiscountsBean(String code,String amount,String condition) {
		this.code=code;
		this.amount=amount;
		this.condition=condition;
	}
	
	
	
	@Id
	@Column(name="discountid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getDicountId() {
		return discountId;
	}
	
	
	public void setDicountId(Integer dicountId) {
		this.discountId = dicountId;
	}
	
	@Column(name="code")
	public String getCode() {
		return code;
	}
	
	
	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name="amount")
	public String getAmount() {
		return amount;
	}
	
	
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	
	@Column(name="condition")
	public String getCondition() {
		return condition;
	}
	
	
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	
}
