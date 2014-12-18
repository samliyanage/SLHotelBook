package com.sblsoft.app.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import com.sblsoft.app.model.Hotel;

@Repository
public class HotelService {

	@Autowired
	private MongoTemplate mongoTemplate;

	public static final String COLLECTION_NAME = "hotel";

	public void addHotel(Hotel hotel) {
		if (!mongoTemplate.collectionExists(Hotel.class)) {
			mongoTemplate.createCollection(Hotel.class);
		}
		hotel.setId(UUID.randomUUID().toString());
		mongoTemplate.insert(hotel, COLLECTION_NAME);
	}

	public List<Hotel> listHotel() {
		return mongoTemplate.findAll(Hotel.class, COLLECTION_NAME);
	}
}
