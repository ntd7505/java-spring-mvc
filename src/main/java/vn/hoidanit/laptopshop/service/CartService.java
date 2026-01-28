package vn.hoidanit.laptopshop.service;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;
import vn.hoidanit.laptopshop.domain.*;
import vn.hoidanit.laptopshop.repository.CartDetailsRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.OrderDetailRepository;
import vn.hoidanit.laptopshop.repository.OrderRepository;

import java.util.List;
import java.util.Optional;

@Service
public class CartService {

    private final CartDetailsRepository cartDetailsRepository;
    private final CartRepository cartRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final OrderRepository orderRepository;

    public CartService(CartDetailsRepository cartDetailsRepository, CartRepository cartRepository, OrderDetailRepository orderDetailRepository, OrderRepository orderRepository) {
        this.cartDetailsRepository = cartDetailsRepository;
        this.cartRepository = cartRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.orderRepository = orderRepository;
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

    @Transactional
    public void handlePlaceOrder(User user, HttpSession session, String receiverName, String receiverAddress, String receiverPhone) {
        //create orderDetail
        //step1 : get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetails> cartDetails = cart.getCartDetails();

            //create order
            Order order = new Order();
            order.setUser(user);
            order.setReceiverName(receiverName);
            order.setReceiverAddress(receiverAddress);
            order.setReceiverPhone(receiverPhone);
            order.setStatus("PENDING");
            double sum = 0;
            for (CartDetails cartDetail : cartDetails) {
                sum += cartDetail.getPrice();
                order.setTotalPrice(sum);
            }
            order = this.orderRepository.save(order);

            if (cartDetails != null) {
                for (CartDetails cartDetail : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cartDetail.getProduct());
                    orderDetail.setPrice(cartDetail.getPrice());
                    orderDetail.setQuantity(cartDetail.getQuantity());
                    this.orderDetailRepository.save(orderDetail);

                }
                //step2: delete cart_details and cart

                for (CartDetails cartDetail : cartDetails) {
                    this.cartDetailsRepository.deleteCartDetailsById(cartDetail.getId());
                }
                this.cartRepository.deleteCartById(cart.getId());

                //step3: update session
                session.setAttribute("sum", 0);
            }

        }
    }

}
