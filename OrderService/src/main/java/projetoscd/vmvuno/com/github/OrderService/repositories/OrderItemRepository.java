package projetoscd.vmvuno.com.github.OrderService.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import projetoscd.vmvuno.com.github.OrderService.entities.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
}
