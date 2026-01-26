package vn.hoidanit.laptopshop.service;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetails;
import vn.hoidanit.laptopshop.repository.CartDetailsRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;

import java.util.Optional;

@Service
public class CartService {

    private final CartDetailsRepository cartDetailsRepository;
    private final CartRepository cartRepository;

    public CartService(CartDetailsRepository cartDetailsRepository, CartRepository cartRepository) {
        this.cartDetailsRepository = cartDetailsRepository;
        this.cartRepository = cartRepository;
    }

    @Transactional
    public void deleteCartByID(long id, HttpSession session) {
        Optional<CartDetails> cartDetailsOptional = Optional.ofNullable(this.cartDetailsRepository.findCartDetailsById(id));
        if (cartDetailsOptional.isPresent()) {
            CartDetails cartDetails = cartDetailsOptional.get();
            Cart cart = this.cartRepository.findCartsById(cartDetails.getCart().getId());

            this.cartDetailsRepository.deleteCartDetailsById(id);
            int newSum = cart.getSum() - 1;
            session.setAttribute("sum", newSum);
            cart.setSum(newSum);
            this.cartRepository.save(cart);
            if (newSum == 0) {
                this.cartRepository.deleteCartById(cart.getId());
            }

        }
    }

}
