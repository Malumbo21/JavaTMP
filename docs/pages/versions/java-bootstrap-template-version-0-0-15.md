---
title: Java Bootstrap Template Version 0.0.15 (Current Development Version)
---
# {{ page.title }}

## a86dbc5 on Feb 15, 2020, 7:47 PM GMT+4
- Support Theme-colors for Ion.RangeSlider plugin LTR/RTL
    - Update `.\web\assets\src\sass\plugins\custom-ion.rangeSlider.scss`
    - Update `.\src\main\webapp\WEB-INF\pages\static\plugins\ion-rangeSlider.jsp`
- Run gulp default to regenerate dist folders.

## 05b5af6 on Feb 10, 2020, 7:59 PM GMT+4
- Custom Boostrap Table Styling by providing `table-bordered-*` classes and demo page
`.\src\main\webapp\WEB-INF\pages\static\custom-components\custom-bootstrap-table-styling.jsp`
- Update .col-fixed-* helper classes to generate .col-fixed-1 to .col-fixed-100
- Run gulp default to regenerate dist folders.

## 4a259cf on Feb 10, 2020, 11:59 AM GMT+4
- Customize Spring Boot Whitelabel Error Page by controller `com.javatmp.fw.web.exception.CustomErrorPageController`
and send user to custom error page `.\src\main\webapp\WEB-INF\pages\system\error.jsp`
- create package `com.javatmp.fw.web.exception` to hold web exceptions and errors handler logic.
- move class `com.javatmp.fw.config.exception.ExceptionHandlerController` to `com.javatmp.fw.web.exception.ExceptionHandlerController`
- remove package `com.javatmp.fw.web.exception`.
- rename page `\src\main\webapp\WEB-INF\pages\system\404-page.jsp` to `\src\main\webapp\WEB-INF\pages\system\error.jsp`