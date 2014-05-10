

<%@ page import="heartbeat.FloodReport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'floodReport.label', default: 'FloodReport')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${floodReportInstance}">
            <div class="errors">
                <g:renderErrors bean="${floodReportInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${floodReportInstance?.id}" />
                <g:hiddenField name="version" value="${floodReportInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="details"><g:message code="floodReport.details.label" default="Details" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floodReportInstance, field: 'details', 'errors')}">
                                    <g:textField name="details" value="${floodReportInstance?.details}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="floodHeight"><g:message code="floodReport.floodHeight.label" default="Flood Height" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floodReportInstance, field: 'floodHeight', 'errors')}">
                                    <g:textField name="floodHeight" value="${floodReportInstance?.floodHeight}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="floodHeightRating"><g:message code="floodReport.floodHeightRating.label" default="Flood Height Rating" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floodReportInstance, field: 'floodHeightRating', 'errors')}">
                                    <g:textField name="floodHeightRating" value="${fieldValue(bean: floodReportInstance, field: 'floodHeightRating')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="floodTime"><g:message code="floodReport.floodTime.label" default="Flood Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floodReportInstance, field: 'floodTime', 'errors')}">
                                    <g:datePicker name="floodTime" precision="day" value="${floodReportInstance?.floodTime}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="imageUrl"><g:message code="floodReport.imageUrl.label" default="Image Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floodReportInstance, field: 'imageUrl', 'errors')}">
                                    <g:textField name="imageUrl" value="${floodReportInstance?.imageUrl}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lat"><g:message code="floodReport.lat.label" default="Lat" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floodReportInstance, field: 'lat', 'errors')}">
                                    <g:textField name="lat" value="${fieldValue(bean: floodReportInstance, field: 'lat')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lng"><g:message code="floodReport.lng.label" default="Lng" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: floodReportInstance, field: 'lng', 'errors')}">
                                    <g:textField name="lng" value="${fieldValue(bean: floodReportInstance, field: 'lng')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
