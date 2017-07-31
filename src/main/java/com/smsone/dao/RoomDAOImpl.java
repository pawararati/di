package com.smsone.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smsone.model.Beds;
import com.smsone.model.House;
import com.smsone.model.Room;
import com.smsone.model.User;
@Repository
public class RoomDAOImpl implements RoomDAO {
	@Autowired
	private SessionFactory sessionFactory;
	//save room
	public void saveRoom(Room room,Long hId) {
		Session session=sessionFactory.openSession();
		House house=(House)session.load(House.class,hId);
		room.setHouse(house);
		session.save(room);
		session.close();
	}
	public void assignBed(User user, Beds beds) {
		Session session=sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		User user1=(User)session.get(User.class,user.getuId());
		Beds beds1=(Beds)session.get(Beds.class,beds.getbId());
		beds1.setUser(user1);
		session.save(beds1);
		tx.commit();
		session.close();
	}
	public List<User> getAllBedDetails() {
		Session session=sessionFactory.openSession();	
		return null;
	}
	@SuppressWarnings("unchecked")
	public List<Room> getAllRoomDetails(Long hId) {
		Session session=sessionFactory.openSession();
		House house=(House)session.load(House.class,hId);
		List<Room> room=house.getRooms();
		if(room!=null)
		{
		return room;
		}
		else
		{
			return null;
		}
		
		
	}
	public Long countRooms(Long hId) {
		Session session=sessionFactory.openSession();
		House house=(House)session.load(House.class, hId);
		List<Room> room=house.getRooms();
		int count=room.size();
		Long c=new Long(count);
		session.close();
		return c;
	}
}
