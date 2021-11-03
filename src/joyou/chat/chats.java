package joyou.chat;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import joyou.Group.model.Groups;
import joyou.util.HibernateUtil;

import java.util.HashSet;
import java.util.Set;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * writer: holien
 * Time: 2017-08-01 13:00
 * Intent: webSocket伺服器
 */
@ServerEndpoint(value ="/webSocket/chat/{roomName}",configurator=GetHttpSessionConfigurator.class)
public class chats {
	 private  HttpSession httpSession;
	String name ; 
	String id ;
	private String nickname;
	Boolean pass = false;
    // 使用map來收集session，key為roomName，value為同一個房間的使用者集合
    // concurrentMap的key不存在時報錯，不是返回null
    private static final Map<String, Set<Session>> rooms = new ConcurrentHashMap();

    @OnOpen
    public void connect(@PathParam("roomName") String roomName, Session session,EndpointConfig config) throws Exception {
        // 將session按照房間名來儲存，將各個房間的使用者隔離
    	SessionFactory factory = HibernateUtil.getSessionFactory();
    	org.hibernate.Session session2 = factory.getCurrentSession();
		Transaction tx=session2.beginTransaction();  
		   httpSession= (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		   	 id =(String) httpSession.getAttribute("memberAccount");
		   	 name = (String) httpSession.getAttribute("memberNickName");
		   	 nickname = name+"("+id+")";
		   	Integer sgroupid = (Integer) httpSession.getAttribute("groupid");
            String hql = "from Groups where groupId=:gid";    
            Groups groups= (Groups)session2.createQuery(hql)
           	        .setParameter("gid", sgroupid)
           	        .uniqueResult();
            session2.getTransaction().commit();
            String sgm = groups.getGroupmember();
            String sgm2 = groups.getGroupname();
            String[] AfterSplit = sgm.split(",");
            for (int i = 0; i < AfterSplit.length; i++) {
                if (AfterSplit[i].equals(id))
                    pass=true;
        } 
        if (!rooms.containsKey(roomName)) {
            // 建立房間不存在時，建立房間
            Set<Session> room = new HashSet<>();
            // 新增使用者	
            
            
 
            if(pass==true) {
           
            room.add(session);
            rooms.put(roomName, room);
            String msg2 = "您好,本聊天室為" + sgm2 +"專用之聊天室";
        	broadcast(roomName, msg2);
            String msg = "歡迎"+nickname +"進入聊天室";
        	broadcast(roomName, msg);
            }else {
//                room.add(session);
//                rooms.put(roomName, room);
//            	String msg = nickname + "您不是該團成員";
//            	broadcast(roomName, msg);
//            	System.out.println("您不是該團成員");
            	rooms.get(roomName).remove(session);
            }
        } else {
            // 房間已存在，直接新增使用者到相應的房間
        	if(pass==true) {
                
        		 rooms.get(roomName).add(session);
                 String msg2 = "您好,本聊天室" + sgm2 +"專用之聊天室";

                 String msg = "歡迎"+nickname +"進入聊天室" ;
              	broadcast(roomName, msg2);
             	broadcast(roomName, msg);
                }else {
//                	String msg = nickname + "您不是該團成員";
//                	broadcast(roomName, msg);
//                	System.out.println("您不是該團成員");
                	rooms.get(roomName).remove(session);
                }
           
        }
        System.out.println("a client has connected!");
     
    }

    @OnClose
    public void disConnect(@PathParam("roomName") String roomName, Session session) throws Exception {
    	if(pass==true) {
    	rooms.get(roomName).remove(session);
        String msg = nickname +"退出聊天室" ;
    	broadcast(roomName, msg);
        System.out.println("a client has disconnected!");
    	}
    }

    @OnMessage
    public void receiveMsg(@PathParam("roomName") String roomName,
                           String msg, Session session) throws Exception {
    	if(pass==true) {
        msg = nickname + ":" + msg;
        System.out.println(msg);
        // 接收到資訊後進行廣播
        broadcast(roomName, msg);
    	}else {
    	}
    }

    // 按照房間名進行廣播
    public static void broadcast(String roomName, String msg) throws Exception {
        for (Session session : rooms.get(roomName)) {
                session.getBasicRemote().sendText(msg);
        }
    }

}