package projetoscd.vmvuno.com.github.InventoryService.components;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Component;

@Component
public class MessageSender {

    @Autowired
    private final JmsTemplate jmsTemplate;

    public MessageSender(JmsTemplate jmsTemplate) {
        this.jmsTemplate = jmsTemplate;
    }

    public void sendNotification(String message) {
        jmsTemplate.convertAndSend("inventory-events", message);

        StringBuilder messageToPrint = new StringBuilder("--------------------\n");
        messageToPrint.append("Mensagem enviada para inventory-events:\n");
        messageToPrint.append(message);
        messageToPrint.append("\n------------------\n");
        System.out.println(messageToPrint.toString());
    }

}