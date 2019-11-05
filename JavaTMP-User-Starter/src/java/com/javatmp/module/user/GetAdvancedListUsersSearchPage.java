package com.javatmp.module.user;

import com.javatmp.module.country.Countrytranslation;
import com.javatmp.module.language.Languagetranslation;
import com.javatmp.module.theme.Themetranslation;
import com.javatmp.module.timezone.Timezonetranslation;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/GetAdvancedListUsersSearchPage")
public class GetAdvancedListUsersSearchPage extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestPage = "/WEB-INF/pages/user/advancedUsersSearch.jsp";

        ServletContext context = request.getServletContext();
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        List<Timezonetranslation> timezones = sf.getTimezoneService().getTimezones(loggedInUser);
        List<Countrytranslation> countries = sf.getCountryService().getCountries(loggedInUser);
        List<Languagetranslation> languages = sf.getLanguageService().getLanguages(loggedInUser);
        List<Themetranslation> themes = sf.getThemeService().getThemes(loggedInUser);
        request.setAttribute("themes", themes);
        request.setAttribute("languages", languages);
        request.setAttribute("countries", countries);
        request.setAttribute("timezones", timezones);
        request.getRequestDispatcher(requestPage).forward(request, response);
    }
}