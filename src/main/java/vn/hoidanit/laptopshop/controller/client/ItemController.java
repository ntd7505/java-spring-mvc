package vn.hoidanit.laptopshop.controller.client;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetails;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;

import java.security.Principal;
import java.util.List;

@Controller
public class ItemController {
    private final ProductService productService;
    private final UserService userService;

    public ItemController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/client/product/{id}")
    public String getProductDetails(Model model, @PathVariable long id) {
        Product product = this.productService.handleFindById(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "/client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request, @RequestParam("quantity") int quantity) {
        HttpSession session = request.getSession(false);
        long productId = id;
        if (quantity <= 0) {
            quantity = 1;
        }
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, quantity, productId, session);
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, Principal principal, HttpServletRequest request) {
        //lay thong tin tu web --> xuong service tim user, tu user tim ra cart, tu cart ra cart details
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        String email = principal.getName();
        User user = this.userService.getUserByEmail(email);
        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartDetails> cartDetailsList = this.productService.getCartItems(user);
        double totalPrice = 0;
        for (CartDetails cartDetails : cartDetailsList) {
            totalPrice += cartDetails.getProduct().getPrice() * cartDetails.getQuantity();
        }
        model.addAttribute("cartDetailsList", cartDetailsList);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);
        return "/client/cart/show";
    }
}
