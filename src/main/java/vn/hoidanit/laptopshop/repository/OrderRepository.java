package vn.hoidanit.laptopshop.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import vn.hoidanit.laptopshop.domain.Order;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findAll();

    Order findOrderById(long id);

    @Transactional
    void deleteById(long id);
}
