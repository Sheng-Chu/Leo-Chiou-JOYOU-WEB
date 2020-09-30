package joyou.Orders.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import joyou.Orders.model.OrderItemBean;


@Repository("myOrderItemDao")
public class OrderItemDao {
	Session session;
	
	public OrderItemDao() {
	}
	
	public OrderItemDao(Session session) {
		this.session=session;
	}
	
	public OrderItemBean insert(OrderItemBean oBean) { // 新增
		if (oBean != null) {
			session.save(oBean);
			return oBean;
		}
		return null;
	}
	
	public List<OrderItemBean> selectAll() { // 查詢
		Query<OrderItemBean> query = session.createQuery("from OrderItemBean", OrderItemBean.class);
		return query.list();
	}
	
	
	public boolean delete(int orderId) { // 刪除
		OrderItemBean oBean = session.get(OrderItemBean.class, orderId);
		if (oBean != null) {
			session.delete(oBean);
			return true;
		}
		return false;
	}
	
	
	public List<OrderItemBean> selectByOrderId(int orderId){  //依訂單ID查詢
		Query<OrderItemBean> query = session.createQuery("from OrderItemBean where orderId=:id", OrderItemBean.class);
		query.setParameter("id", orderId);	
		List<OrderItemBean> list = query.list();
		return list;
		
	}
}
