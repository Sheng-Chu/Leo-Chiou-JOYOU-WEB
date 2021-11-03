package joyou.forum.search;

import java.util.Comparator;
import java.util.List;
import java.util.TreeSet;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import joyou.forum.model.ForumBean;



@Repository("myforumDao")
public class ForumsDao {

	Session session;
	DataSource ds;
	private Query<ForumBean> querycontentTitle;
	private Query<ForumBean> queryContent;
//	private Query<ForumBean> querycontentType;
	private Query<ForumBean> querymemberNickName;
	
	public ForumsDao() {
	}
	
	public ForumsDao(Session session) {
		this.session = session;
	}
	
	//輸入的搜尋字串到資料庫抓出文章結果list
	public List<ForumBean> getContentListToJSON(String searchInputTxt)  {
		System.out.println("8888866666");
		Boolean contain = searchInputTxt.contains(" ");
		if(contain) {
			searchInputTxt = searchInputTxt.replace(" ","%");
		}else {
		}	
		
		//搜標題
		querycontentTitle = session.createQuery
				(" FROM ForumBean where contentTitle like :name ",ForumBean.class);
		
		querycontentTitle.setParameter("name","%"+searchInputTxt+"%");
		
		List<ForumBean> SearchContentResultList1 = querycontentTitle.list();
		//搜內文
		queryContent = session.createQuery
				(" FROM ForumBean where Content like :name ",ForumBean.class);

		queryContent.setParameter("name","%"+searchInputTxt+"%");
		
		List<ForumBean> SearchContentResultList2 = queryContent.list();
		//搜文章類型
//		querycontentType = session.createQuery
//				(" FROM ForumBean where contentType like :name ",ForumBean.class);
//		
//		querycontentType.setParameter("name","%"+searchInputTxt+"%");
//		
//		List<ForumBean> SearchContentResultList3 = querycontentType.list();
		
		
		//搜作者名稱
		querymemberNickName = session.createQuery
				(" FROM ForumBean where memberNickName like :name ",ForumBean.class);
		
		querymemberNickName.setParameter("name","%"+searchInputTxt+"%");
		
		List<ForumBean> SearchContentResultList4 = querymemberNickName.list();
		
		
		
		Comparator<ForumBean> c=Comparator.comparing(ForumBean::getContentId);

		List<ForumBean> result = Stream.concat(SearchContentResultList1.stream(), SearchContentResultList2.stream())
		        .filter(new TreeSet<>(c)::add)
		        .collect(Collectors.toList());
//		List<ForumBean> result1 = Stream.concat(result.stream(), SearchContentResultList3.stream())
//				.filter(new TreeSet<>(c)::add)
//				.collect(Collectors.toList());
		List<ForumBean> result2 = Stream.concat(result.stream(), SearchContentResultList4.stream())
				.filter(new TreeSet<>(c)::add)
				.collect(Collectors.toList());
		
		return result2;
	}
	
	
}
