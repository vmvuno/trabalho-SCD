package projetoscd.vmvuno.com.github.InventoryService.Services;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import projetoscd.vmvuno.com.github.InventoryService.components.MessageSender;
import projetoscd.vmvuno.com.github.InventoryService.entities.InventoryItem;
import projetoscd.vmvuno.com.github.InventoryService.repositories.InventoryItemRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
@Transactional
public class OrderProcessing {

    @Autowired
    private InventoryItemRepository inventoryItemRepository;

    @Autowired
    private MessageSender messageSender;

    public void Process (String orderMessage) {
        String[] messageLines = orderMessage.split("\n");
        String orderId = messageLines[0];
        String contact =  messageLines[1];

        StringBuilder message = new StringBuilder("======= Email =======");
        message.append("\nDestinatário: ").append(contact);
        message.append("\nAssunto: Pedido N ").append(orderId).append("\n\n");

        ArrayList<String> missingItemsID = new ArrayList<String>();
        Map<String, Integer> orderItems = new HashMap<String, Integer>();
        for (int i = 2; i < messageLines.length; i++) {
            String[] item = messageLines[i].split(",");

            String itemId = item[1];
            int quantity = Integer.parseInt(item[0]);

            InventoryItem itemFromDB = inventoryItemRepository.getReferenceById(UUID.fromString(itemId));
            int availableQuantity = itemFromDB.getQuantity();

            if  (availableQuantity < quantity) {
                missingItemsID.add(itemId);
            }

            orderItems.put(itemId, quantity);
        }

        if (missingItemsID.isEmpty()) {
            for (String itemId : orderItems.keySet()) {
                InventoryItem itemFromDB = inventoryItemRepository.getReferenceById(UUID.fromString(itemId));
                int availableQuantity = itemFromDB.getQuantity();
                int desiredQuantity = orderItems.get(itemId);
                itemFromDB.setQuantity(availableQuantity - desiredQuantity);
                inventoryItemRepository.save(itemFromDB);
            }

            message.append("Seu pedido foi efetuado com sucesso!\n")
                    .append("Em breve você o receberá no seu endereço de entregas. :)");
        } else {
            message.append("Sentimos informar, mas não podemos atender seu pedido\n");
            message.append("No momento, não possuímos os seguintes itens (referência) em quantidade suficiente:");
            for (String itemId : missingItemsID) {
                message.append("\n").append(itemId);
            }
        }

        message.append("\n=====================");
        messageSender.sendNotification(message.toString());
    }

}
