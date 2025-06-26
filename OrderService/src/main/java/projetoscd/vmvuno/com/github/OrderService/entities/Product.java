package projetoscd.vmvuno.com.github.OrderService.entities;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
@Table(name="produtos")
public class Product {
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "produtoid")
//    private long id;
//
//    @Column(name = "produtouuid")
//    private UUID uuid;

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "produtoid")
    private UUID id;

    @Column(name = "nomeproduto",  nullable = false)
    private String name;

    @Column(name = "descricao", nullable = false)
    private String description;

    @Column(name = "preco", nullable = false)
    private double price;

    @ManyToOne
    @JoinColumn(name = "marcaid")
    private Brand brand;

    @ManyToOne
    @JoinColumn(name = "categoriaid")
    private Category category;

    public Product() {
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                '}';
    }
}
