package projetoscd.vmvuno.com.github.NotificationService.Services;

import org.springframework.stereotype.Service;

@Service
public class SendMessageToConsole {
    public void sendMessage(String message) {
        StringBuilder messageToPrint = new StringBuilder("\n----------------------------");
        messageToPrint.append("\nEmail recebido: ");
        messageToPrint.append(message);
        messageToPrint.append("\n----------------------------\n");
        System.out.println(messageToPrint.toString());
    }
}
