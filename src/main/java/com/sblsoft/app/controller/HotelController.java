package com.sblsoft.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.sblsoft.app.model.Hotel;
import com.sblsoft.app.service.HotelService;

@Controller
public class HotelController {
	
	@Autowired
	private HotelService hotelService;
	
	@RequestMapping(value = "/hotel", method = RequestMethod.GET,produces={"application/json"})  
    public String listHotel(ModelMap model) {
        //model.addAttribute("hotelList", hotelService.listHotel());  
		List<Hotel> hotels=hotelService.listHotel();
		String hotelsJSONObject=new Gson().toJson(hotels);
		model.addAttribute("hotels", hotelsJSONObject);
		model.addAttribute("hotelList", hotels);
        return "output";  
    }  
	
	@RequestMapping(value = "/hotel/add", method = RequestMethod.POST)  
    public View addHotel(@ModelAttribute Hotel hotel, ModelMap model) {
        if(StringUtils.hasText(hotel.getId())) {
        	//Already Exist
            //hotelService.updatePerson(hotel);
        } else {
            hotelService.addHotel(hotel);
        }
        return new RedirectView("/SLHotelBook/hotel");  
    }
	
	@RequestMapping(value = "/findHotels", method = RequestMethod.GET,produces={"application/json"})  
    public String findHotels(ModelMap model) {  
		List<Hotel> hotels=hotelService.listHotel();
		String hotelsJSONObject=new Gson().toJson(hotels);
		model.addAttribute("hotels", hotelsJSONObject);
        return "findHotels";  
    }  

}