/*
 * package org.springMVC.controller;
 * 
 * import org.springMVC.model.Admin; import org.springMVC.service.AdminService;
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.RequestBody; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.ResponseBody;
 * 
 * import com.mysql.cj.Session;
 * 
 * import jakarta.servlet.http.HttpSession;
 * 
 * @Controller
 * 
 * @RequestMapping("/admin") public class AdminController {
 * 
 * @Autowired AdminService adminService;
 * 
 * @ResponseBody
 * 
 * @PostMapping("/adminLogin") public String adminLogin(@RequestBody Admin
 * admin,HttpSession session) { return adminService.adminLogin(admin, session);
 * }
 * 
 * @GetMapping("/adminDashboard") public String adminDashboard() { return
 * "adminDashboard"; }
 * 
 * }
 */