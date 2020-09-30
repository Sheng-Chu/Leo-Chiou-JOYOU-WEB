package joyou.Shopping.Search;

import java.util.Comparator;
import java.util.List;
import java.util.TreeSet;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import joyou.Products.model.ProductsBean;

@Repository("myProductDao1")
public class ProductsDao1 {
	
	@Autowired
	Session session;
	DataSource ds;
	Integer productId;
	private Query<ProductsBean> query;
	private Query<ProductsBean> query1;
	
	public ProductsDao1() {
	}
	
	public ProductsDao1(Session session) {
		this.session = session;
	}
	
	//搜尋字串到資料庫抓出商品結果list
	public List<ProductsBean> getSearchResultJSON(String searchInputTxt)  {
		
		Boolean contain = searchInputTxt.contains(" ");
		System.out.println(searchInputTxt);
		
		if(contain) {
			searchInputTxt = searchInputTxt.replace(" ","%");
		
		}else {
		
		}	
		//搜尋商品名稱 + 商品簡介
		query = session.createQuery(" FROM ProductsBean where productName like :name",ProductsBean.class);

		query.setParameter("name","%"+searchInputTxt+"%");
		
		List<ProductsBean> SearchResultList = query.list();
		
		
		query1 = session.createQuery(" FROM ProductsBean where productIntro like :name",ProductsBean.class);
		
		query1.setParameter("name","%"+searchInputTxt+"%");
		
		List<ProductsBean> SearchResultList1 = query1.list();
		
		
		Comparator<ProductsBean> c=Comparator.comparing(ProductsBean::getProductId);

		List<ProductsBean> result = Stream.concat(SearchResultList.stream(), SearchResultList1.stream())
		        .filter(new TreeSet<>(c)::add)
		        .collect(Collectors.toList());
		
		
		
		System.out.println("印出RAW資料:"+SearchResultList);
		System.out.println("共有"+SearchResultList.size()+"筆搜尋結果");
		
		return result;
	}
	
	
	
	
	
}
