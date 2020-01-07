package com.javatmp.module.stats.controller;

import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.activity.ActivityService;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Slf4j
@Controller
@RequestMapping("/stats")
public class GetUsersLocationsCountController {

    @RequestMapping(value = "/GetUsersLocationsCountController", method = RequestMethod.POST)
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        UserStatsService userStatsService = sf.getUserStatsService();

        try {
            List<Object[]> results = userStatsService.usersCountriesGrouping();
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(null);
            responseMessage.setData(results);
        } catch (IllegalArgumentException e) {
            log.error(e.getMessage(), e);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        }

        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}