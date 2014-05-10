

<%@ page import="heartbeat.DailyWeatherForecastData" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dailyWeatherForecastData.label', default: 'DailyWeatherForecastData')}" />
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
            <g:hasErrors bean="${dailyWeatherForecastDataInstance}">
            <div class="errors">
                <g:renderErrors bean="${dailyWeatherForecastDataInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="forecast"><g:message code="dailyWeatherForecastData.forecast.label" default="Forecast" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastDataInstance, field: 'forecast', 'errors')}">
                                    <g:select name="forecast.id" from="${heartbeat.DailyWeatherForecast.list()}" optionKey="id" value="${dailyWeatherForecastDataInstance?.forecast?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date"><g:message code="dailyWeatherForecastData.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastDataInstance, field: 'date', 'errors')}">
                                    <g:datePicker name="date" precision="day" value="${dailyWeatherForecastDataInstance?.date}"  />
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
