package projetoscd.vmvuno.com.github.InventoryService.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.UUID;

@Entity
@Table(name="inventoryitems")
public class InventoryItem {
    @Id
    @Column(name="produtoid")
    private UUID id;

    @Column(name="quantidadeestoque")
    private int quantity;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "InventoryItem{" +
                "id=" + id +
                ", quantity=" + quantity +
                '}';
    }
}
