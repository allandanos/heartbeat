

<%@ page import="heartbeat.DailyWeatherForecast" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dailyWeatherForecast.label', default: 'DailyWeatherForecast')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${dailyWeatherForecastInstance}">
            <div class="errors">
                <g:renderErrors bean="${dailyWeatherForecastInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdate"><g:message code="dailyWeatherForecast.lastUpdate.label" default="Last Update" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastInstance, field: 'lastUpdate', 'errors')}">
                                    <g:datePicker name="lastUpdate" precision="day" value="${dailyWeatherForecastInstance?.lastUpdate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lat"><g:message code="dailyWeatherForecast.lat.label" default="Lat" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastInstance, field: 'lat', 'errors')}">
                                    <g:textField name="lat" value="${fieldValue(bean: dailyWeatherForecastInstance, field: 'lat')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lng"><g:message code="dailyWeatherForecast.lng.label" default="Lng" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastInstance, field: 'lng', 'errors')}">
                                    <g:textField name="lng" value="${fieldValue(bean: dailyWeatherForecastInstance, field: 'lng')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location"><g:message code="dailyWeatherForecast.location.label" default="Location" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastInstance, field: 'location', 'errors')}">
                                    <g:textField name="location" value="${dailyWeatherForecastInstance?.location}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="source"><g:message code="dailyWeatherForecast.source.label" default="Source" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastInstance, field: 'source', 'errors')}">
                                    <g:textField name="source" value="${dailyWeatherForecastInstance?.source}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
