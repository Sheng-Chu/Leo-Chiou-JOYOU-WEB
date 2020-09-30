package joyou.Orders.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import joyou.Orders.model.OrdersBean;
import joyou.Products.model.ProductsBean;


@Repository("myOrdersDao")
public class OrdersDao {
	Session session;
	SessionFactory factory;
	private int totalPages;
	public static final int RECORDS_PER_PAGE = 9;
	
	public OrdersDao() {
	}
	
	public OrdersDao(Session session) {
		this.session=session;
	}

	public OrdersBean insert(OrdersBean oBean) { // 新增
		if (oBean != null) {
			session.save(oBean);
			return oBean;
		}
		return null;
	}
	
	public List<OrdersBean> selectAll() { // 查詢
		Query<OrdersBean> query = session.createQuery("from OrdersBean", OrdersBean.class);
		return query.list();
	}
	
	
	public boolean delete(int orderId) { // 刪除
		OrdersBean oBean = session.get(OrdersBean.class, orderId);
		if (oBean != null) {
			session.delete(oBean);
			return true;
		}
		return false;
	}
	
	
	public OrdersBean update(Integer orderId, String receiver,String receiverPhone,String shippingAddress,String remarks) {
		OrdersBean oBean = session.get(OrdersBean.class, orderId);
		if (oBean != null) {
			oBean.setReceiver(receiver);
			oBean.setReceiverPhone(receiverPhone);
			oBean.setShippingAddress(shippingAddress);
			oBean.setRemarks(remarks);
		}
		return oBean;
	}
	
	
	public OrdersBean selectbyId(Integer orderId) { // 依ID查詢商品
		OrdersBean oBean = session.get(OrdersBean.class, orderId);
		return oBean;
	}
	
	public List<OrdersBean> selectbyMemberId(Integer MemberId) { // 依會員ID查詢商品
		Query<OrdersBean> query = session.createQuery("from OrdersBean where memberId=:mid", OrdersBean.class);
		query.setParameter("mid", MemberId);
		List<OrdersBean> beanList = query.list();
		
		return beanList;
	}
	
	

	
	public List<OrdersBean> selectByPage(int page) {   
		Query<OrdersBean> query = session.createQuery("from OrdersBean", OrdersBean.class);
		List<OrdersBean> beanList = query.list();
		List<OrdersBean> newlist = new ArrayList<>();
		for(int i=9*(page-1);i<=8+9*(page-1)&&i<beanList.size();i++) {
			newlist.add(beanList.get(i));
		}
		return newlist;

	}
	
	public long getRecordCounts() {   //計算商品數量
		long count = 0;
		Query<OrdersBean> query = session.createQuery("from OrdersBean", OrdersBean.class);
		List<OrdersBean> beanList = query.list();
		for (OrdersBean oBean : beanList) {
			count++;
		}
		System.out.println("訂單總數:"+count);
		return count;
	}
	
	public int getTotalPages() {      //計算頁數(無條件進位)
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) RECORDS_PER_PAGE));
		return totalPages;
	}
	
	
	
}
