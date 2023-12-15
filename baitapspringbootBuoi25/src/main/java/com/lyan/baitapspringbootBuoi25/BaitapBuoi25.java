package com.lyan.baitapspringbootBuoi25;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/buoi25")
public class BaitapBuoi25 {
    @GetMapping("/getting")
    public String logingetting(){
    return "BaitapBuoi25";
    }

    @PostMapping("/welcome")
    public String welcome(@RequestParam String tendangnhap, Model model){
        System.out.println("Ten dang nhap: " + tendangnhap);
        model.addAttribute("name" , tendangnhap);

        return "Login";
    }


}
