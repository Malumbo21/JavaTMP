package com.javatmp.module.message.service;

import com.javatmp.fw.data.jpa.repository.JpaRepository;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.module.message.entity.Message;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import java.text.ParseException;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;

public class MessageService extends JpaRepository<Message, Long> {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private UserService userService;

    public MessageService(EntityManagerFactory emf, UserService userService) {
        super(Message.class, emf);
        this.userService = userService;
    }

    public Message readMessageById(Message message) {
        Message row = this.getOne(message.getMessageId());
        Long fromUserId = row.getFromUserId();
        Long toUserId = row.getToUserId();
        User fromUser = new User();
        fromUser.setId(fromUserId);

        fromUser = this.userService.readBasicUserById(fromUser);
        if (fromUser != null) {
            row.setFromUser(fromUser);
        }

        User toUser = new User();
        toUser.setId(toUserId);

        toUser = this.userService.readBasicUserById(toUser);
        if (toUser != null) {
            row.setToUser(toUser);
        }
        return row;
    }

    public DataTableResults<Message> listMessages(DataTableRequest<Message> tableRequest) throws ParseException {

        tableRequest.setClassType(Message.class);
        tableRequest.setSelects(new String[]{"messageId", "messageTitle", "messageContentText", "creationDate", "fromUserId", "toUserId", "messageStatus"});
        DataTableResults<Message> msgs = this.retrievePageRequestDetails(tableRequest);
        return msgs;
    }

}