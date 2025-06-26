package projetoscd.vmvuno.com.github.OrderService.entities;

import jakarta.persistence.*;

@Entity
@Table(name="marcas")
public class Brand {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="marcaid", nullable = false, unique = true)
    private Long id;

    @Column(name="nomemarca", nullable = false, unique = true)
    private String name;

    public Brand() {}

    public Brand(Long id, String name) {
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
        return "Brand{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
