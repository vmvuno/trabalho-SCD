package projetoscd.vmvuno.com.github.OrderService.entities;

import jakarta.persistence.*;

@Entity
@Table(name="categorias")
public class Category {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="categoriaid")
    private Long id;

    @Column(name="nomecategoria")
    private String name;

    public Category() {
    }

    public Category(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
