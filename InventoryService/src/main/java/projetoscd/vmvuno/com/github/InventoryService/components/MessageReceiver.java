package projetoscd.vmvuno.com.github.InventoryService.components;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;
import projetoscd.vmvuno.com.github.InventoryService.Services.OrderProcessing;

@Component
public class MessageReceiver {
    @Autowired
    private OrderProcessing orderProcessing;

    @JmsListener(destination = "orders")
    public void receiveMessage(String message) {
        StringBuilder messageToPrint = new StringBuilder("--------------------\n");
        messageToPrint.append("Mensagem buscada no ActiveMQ:\n");
        messageToPrint.append(message);
        messageToPrint.append("\n------------------\n");

        System.out.println(messageToPrint.toString());

        orderProcessing.Process(message);
    }
}