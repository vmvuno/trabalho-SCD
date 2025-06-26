package projetoscd.vmvuno.com.github.OrderService.entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;

import java.util.List;
import java.util.UUID;

@Entity
@Table(name="pedidos")
public class Order {
//    @Id
//    @Column(name="pedidoid")
//    @GeneratedValue(strategy=GenerationType.IDENTITY)
//    private long id;
//
//    @Column(name="pedidouuid")
//    private UUID uuid;

    @Id
    @Column(name="pedidoid")
    @GeneratedValue(strategy=GenerationType.UUID)
    private UUID id;

    @Column(name="emailcontato")
    private String contactEmail;

    @JsonBackReference
    @OneToMany(mappedBy="order", cascade = CascadeType.ALL)
    private List<OrderItem> orderItems;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", contactEmail='" + contactEmail + '\'' +
//                ", orderItems=" + orderItems +
                '}';
    }
}
