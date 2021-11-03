package joyou.Products.dao;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import joyou.Products.model.ProductsBean;

@Repository("myProductsDao")
public class ProductsDao {
	Session session;
	DataSource ds = null;
	public static final int RECORDS_PER_PAGE = 9;
	private int totalPages;
	

	public ProductsDao(Session session) {
		this.session = session;
	}

	public ProductsDao() {

	}

	public ProductsBean insert(ProductsBean pBean) { // 新增商品
		if (pBean != null) {
			session.save(pBean);
			return pBean;
		}
		return null;
	}

	public ProductsBean selectbyId(Integer productId) { // 依ID查詢商品
		ProductsBean pBean = session.get(ProductsBean.class, productId);
		return pBean;
	}

	public List<ProductsBean> selectAll() { // 查詢全部商品
		Query<ProductsBean> query = session.createQuery("from ProductsBean", ProductsBean.class);
		return query.list();
	}

	
	public ProductsBean updatenoImg(Integer productId, String productName, // 依ID修改商品不含照片。
			Integer productStock, Integer productPrice, Integer gametypeId, String productAge, String productLang,String suggestNum,String productColor,String paintingStyle,String sale,String productIntro) {
		ProductsBean pBean = session.get(ProductsBean.class, productId);
		if (pBean != null) {
			pBean.setProductName(productName);
			pBean.setProductStock(productStock);
			pBean.setProductPrice(productPrice);
			pBean.setGametypeId(gametypeId);
			pBean.setProductAge(productAge);
			pBean.setProductLang(productLang);
			pBean.setSuggestNum(suggestNum);
			pBean.setProductColor(productColor);
			pBean.setPaintingStyle(paintingStyle);
			pBean.setSale(sale);
			pBean.setProductIntro(productIntro);

		}
		return pBean;
	}

	public ProductsBean update(Integer productId, String productName, // 依ID修改商品含照片。
			Integer productStock, Integer productPrice, Integer gametypeId, String productAge, String productLang,
			String imgName, Blob productImg,String suggestNum,String productColor,String paintingStyle,String sale,String productIntro) {

		ProductsBean pBean = session.get(ProductsBean.class, productId);
		if (pBean != null) {
			pBean.setProductName(productName);
			pBean.setProductStock(productStock);
			pBean.setProductPrice(productPrice);
			pBean.setGametypeId(gametypeId);
			pBean.setProductAge(productAge);
			pBean.setProductLang(productLang);
			pBean.setImgName(imgName);
			pBean.setProductImg(productImg);
			pBean.setSuggestNum(suggestNum);
			pBean.setProductColor(productColor);
			pBean.setPaintingStyle(paintingStyle);
			pBean.setSale(sale);
			pBean.setProductIntro(productIntro);
		}
		return pBean;
	}

	public boolean delete(int productId) { // 依ID刪除商品
		ProductsBean pBean = session.get(ProductsBean.class, productId);
		if (pBean != null) {
			session.delete(pBean);
			return true;
		}
		return false;
	}

	public List<ProductsBean> selectByPage(int page) {
		Query<ProductsBean> query = session.createQuery("from ProductsBean", ProductsBean.class);
		List<ProductsBean> beanList = query.list();
		List<ProductsBean> newlist = new ArrayList<>();
		for(int i=9*(page-1);i<=8+9*(page-1)&&i<beanList.size();i++) {
			newlist.add(beanList.get(i));
		}
		return newlist;

	}
  
	public int getTotalPages() {      //計算頁數(無條件進位)
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) RECORDS_PER_PAGE));
		return totalPages;
	}

	public long getRecordCounts() {   //計算商品數量
		long count = 0;
		Query<ProductsBean> query = session.createQuery("from ProductsBean", ProductsBean.class);
		List<ProductsBean> beanList = query.list();
		for (ProductsBean pBean : beanList) {
			count++;
		}
		System.out.println("商品總數:"+count);
		return count;
	}
	
	public List<ProductsBean> selectPriceDesc(int page) {   //價錢由高至低
		Query<ProductsBean> query = session.createQuery("from ProductsBean order by productPrice desc ", ProductsBean.class);
		List<ProductsBean> beanList = query.list();
		List<ProductsBean> newlist = new ArrayList<>();
		for(int i=9*(page-1);i<=8+9*(page-1)&&i<beanList.size();i++) {
			newlist.add(beanList.get(i));
		}
		return newlist;

	}
	
	public List<ProductsBean> selectPriceAsc(int page) {   //價錢由低至高
		Query<ProductsBean> query = session.createQuery("from ProductsBean order by productPrice asc", ProductsBean.class);
		List<ProductsBean> beanList = query.list();
		List<ProductsBean> newlist = new ArrayList<>();
		for(int i=9*(page-1);i<8+9*(page-1)+1&&i<beanList.size();i++) {
			
				newlist.add(beanList.get(i));
		}
		return newlist;

	}
	
	public List<ProductsBean> selectNewProduct(){         //選擇最後三筆
		String sql="select top 3 * from ProductsBean order by productId desc";
		Query<ProductsBean> query = session.createQuery(sql, ProductsBean.class);
		List<ProductsBean> list = query.list();
		return list;
		
	}
	
	
	public List<ProductsBean> selectSaleProduct(){         //選擇特價品
		
		Query<ProductsBean> query = session.createQuery("from ProductsBean where sale=1", ProductsBean.class);
		List<ProductsBean> list = query.list();
		return list;
		
	}
	
	public List<ProductsBean> selectGameType(int gametype){         
		Query<ProductsBean> query = session.createQuery("from ProductsBean where gametypeId=:type", ProductsBean.class);
		query.setParameter("type", gametype);
		List<ProductsBean> list = query.list();
		return list;
		
	}
	
	public boolean checkName(String productName){         
		Query<ProductsBean> query = session.createQuery("from ProductsBean where productName=:name", ProductsBean.class);
		query.setParameter("name", productName);
		if(query.list().isEmpty()) {
			return false;
		}return true;
	}
	
	
	
	public List<ProductsBean> selectSuggest(int gametype){         
		Query<ProductsBean> query = session.createQuery("from ProductsBean where gametypeId=:type", ProductsBean.class);
		query.setParameter("type", gametype);
		List<ProductsBean> list = query.list();
		return list;
		
	}
	
	
	public List<ProductsBean> selectColor(String color){         
		Query<ProductsBean> query = session.createQuery("from ProductsBean where productColor=:type", ProductsBean.class);
		query.setParameter("type", color);
		List<ProductsBean> list = query.list();
		return list;
		
	}
	
	public List<ProductsBean> selectPriceColor(int min,int max){         
		Query<ProductsBean> query = session.createQuery("from ProductsBean where productPrice between :min and :max", ProductsBean.class);
		query.setParameter("min", min);
		query.setParameter("max", max);
		List<ProductsBean> list = query.list();
		return list;
		
	}
	
	
	public List<ProductsBean> selectPainting(String painting){         
		Query<ProductsBean> query = session.createQuery("from ProductsBean where paintingStyle=:painting", ProductsBean.class);
		query.setParameter("painting", painting);
		List<ProductsBean> list = query.list();
		return list;
		
	}
	
	
}
