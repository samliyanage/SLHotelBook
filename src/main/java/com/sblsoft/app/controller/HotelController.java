package com.sblsoft.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.sblsoft.app.model.Hotel;
import com.sblsoft.app.service.HotelService;

@Controller
public class HotelController {
	
	@Autowired
	private HotelService hotelService;
	
	@RequestMapping(value = "/hotel", method = RequestMethod.GET,produces={"application/json"})  
    public String listHotel(ModelMap model) {
        return "viewHotel";  
    }  
	
	@RequestMapping(value = "/addHotel", method = RequestMethod.POST)  
    public String addHotel(@ModelAttribute Hotel hotel, ModelMap model) {
        if(StringUtils.hasText(hotel.getId())) {
    		model.addAttribute("status", "error");
    		model.addAttribute("message", "Record already exist!");
        } else {
            hotelService.addHotel(hotel);
    		model.addAttribute("status", "ok");
            model.addAttribute("message","Record Added into database!");
        }
        return "viewHotel";  
    }
	
	@RequestMapping(value = "/findHotels", method = RequestMethod.GET,produces={"application/json"})  
    public String findHotels(ModelMap model) {  
		List<Hotel> hotels=hotelService.listHotel();
		String hotelsJSONObject=new Gson().toJson(hotels);
		model.addAttribute("hotels", hotelsJSONObject);
        return "findHotels";  
    }  

}