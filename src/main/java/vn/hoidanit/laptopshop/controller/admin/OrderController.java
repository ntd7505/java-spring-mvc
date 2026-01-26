package vn.hoidanit.laptopshop.controller.admin;

import org.aspectj.weaver.ast.Or;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.repository.OrderDetailRepository;
import vn.hoidanit.laptopshop.repository.OrderRepository;

import java.util.List;

@Controller
public class OrderController {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderController(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    @GetMapping("/admin/order")
    public String getOrderPage(Model model) {
        List<Order> orders = this.orderRepository.findAll();
        model.addAttribute("orders", orders);
        return "/admin/order/show";
    }

    //view
    @GetMapping("/admin/order/{id}")
    public String getDetailsOderPage(Model model, @PathVariable long id) {
        Order order = this.orderRepository.findOrderById(id);
        model.addAttribute("order", order);
        model.addAttribute("id", id);
        return "/admin/order/detail";
    }

    //get deletepage
    @GetMapping("/admin/order/delete/{id}")
    public String getDeletePage(Model model, @PathVariable long id) {
        Order order = this.orderRepository.findOrderById(id);
        model.addAttribute("order", order);
        model.addAttribute("id", id);
        return "/admin/order/delete";
    }

    //Post delete
    @PostMapping("/admin/order/delete")
    public String postDeleteById(@ModelAttribute("order") Order currentOrder) {
        List<OrderDetail> orderDetails = this.orderDetailRepository.findOrderDetailByOrder_Id(currentOrder.getId());
        for (OrderDetail orderDetail : orderDetails) {
            this.orderDetailRepository.deleteOrderDetailById(orderDetail.getId());
        }
        this.orderRepository.deleteById(currentOrder.getId());
        return "redirect:/admin/order";
    }

    //update
    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrderPage(Model model, @PathVariable long id) {
        Order order = this.orderRepository.findOrderById(id);
        model.addAttribute("order", order);
        return "/admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String postUpdateOrder(@ModelAttribute("order") Order newOrder) {
        Order currentOrder = this.orderRepository.findOrderById(newOrder.getId());
        currentOrder.setStatus(newOrder.getStatus());
        this.orderRepository.save(currentOrder);
        return "redirect:/admin/order";
    }

}
