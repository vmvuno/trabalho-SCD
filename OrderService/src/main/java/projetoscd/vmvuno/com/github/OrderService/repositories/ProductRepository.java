package projetoscd.vmvuno.com.github.OrderService.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import projetoscd.vmvuno.com.github.OrderService.entities.Product;

import java.util.List;
import java.util.UUID;

public interface ProductRepository extends PagingAndSortingRepository<Product,UUID>, JpaRepository<Product, UUID> {
    List<Product> findByName(@Param("name") String name);
    List<Product> findByCategoryName(@Param("category_name") String category_name);
}

