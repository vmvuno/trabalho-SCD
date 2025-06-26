package projetoscd.vmvuno.com.github.InventoryService.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import projetoscd.vmvuno.com.github.InventoryService.entities.InventoryItem;

import java.util.UUID;

public interface InventoryItemRepository extends JpaRepository<InventoryItem, UUID> {
}
