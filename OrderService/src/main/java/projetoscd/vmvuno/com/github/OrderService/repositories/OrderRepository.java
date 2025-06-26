package projetoscd.vmvuno.com.github.OrderService.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import projetoscd.vmvuno.com.github.OrderService.entities.Order;

import java.util.UUID;

public interface OrderRepository extends JpaRepository<Order, UUID> {
}
