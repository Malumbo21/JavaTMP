<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="dynamic-ajax-content m-0 p-0">
    <div class="user-list-btn-toolbar my-3" role="toolbar" aria-label="Toolbar with button groups">
        <button type="button" class="btn btn-primary"
                actionType="action-ref-href"
                action-ref-by-href="${pageContext.request.contextPath}/user/CreateUserController">
            <i class="fa fa-fw fa-user"></i>
            Add New User
        </button>
        <button id="UserList-AddNewUserPopupId" type="button" class="btn btn-primary">
            <i class="fa fa-external-link-alt fa-fw"></i>
            Add New User Popup
        </button>
        <button id="UserList-UpdateSelectedUserId" type="button" class="btn btn-primary">
            <i class="fa fa-user-edit fa-fw"></i>
            Update Complete User
        </button>
        <button id="UserList-DeleteSelectedUserId" type="button" class="btn btn-primary">
            <i class="fa fa-times fa-fw"></i>
            Delete User
        </button>
    </div>
    <table cellspacing="0" class="table table-condensed table-bordered table-hover" id="UsersListTableId">
        <thead>
            <tr id="UserListMainHeader">
                <th style="width: 100px;"><p style="width: 100px;">ID</p></th>
                <th style="width: 150px;"><p style="width: 150px;">Username</p></th>
                <th style="width: 150px;"><p style="width: 150px;">First name</p></th>
                <th style="width: 150px;"><p style="width: 150px;">Last name</p></th>
                <th style="width: 200px;"><p style="width: 200px;">Date Of Birth</p></th>
                <th style="width: 100px;"><p style="width: 100px;">Age</p></th>
                <th style="width: 200px;"><p style="width: 200px;">E-mail</p></th>
                <th style="width: 100px;"><p style="width: 100px;">Status</p></th>
                <th style="width: 200px;"><p style="width: 200px;">Country Name</p></th>
                <th style="width: 150px;"><p style="width: 150px;">Address</p></th>
                <th style="width: 125px;"><p style="width: 125px;">Language</p></th>
                <th style="width: 150px;"><p style="width: 150px;">Theme</p></th>
                <th style="width: 250px;"><p style="width: 250px;">Timezone</p></th>
                <th style="width: 200px;"><p style="width: 200px;">Creation Date</p></th>
            </tr>
            <tr id="UserListFilterHeader">
                <th style="width: 100px;">
                    <input id="userlist-id-filter" class="form-control"/>
                </th>
                <th style="width: 150px;">
                    <input id="userlist-username-filter" class="form-control"/>
                </th>
                <th style="width: 150px;">
                    <input id="userlist-firstname-filter" class="form-control"/>
                </th>
                <th style="width: 150px;">
                    <input id="userlist-lastname-filter" class="form-control"/>
                </th>
                <th style="width: 200px;">
                    <input id="userlist-birthdate-filter" class="form-control"/>
                </th>
                <th style="width: 100px;">
                    <input id="userlist-age-filter" class="form-control"/>
                </th>
                <th style="width: 200px;">
                    <input id="userlist-email-filter" class="form-control"/>
                </th>
                <th style="width: 100px;">
                    <select id="userlist-status-filter" class="form-control">
                        <option value="">ALL Statuses</option>
                        <option value="1">Activated</option>
                        <option value="0">Deactivated</option>
                        <option value="-1">Deleted</option>
                    </select>
                </th>
                <th style="width: 200px;">
                    <select id="userlist-country-filter" class="form-control">
                        <c:choose>
                            <c:when test="${fn:length(requestScope.countries) > 0}">
                                <option value="">All Countries</option>
                                <c:forEach items="${requestScope.countries}" var="country">
                                    <option value="${country.countryId}">${country.countryName}</option>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <option value="">No Record Found</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </th>
                <th style="width: 150px;">
                    <input id="userlist-address-filter" class="form-control"/>
                </th>
                <th style="width: 125px;">
                    <select id="userlist-language-filter" name="lang" class="form-control">
                        <c:choose>
                            <c:when test="${fn:length(requestScope.languages) > 0}">
                                <option value="">All Languages</option>
                                <c:forEach items="${requestScope.languages}" var="language">
                                    <option value="${language.languageId}">${language.languageName}</option>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <option value="">No Record Found</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </th>
                <th style="width: 150px;">
                    <select id="userlist-theme-filter" name="theme" class="form-control">
                        <c:choose>
                            <c:when test="${fn:length(requestScope.themes) > 0}">
                                <option value="">All Themes</option>
                                <c:forEach items="${requestScope.themes}" var="theme">
                                    <option value="${theme.themeId}">${theme.themeName}</option>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <option value="">No Record Found</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </th>
                <th style="width: 250px;">
                    <select id="userlist-timezone-filter" name="timezone" class="form-control">
                        <c:choose>
                            <c:when test="${fn:length(requestScope.timezones) > 0}">
                                <option value="">All Timezones</option>
                                <c:forEach items="${requestScope.timezones}" var="timezone">
                                    <option value="${timezone.timezoneId}">${timezone.timezoneName}</option>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <option value="-1">No Record Found</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </th>
                <th style="width: 200px;">
                    <input id="userlist-creationdate-filter" class="form-control"/>
                </th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
    <style type="text/css">
        table.dataTable tbody tr {
            cursor: pointer;
        }
        #UserListFilterHeader th {
            padding: 0;
        }

        #UserListFilterHeader th > .form-control {
            border-radius: 0;
        }
        #UserListFilterHeader th > .custom-select {
            border-radius: 0;
        }
        #UserListMainHeader th > p {
            margin-bottom: 0;
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.

            // build lookup map for countries:
            var countriesMap = {};
            var countriesSelect = $("#userlist-country-filter");
            var languagesMap = {};
            var languagesSelect = $("#userlist-language-filter");
            var themesMap = {};
            var themesSelect = $("#userlist-theme-filter");
            var timezonesMap = {};
            var timezoneSelect = $("#userlist-timezone-filter");
            $("option", countriesSelect).map(function (i, item) {
                var text = $(item).text();
                var value = $(item).attr("value");
                if (!(value === "-1" || value === "")) {
                    countriesMap[value] = text;
                }
            });
            $("option", languagesSelect).map(function (i, item) {
                var text = $(item).text();
                var value = $(item).attr("value");
                if (!(value === "-1" || value === "")) {
                    languagesMap[value] = text;
                }
            });
            $("option", themesSelect).map(function (i, item) {
                var text = $(item).text();
                var value = $(item).attr("value");
                if (!(value === "-1" || value === "")) {
                    themesMap[value] = text;
                }
            });
            $("option", timezoneSelect).map(function (i, item) {
                var text = $(item).text();
                var value = $(item).attr("value");
                if (!(value === "-1" || value === "")) {
                    timezonesMap[value] = text;
                }
            });

            var addNewUserPopupButton = $("#UserList-AddNewUserPopupId");
            var updateUserButton = $("#UserList-UpdateSelectedUserId");
            var deleteUserButton = $("#UserList-DeleteSelectedUserId");

            var userTableElement = $('#UsersListTableId');
