package com.javatmp.module.fixedAsset;

import com.javatmp.module.fixedAsset.*;
import com.javatmp.module.user.*;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.PersistenceException;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/fixedAsset/AddNewFixedAssetPopup")
public class AddNewFixedAssetPopup extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestPage = "/WEB-INF/pages/fixedAsset/addNewFixedAssetPopup.jsp";
        ServletContext context = request.getServletContext();
        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        FixedAssetService fixedAssetService = sf.getFixedAssetService();
        request.getRequestDispatcher(requestPage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        FixedAssetService fixedAssetService = sf.getFixedAssetService();
        HttpSession session = request.getSession();
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);

        try {
            FixedAsset toBeCreated = new FixedAsset();
            MvcHelper.populateBeanByRequestParameters(request, toBeCreated);
            toBeCreated.setCreationDate(new Date());
            toBeCreated.setStatus((short) 1);
            fixedAssetService.createNewFixedAsset(toBeCreated);
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage("Object created successfully");
            responseMessage.setData(toBeCreated);
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t.getCause() != null) {
                t = t.getCause();
            }
            logger.log(Level.SEVERE, t.getMessage(), t);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(t.getMessage());
        } catch (IllegalAccessException | InvocationTargetException ex) {
            logger.log(Level.SEVERE, ex.getMessage(), ex);
            throw new ServletException(ex);
        }

        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}