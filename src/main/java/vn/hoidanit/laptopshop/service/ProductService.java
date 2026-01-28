package vn.hoidanit.laptopshop.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import jakarta.servlet.http.HttpSession;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.CartDetails;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.CartDetailsRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailsRepository cartDetailsRepository;

    private final UserService userService;


    public ProductService(ProductRepository productRepository, CartRepository cartRepository, CartDetailsRepository cartDetailsRepository, UserService userService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailsRepository = cartDetailsRepository;
        this.userService = userService;
    }

    public void saveProducts(Product newProduct) {
        this.productRepository.save(newProduct);
    }

    public Page<Product> gellALlProducts(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }

    public Product handleFindById(long id) {
        return this.productRepository.findById(id);
    }

    public void dhandleDeleteById(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, int quantity, long productId, HttpSession session) {
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(0);
                cart = this.cartRepository.save(newCart);
            }

            Optional<Product> p = Optional.ofNullable(this.productRepository.findById(productId));
            if (p.isPresent()) {
                Product realProduct = p.get();
                CartDetails cartDetails = new CartDetails();
                CartDetails oldDetails = this.cartDetailsRepository.findByCartAndProduct(cart, realProduct
                );
                if (oldDetails == null) {
                    cartDetails.setCart(cart);
                    cartDetails.setProduct(realProduct);
                    cartDetails.setPrice(realProduct.getPrice());
                    cartDetails.setQuantity(quantity);
                    this.cartDetailsRepository.save(cartDetails);
                    int s = cart.getSum() + quantity;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldDetails.setQuantity(oldDetails.getQuantity() + quantity);
                    this.cartDetailsRepository.save(oldDetails);
                }
            }
        }
    }

    public List<CartDetails> getCartItems(User user) {
        Cart cart = this.cartRepository.findByUser(user);

        if (cart == null) {
            return new ArrayList<CartDetails>();
        }
        return this.cartDetailsRepository.findByCart(cart);
    }

    public Cart fetchByUser(User currentUser) {
        return this.cartRepository.findByUser(currentUser);

    }

    public void handleUpdateCartBeforeCheckout(List<CartDetails> cartDetails) {
        for (CartDetails cartDetail : cartDetails) {

            Optional<CartDetails> cdOptional = this.cartDetailsRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetails currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailsRepository.save(currentCartDetail);
            }
        }
    }

    public long countProduct() {
        return this.productRepository.count();
    }
}
