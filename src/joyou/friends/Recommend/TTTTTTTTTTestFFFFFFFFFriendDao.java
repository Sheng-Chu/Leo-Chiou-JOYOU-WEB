package joyou.friends.Recommend;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import joyou.Members.model.MembersBean;
import joyou.friends.model.FriendsBean;



@Repository("myFriendsRecommendDao")
public class TTTTTTTTTTestFFFFFFFFFriendDao {
	
		Session session;
		DataSource ds = null;
		private Query<MembersBean> query2;
//		private Query<MembersBean> query3;
		private Query<FriendsBean> queryFriendsBean;
//		private Query<MembersBean> queryfinalrecommendfriends;

		public TTTTTTTTTTestFFFFFFFFFriendDao(Session session) {
			this.session = session;
		}

		public TTTTTTTTTTestFFFFFFFFFriendDao() {
		}

		public FriendsRecommendBean insert(FriendsRecommendBean fBean) { // 新增好友關係
			if (fBean != null) {
				session.save(fBean);
				return fBean;
			}
			return null;
		}
		//找出會員所有朋友的ID
		public List<FriendsBean> getAlreadyFriends(int memberID) {
			queryFriendsBean = session.createQuery("FROM FriendsBean WHERE (memberID = :name3) ", FriendsBean.class);
			queryFriendsBean.setParameter("name3",memberID);
			List<FriendsBean> AlreadyFriendsList = queryFriendsBean.getResultList();
			return AlreadyFriendsList;
		}
		//遊戲類別相同的member
		  public List<MembersBean> getSameGameTypeMembers(int TestGameTypeTxt,int memberID,List<FriendsBean> AlreadyFriendsList) {
			   query2 = session.createQuery("FROM MembersBean WHERE (memberPreferGameType = :name2) and (memberID != :name3) order by newid()", MembersBean.class);
			   query2.setParameter("name2",TestGameTypeTxt);
			   query2.setParameter("name3",memberID);
			   List<MembersBean> SearchResultList0 = query2.getResultList();
			   //推薦的ID不能在上面list裡面
			   Iterator<MembersBean> it = SearchResultList0.iterator();
			   while (it.hasNext()){
			    MembersBean mBean = it.next();
			    for(FriendsBean fBean:AlreadyFriendsList) {
			     if(fBean.getFriendId()==mBean.getId()) {
			      it.remove();
			     }
			    }
			   }
			   List<MembersBean> result = new ArrayList<MembersBean>();
			   for(int i=0;i<=2;i++) {
			    Collections.shuffle(SearchResultList0);
			    result.add(SearchResultList0.get(0));
			    SearchResultList0.remove(SearchResultList0.get(0));
			   }
			   return result;
			  }
		
//		public List<MembersBean> getSameGameTypeMembers1(List<MembersBean> SearchResultList) {
//			query3 = session.createQuery("FROM MembersBean order by newid()", MembersBean.class);
//			query3.setMaxResults(3);
//			List<MembersBean> SearchResultList1 = query3.getResultList();
//			
//			return SearchResultList1;
//		}
		//推薦的ID不能在上面list裡面
//		public List<MembersBean> getRecommendFriends(int TestGameTypeTxt,int memberID) {
//			if(SearchResultList.contains()) {
//				SearchResultList.remove(this);
//				for(i=0;i<=AlreadyFriendsList.size();i++)
//					System.out.println(AlreadyFriendsList[i]+",");
//					)
//			}
//			
//			queryfinalrecommendfriends = session.createQuery("FROM MembersBean WHERE (memberPreferGameType = :name2) and (memberID != :name3)", MembersBean.class);
//			queryfinalrecommendfriends.setParameter("name2",TestGameTypeTxt);
//			queryfinalrecommendfriends.setParameter("name3",memberID);
//			queryfinalrecommendfriends.setMaxResults(3);
//			List<MembersBean> SearchResultList = queryfinalrecommendfriends.getResultList();
//			
//			return SearchResultList;
//		}

		
//		public List<MembersBean> getRecommendFriendsWithoutSame(List RecommemdList){
//			for(MembersBean  SearchResultList)
//				if(MembersBean.id )
//					SearchResultList.remove(this);
//			
//		}
		
		
		
//		public List<MembersBean> getRecommendGirlFriends(int RecommendGirlFriend) {
//			query2 = session.createQuery("FROM MembersBean WHERE (memberPreferGameType = :name2) and (membergender = 'F') order by newid()", MembersBean.class);
//			query2.setParameter("name2",RecommendGirlFriend);
//			query2.setMaxResults(3);
//			List<MembersBean> SearchResultList1 = query2.getResultList();
//			
//			return SearchResultList1;
//		}
//		
//		public List<MembersBean> getRecommendBoyFriends(int RecommendBoyFriend) {
//			query2 = session.createQuery("FROM MembersBean WHERE (memberPreferGameType = :name2) and (membergender = 'M') order by newid()", MembersBean.class);
//			query2.setParameter("name2",RecommendBoyFriend);
//			query2.setMaxResults(3);
//			List<MembersBean> SearchResultList2 = query2.getResultList();
//			
//			return SearchResultList2;
//		}
		
		
		
		
}




