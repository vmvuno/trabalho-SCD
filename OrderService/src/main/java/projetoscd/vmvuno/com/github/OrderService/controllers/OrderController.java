package projetoscd.vmvuno.com.github.OrderService.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.web.bind.annotation.*;
import projetoscd.vmvuno.com.github.OrderService.entities.Order;
import projetoscd.vmvuno.com.github.OrderService.entities.OrderItem;
import projetoscd.vmvuno.com.github.OrderService.entities.Product;
import projetoscd.vmvuno.com.github.OrderService.repositories.OrderItemRepository;
import projetoscd.vmvuno.com.github.OrderService.repositories.OrderRepository;
import projetoscd.vmvuno.com.github.OrderService.repositories.ProductRepository;
import projetoscd.vmvuno.com.github.OrderService.services.MessageSender;

import java.util.*;

@RestController
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private JmsTemplate jmsTemplate;

    @Autowired
    private MessageSender messageSender;

    @PostMapping
    public ResponseEntity<String> takeOrder(@RequestBody Map<String, Object> order) {
        Order orderEntity = new Order();
        orderEntity.setContactEmail((String) order.get("contactEmail"));
        orderEntity = orderRepository.save(orderEntity);

        StringBuilder message = new StringBuilder(orderEntity.getId().toString() + "\n");
        message.append(orderEntity.getContactEmail());

        List<Map<String, Object>> orderItems = (List<Map<String, Object>>) order.get("orderItems");
        for (Map<String, Object> orderItem : orderItems) {
            UUID productId = UUID.fromString(orderItem.get("product").toString());
            Integer quantity = (Integer) orderItem.get("quantity");
            Product product = productRepository.findById(productId).orElse(null);

            if (product != null) {
                message.append("\n")
                        .append(quantity)
                        .append(",")
                        .append(productId);

                OrderItem orderItemEntity = new OrderItem(orderEntity, product, quantity);
                orderItemRepository.save(orderItemEntity);
            }
        }

        messageSender.sendOrder(message.toString());

        return new ResponseEntity("Seu pedido será processado e você será informado do resultado via mensagem/e-mail",  HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<List<Order>> getAllOrders() {
        return new ResponseEntity(orderRepository.findAll(), HttpStatus.OK);
    }

}
