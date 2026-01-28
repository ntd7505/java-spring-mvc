package vn.hoidanit.laptopshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import vn.hoidanit.laptopshop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product save(Product newProduct);

    List<Product> findAll();

    Product findById(long id);

    void deleteById(long id);

    Page<Product> findAll(Pageable page);

    @Query("SELECT p FROM Product p")
    List<Product> findAllProduct();
}
