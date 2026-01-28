package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import vn.hoidanit.laptopshop.repository.OrderDetailRepository;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class DashboardController {
    private final UserService userService;
    private final ProductService productService;
    private final OrderDetailRepository orderDetailRepository;


    public DashboardController(UserService userService, ProductService productService, OrderDetailRepository orderDetailRepository) {
        this.userService = userService;
        this.productService = productService;
        this.orderDetailRepository = orderDetailRepository;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("countUser", this.userService.countUser());
        model.addAttribute("countProduct", this.productService.countProduct());
        model.addAttribute("countOrderDetails", this.orderDetailRepository.count());
        return "/admin/dashboard/show";
    }


}
