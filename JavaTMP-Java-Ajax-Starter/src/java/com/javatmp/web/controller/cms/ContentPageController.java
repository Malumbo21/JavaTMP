package com.javatmp.web.controller.cms;

import com.javatmp.domain.Content;
import com.javatmp.service.ContentService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cms/ContentPageController")
public class ContentPageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        ContentService cs = sf.getContentService();
        Content content = cs.getContents().get(0);
        request.setAttribute("content", content);
        request.getRequestDispatcher("/WEB-INF/pages/plugins/dynamic-bootstrap-summernote-editor.jsp").forward(request, response);

    }
}