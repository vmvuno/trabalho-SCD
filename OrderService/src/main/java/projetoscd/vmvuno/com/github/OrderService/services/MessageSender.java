package projetoscd.vmvuno.com.github.OrderService.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Service;
import projetoscd.vmvuno.com.github.OrderService.entities.Order;

@Service
public class MessageSender {

    @Autowired
    private final JmsTemplate jmsTemplate;

    public MessageSender(JmsTemplate jmsTemplate) {
        this.jmsTemplate = jmsTemplate;
    }

    public void sendOrder(String message) {
        jmsTemplate.convertAndSend("orders", message);

        StringBuilder messageToPrint = new StringBuilder("--------------------\n");
        messageToPrint.append("Mensagem enviada para orders:\n");
        messageToPrint.append(message);
        messageToPrint.append("\n------------------\n");
        System.out.println(messageToPrint.toString());
    }
}