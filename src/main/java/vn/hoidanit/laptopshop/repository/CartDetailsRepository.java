package vn.hoidanit.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.hoidanit.laptopshop.domain.CartDetails;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.Product;

import java.util.List;

public interface CartDetailsRepository extends JpaRepository<CartDetails, Long> {

    CartDetails findByCartAndProduct(Cart cart, Product product);

    List<CartDetails> findByCart(Cart cart);

    CartDetails findCartDetailsById(long id);

    void deleteCartDetailsById(long id);

}
