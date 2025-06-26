package projetoscd.vmvuno.com.github.NotificationService.Components;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;
import projetoscd.vmvuno.com.github.NotificationService.Services.SendMessageToConsole;

@Component
public class MessageReceiver {
    @Autowired
    SendMessageToConsole sendMessageToConsole;

    @JmsListener(destination = "inventory-events")
    public void receiveMessage(String message) {
        sendMessageToConsole.sendMessage(message);
    }
}