//            updateUserButton.addClass("disabled");
            function disabled() {
                updateUserButton.prop("disabled", true);
                deleteUserButton.prop("disabled", true);
            }
            function enabled() {
                updateUserButton.prop("disabled", false);
                deleteUserButton.prop("disabled", false);
            }
            disabled();
            $.fn.dataTable.ext.errMode = 'none';
            var table = userTableElement.DataTable({
                //                responsive: true,
                dom: "<'row'<'col-sm-12 p-0'tr>>" +
                        "<'row'<'col-sm-6'i><'col-sm-6 pt-2 text-right'l>>"
                        + "<'row'<'col-sm-12'p>>"
                ,
//                select: true,
                select: "single",
                scrollY: 400,
                scrollX: true,
                "autoWidth": false,
                fixedColumns: true,
                scrollCollapse: true,
                "searching": true,
                searchDelay: 500,
                orderCellsTop: true, // important to for two row header with filteration below header column names.
                "processing": true,
                "serverSide": true,
                "rowCallback": function (row, data, index) {
                    // replace the contents of the first column (rowid) with an edit link
                    $(row).attr("data-row-id", data.id);
                },
                "drawCallback": function (settings) {
                    disabled();
                },
                initComplete: function (settings, json) {
                    var api = this.api();
                    // prepare id filter search field:
                    var idFilterInput = $("#userlist-id-filter");
                    idFilterInput.on('keyup change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $.fn.dataTable.util.escapeRegex($this.val());
                            api.column(0).search(val ? val : '', true, false).draw();
                        }, 200, "@userlist-main-table-filter");
                    });
                    var usernameFilterInput = $("#userlist-username-filter");
                    usernameFilterInput.on('keyup change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $.fn.dataTable.util.escapeRegex($this.val());
                            api.column(1).search(val ? val : '', true, false).draw();
                        }, 200, "@userlist-main-table-filter");
                    });
                    var firstNameFilterInput = $("#userlist-firstname-filter");
                    firstNameFilterInput.on('keyup change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $.fn.dataTable.util.escapeRegex($this.val());
                            api.column(2).search(val ? val : '', true, false).draw();
                        }, 200, "@userlist-main-table-filter");
                    });
                    var lastNameFilterInput = $("#userlist-lastname-filter");
                    lastNameFilterInput.on('keyup change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $.fn.dataTable.util.escapeRegex($this.val());
                            api.column(3).search(val ? val : '', true, false).draw();
                        }, 200, "@userlist-main-table-filter");
                    });

                    var birthdateFilterInput = $("#userlist-birthdate-filter");
                    birthdateFilterInput.on('change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $this.val();
                            api.column(4).search(val ? val : '', true, false).draw();
                        }, 200, "@userlist-main-table-filter");
                    });
                    birthdateFilterInput.inputmask({
                        alias: "datetime",
                        placeholder: "dd/mm/yyyy",
                        inputFormat: "dd/mm/yyyy",
                        displayFormat: true,
                        hourFormat: "24",
                        clearMaskOnLostFocus: false
                    });
                    birthdateFilterInput.daterangepicker({
                        "opens": javatmp.settings.floatDefault,
                        //                    startDate: false,
                        singleDatePicker: true,
                        showDropdowns: true,
                        timePicker: false,
                        timePickerIncrement: 1,
                        timePicker24Hour: true,
                        autoApply: true,
                        autoUpdateInput: false,
                        minDate: '01/01/1900',
                        maxDate: '31/12/2099',
                        //                    maxDate: '',
                        //                    minDate: moment(),
                        locale: {
                            "direction": javatmp.settings.direction,
                            format: 'DD/MM/YYYY'
                        }
                    }, function (start, end, label) {
                        var formatedDateSelected = moment(start).format("DD/MM/YYYY");
                        birthdateFilterInput.val(formatedDateSelected).trigger("change");
                    });

                    var ageFilterInput = $("#userlist-age-filter");
                    ageFilterInput.on('keyup change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $this.val();
                            api.column(5).search(val ? val : '', true, false).draw();
                        }, 200, "@userlist-main-table-filter");
                    });

                    var emailFilterInput = $("#userlist-email-filter");
                    emailFilterInput.on('keyup change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $.fn.dataTable.util.escapeRegex($this.val());
                            api.column(6).search(val ? val : '', true, false).draw();
                        }, 200, "@userlist-main-table-filter");
                    });

                    var statusFilterInput = $("#userlist-status-filter");
                    statusFilterInput.on('change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            //                            var val = $.fn.dataTable.util.escapeRegex($this.val());
                            var val = $this.val();
                            api.column(7).search(val ? val : '', false, false).draw();
                        }, 200, "@userlist-main-table-filter");
                    });
                    statusFilterInput.select2({
                        theme: "bootstrap",
                        dir: javatmp.settings.direction,
                        containerCssClass: ':all:',
                        escapeMarkup: function (markup) {
                            return markup;
                        }
                    });
                    var countryFilterInput = $("#userlist-country-filter");
                    countryFilterInput.on('change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $this.val();
                            api.column(8).search(val ? val : '', false, false).draw();
                        }, 200, "@userlist-main-table-filter");
                    });
                    countryFilterInput.select2({
                        theme: "bootstrap",
                        dir: javatmp.settings.direction,
                        templateSelection: formatCountrySelection,
                        templateResult: formatCountry,
                        escapeMarkup: function (markup) {
                            return markup;
                        }
                    });

                    function formatCountry(repo) {
                        if (repo.loading)
                            return repo.text;

                        var targetData = {};
                        if (repo.id === "") {
                            targetData = {
                                'imagePath': javatmp.settings.contextPath + "/assets/img/flags/globe.png",
                                'countryText': repo.text,
                                'countryId': ""
                            };
                        } else {
                            targetData = {
                                'imagePath': javatmp.settings.contextPath + "/assets/img/flags/" + repo.id.toLowerCase() + ".png",
                                'countryText': repo.text,
                                'countryId': " (" + repo.id + ")"
                            };
                        }
                        var template =
                                '    <div class="media d-flex align-items-center">' +
                                '        <img class="mr-1" src="{{imagePath}}" alt="{{countryText}}"/>' +
                                '        <div class="media-body">' +
                                '            <strong class="">{{countryText}}{{countryId}}</strong>' +
                                '        </div>' +
                                '    </div>';
                        var readyData = template.composeTemplate(targetData);
                        return readyData;
                    }
                    function formatCountrySelection(repo) {
                        if (!repo.id) {
                            return repo.text;
                        }
                        var targetData = {};
                        if (repo.id === "") {
                            targetData = {
                                'imagePath': javatmp.settings.contextPath + "/assets/img/flags/globe.png",
                                'countryText': repo.text,
                                'countryId': ""
                            };
                        } else {
                            targetData = {
                                'imagePath': javatmp.settings.contextPath + "/assets/img/flags/" + repo.id.toLowerCase() + ".png",
                                'countryText': repo.text,
                                'countryId': " (" + repo.id + ")"
                            };
                        }

                        var template =
                                '    <div class="media d-flex align-items-center">' +
                                '        <img class="mr-1" src="{{imagePath}}" alt="{{countryText}}"/>' +
                                '        <div class="media-body">' +
                                '            <span class="">{{countryText}}{{countryId}}</span>' +
                                '        </div>' +
                                '    </div>';
                        var readyData = template.composeTemplate(targetData);
                        return readyData;
                    }

                    // Address field
                    var addressFilterInput = $("#userlist-address-filter");
                    addressFilterInput.on('change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $this.val();
                            api.column(9).search(val ? val : '', false, false).draw();
                        }, 200, "@userlist-main-table-filter");
                    });
                    // 10 Language Field userlist-language-filter
                    var languageFilterInput = $("#userlist-language-filter");
                    languageFilterInput.on('change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $this.val();
                            api.column(10).search(val ? val : '', false, false).draw();
                        }, 200, "@userlist-main-table-filter");
                    });
                    languageFilterInput.select2({
                        theme: "bootstrap",
                        dir: javatmp.settings.direction,
                        containerCssClass: ':all:',
                        escapeMarkup: function (markup) {
                            return markup;
                        }
                    });

                    // 11 Theme Field userlist-theme-filter
                    var themeFilterInput = $("#userlist-theme-filter");
                    themeFilterInput.on('change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $this.val();
                            api.column(11).search(val ? val : '', false, false).draw();
                        }, 200, "@userlist-main-table-filter");
                    });
                    themeFilterInput.select2({
                        theme: "bootstrap",
                        dir: javatmp.settings.direction,
                        containerCssClass: ':all:',
                        escapeMarkup: function (markup) {
                            return markup;
                        },
                        templateSelection: formatThemeSelection,
                        templateResult: formatThemeResult
                    });
                    function formatThemeSelection(repo) {
                        if (!repo.id) {
                            return repo.text;
                        }

                        var imagePath = javatmp.settings.contextPath + "/assets/img/themes/" + repo.text + ".png";
                        var template =
                                '    <div class="media d-flex align-items-center">' +
                                '        <img style="height: 25px;" class="mr-1" src="{{imagePath}}" alt="{{themeName}}"/>' +
                                '        <div class="media-body">' +
                                '            <span>{{themeName}}</span>' +
                                '        </div>' +
                                '    </div>';
                        var readyData = template.composeTemplate({
                            'imagePath': imagePath,
                            'themeName': repo.text
                        });
                        return readyData;
                    }
                    function formatThemeResult(repo) {
                        if (!repo.id) {
                            return repo.text;
                        }

                        var imagePath = javatmp.settings.contextPath + "/assets/img/themes/" + repo.text + ".png";
                        var template =
                                '    <div class="media d-flex align-items-center">' +
                                '        <img style="height: 32px;" class="mr-1" src="{{imagePath}}" alt="{{themeName}}"/>' +
                                '        <div class="media-body">' +
                                '            <span>{{themeName}}</span>' +
                                '        </div>' +
                                '    </div>';
                        var readyData = template.composeTemplate({
                            'imagePath': imagePath,
                            'themeName': repo.text
                        });
                        return readyData;
                    }
                    // 12 Timezone Filed userlist-timezone-filter
                    var timezoneFilterInput = $("#userlist-timezone-filter");
                    timezoneFilterInput.on('change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $this.val();
                            api.column(12).search(val ? val : '', false, false).draw();
                        }, 200, "@userlist-main-table-filter");
                    });
                    timezoneFilterInput.select2({
                        theme: "bootstrap",
                        dir: javatmp.settings.direction,
                        containerCssClass: ':all:',
                        escapeMarkup: function (markup) {
                            return markup;
                        }
                    });
                    // 13 CreationDate Field
                    var creationdateFilterInput = $("#userlist-creationdate-filter");
                    creationdateFilterInput.on('change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var start = $this.data("start");
                            var end = $this.data("end");
                            var val = start.format("YYYY-MM-DDTHH:mm:ss.SSSZ") + "##TO##" + end.format("YYYY-MM-DDTHH:mm:ss.SSSZ");
                            api.column(13).search(val ? val : '', false, false).draw();
                        }, 200, "@userlist-main-table-filter");
                    });
                    creationdateFilterInput.daterangepicker({
                        "opens": javatmp.settings.floatDefault,
                        startDate: moment().subtract(100, 'years'),
                        endDate: moment(),
                        minDate: '01/01/1900',
                        maxDate: '31/12/2099',
                        timePicker: true,
                        autoApply: true,
                        autoUpdateInput: false,
                        locale: {
                            "direction": javatmp.settings.direction,
                            format: 'MM/DD/YYYY HH:mm:ss'

                        },
                        ranges: {
                            'Today': [moment().startOf('day'), moment().endOf("day")],
                            'Yesterday': [moment().subtract(1, 'days').startOf('day'), moment().subtract(1, 'days').endOf("day")],
                            'Last 7 Days': [moment().subtract(6, 'days').startOf('day'), moment().endOf("day")],
                            'Last 30 Days': [moment().subtract(29, 'days').startOf('day'), moment().endOf("day")],
                            'This Month': [moment().startOf('month').startOf('day'), moment().endOf('month').endOf("day")],
                            'Last Month': [moment().subtract(1, 'month').startOf('month').startOf('day'), moment().subtract(1, 'month').endOf('month').endOf("day")]
                        }
                    });
                    creationdateFilterInput.on('apply.daterangepicker', function (ev, picker) {
                        creationdateFilterInput.data("start", picker.startDate);
                        creationdateFilterInput.data("end", picker.endDate);
                        creationdateFilterInput.val(picker.startDate.format('MM/DD/YYYY HH:mm:ss') + ' - ' + picker.endDate.format('MM/DD/YYYY HH:mm:ss')).trigger("change");
                    });
                    creationdateFilterInput.on('cancel.daterangepicker', function (ev, picker) {
                        $(this).val('').trigger("change");
                    });

                },
                "ajax": {
                    "type": "POST",
                    "url": javatmp.settings.contextPath + "/user/ListUsersController",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    "data": function (currentDate) {
                        currentDate._ajaxGlobalBlockUI = false; // window blocked until data return
                        return JSON.stringify(currentDate);
                    },
                    "dataSrc": function (json) {
                        json["recordsTotal"] = json.data.recordsTotal;
                        json["recordsFiltered"] = json.data.recordsFiltered;
                        return json.data.data;
                    }
                },
                columns: [
                    {data: 'id', className: "", name: "id", width: 100,
                        "render": function (data, type, row) {
                            if (type === "display") {
                                return "<p class='m-0 p-0' style='width: 100px;'>" + data + "</p>";
                            } else {
                                return data;
                            }

                        }
                    },
                    {
                        data: 'userName', name: "userName", width: 150,
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return data;
                            } else {
                                return "<p class='m-0 p-0' style='width: 150px;'>" + data + "</p>";
                            }
                        }
                    },
                    {
                        data: 'firstName', name: "firstName", width: 150,
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return data;
                            } else {
                                return "<p class='m-0 p-0' style='width: 150px;'>" + data + "</p>";
                            }

                        }
                    },
                    {
                        data: 'lastName', name: "lastName", width: 150,
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return data;
                            } else {
                                return "<p class='m-0 p-0' style='width: 150px;'>" + data + "</p>";
                            }

                        }
                    },
                    {
                        data: 'birthDate', "type": "date", name: "birthDate", width: 200,
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ").format('DD/MM/YYYY HH:mm');
                            } else {
                                return "<p class='m-0 p-0' style='width: 200px;'>" + moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ").format('DD/MM/YYYY') + "</p>";
                            }
                        }
                    },
                    {
                        data: 'birthDate', name: "age", "type": "date", width: 100,
                        "render": function (data, type, row) {
                            data = Math.ceil(moment().diff(moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ"), 'years', true));
                            if (type === "display") {
                                return "<p class='m-0 p-0' style='width: 100px;'>" + data + "</p>";
                            } else {
                                return data;
                            }
                        }
                    },
                    {data: 'email', name: "email", width: 200,
                        "render": function (data, type, row) {
                            if (type === "display") {
                                return "<p class='m-0 p-0 text-truncate' style='width: 200px;'>" + data + "</p>";
                            } else {
                                return data;
                            }
                        }
                    },
                    {data: 'status', name: "status", width: 100,
                        "render": function (data, type, row) {

                            var statusMap = {"-1": {label: "Deleted", style: "danger"}, "0": {label: "Deactive", style: "warning"}, "1": {label: "Active", style: "success"}};

                            if (type === "display") {
                                return "<p class='m-0 p-0' style='width: 100px;'><span class='badge badge-" + statusMap[data].style + "'>" + statusMap[data].label + "</span></p>";
                            } else {
                                return data;
                            }
                        }
                    },
                    {
                        data: 'countryId', name: "countryId", width: 200,
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return data;
                            } else {
                                return "<p class='m-0 p-0 text-truncate' style='width: 200px;'>" + countriesMap[data] + "</p>";
                            }
                        }
                    },
                    {data: 'address', name: "address", width: 150,
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return data;
                            } else {
                                return "<p class='m-0 p-0' style='width: 150px;'>Will Be Show</p>";
                            }
                        }
                    },
                    {data: 'lang', name: "lang", width: 125,
                        "render": function (data, type, row) {
                            if (type === "display") {
                                return "<p class='m-0 p-0' style='width: 125px;'>" + languagesMap[data] + "</p>";
                            } else {
                                return data;
                            }
                        }
                    },
                    {data: 'theme', name: "theme", width: 150,
                        "render": function (data, type, row) {
                            if (type === "display") {
                                return "<p class='m-0 p-0' style='width: 150px;'>" + themesMap[data] + "</p>";
                            } else {
                                return data;
                            }
                        }
                    },
                    {data: 'timezone', name: "timezone", width: 250,
                        "render": function (data, type, row) {
                            if (type === "display") {
                                return "<p class='m-0 p-0 text-truncate' style='width: 250px;'>" + timezonesMap[data] + "</p>";
                            } else {
                                return data;
                            }
                        }
                    },
                    {data: 'creationDate', "type": "date", name: "creationDate", width: 200,
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ").format('DD/MM/YYYY HH:mm');
                            } else {
                                return "<p class='m-0 p-0' style='width: 200px;'>" + moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ").format('DD/MM/YYYY HH:mm') + "</p>";
                            }

                        }}
                ]
            });

            $('tbody', userTableElement).on('contextmenu', 'tr', function () {
                var rowId = $(this).data("row-id");
                if ($(this).hasClass("selected") === false) {
                    table.row(this).select();
                }
                alert("context on " + rowId);
            });

            table.on('select', function (e, dt, type, indexes) {
                //                alert("select");
                var rowsData = table.rows(indexes).data().toArray();
                var rowData = rowsData[0];
                enabled();
                //                alert("select" + JSON.stringify(rowData));
            }).on('deselect', function (e, dt, type, indexes) {
                //                alert("descelect");
                var rowsData = table.rows(indexes).data().toArray();
                var rowData = rowsData[0];
                disabled();
                //                alert("descelect" + JSON.stringify(rowData));
            });

            addNewUserPopupButton.on("click", function (event) {
                var passData = {};
                passData.callback = "actionCallback";
                BootstrapModalWrapperFactory.createAjaxModal({
                    message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                    passData: passData,
                    url: javatmp.settings.contextPath + "/user/GetCreateNewUserPopupController",
                    ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                });

            });
            updateUserButton.on("click", function (event) {
                //                var selectedCount = table.rows({selected: true}).count();
                var selectedData = table.rows({selected: true}).data();
                if (selectedData.length > 0) {
                    var selectedRecord = selectedData[0];
                    //                    alert("row[" + JSON.stringify(selectedRecord) + "]");
                    var passData = {};
                    passData.callback = "actionCallback";
                    passData.id = selectedRecord.id;
                    BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                        passData: passData,
                        url: javatmp.settings.contextPath + "/user/GetUpdateUserPopupController",
                        ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                    });
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }

            });

            deleteUserButton.on("click", function (event) {
                var selectedData = table.rows({selected: true}).data();
                if (selectedData.length > 0) {
                    var selectedRecord = selectedData[0];
                    //                    alert("row[" + JSON.stringify(selectedRecord) + "]");
                    var passData = {};
                    passData.callback = "actionCallback";
                    passData.id = selectedRecord.id;
                    BootstrapModalWrapperFactory.createModal({
                        message: "Are you sure you want to delete user ?",
                        title: "Confiramation",
                        closable: false,
                        closeByBackdrop: false,
                        buttons: [
                            {
                                label: "Cancel",
                                cssClass: "btn btn-secondary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    return modalWrapper.hide();
                                }
                            },
                            {
                                label: "Delete User " + selectedRecord.userName,
                                cssClass: "btn btn-danger",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    modalWrapper.hide();
                                    var m = BootstrapModalWrapperFactory.createModal({
                                        message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                                        closable: false,
                                        closeByBackdrop: false,
                                        closeByKeyboard: false
                                    });
                                    m.originalModal.find(".modal-dialog").css({transition: 'all 0.5s'});
                                    m.show();
                                    $.ajax({
                                        type: "POST",
                                        url: javatmp.settings.contextPath + "/user/DeleteUserController",
                                        data: passData,
//                                        dataType: "json",
//                                        contentType: "application/json; charset=UTF-8",
                                        success: function (data) {
                                            m.updateMessage(data.message);
                                            m.updateClosable(true);
                                            m.updateTitle("Deleted Action Response");

                                            toastr.success(data.message, 'SUCCESS', {
                                                timeOut: 3000,
                                                progressBar: true,
                                                rtl: javatmp.settings.isRTL,
                                                positionClass: javatmp.settings.isRTL === true ? "toast-top-left" : "toast-top-right"
                                            });

                                            // refresh users table:
                                            table.columns.adjust().draw();
                                        },
                                        error: function (data) {
                                            m.hide();
                                            toastr.error("Could Not complete the action", 'ERROR', {
                                                timeOut: 3000,
                                                progressBar: true,
                                                rtl: javatmp.settings.isRTL,
                                                positionClass: javatmp.settings.isRTL === true ? "toast-top-left" : "toast-top-right"
                                            });
//                                            alert("error" + JSON.stringify(data));
                                        }
                                    });
                                }
                            }
                        ]
                    }).show();
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }

            });

            window.actionCallback = function (callbackData) {
                if (callbackData.cancel === true) {
                } else {
                    table.columns.adjust().draw();
                }
            };


            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.

            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
                table.columns.adjust().draw();
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
                table.columns.adjust().draw();
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
                table.columns.adjust().draw();
            });
            /**
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                // it is important to destroy table before leaving current ajax page
                // so the fixedHeader will not be kept on site pages.
                table.clear();
                table.destroy(true);
                return true;
            });
        });
    </script>
</div>