

<%@ page import="heartbeat.DailyWeatherForecastData" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dailyWeatherForecastData.label', default: 'DailyWeatherForecastData')}" />
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
            <g:hasErrors bean="${dailyWeatherForecastDataInstance}">
            <div class="errors">
                <g:renderErrors bean="${dailyWeatherForecastDataInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${dailyWeatherForecastDataInstance?.id}" />
                <g:hiddenField name="version" value="${dailyWeatherForecastDataInstance?.version}" />
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="readings"><g:message code="dailyWeatherForecastData.readings.label" default="Readings" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastDataInstance, field: 'readings', 'errors')}">
                                    
<ul>
<g:each in="${dailyWeatherForecastDataInstance?.readings?}" var="r">
    <li><g:link controller="dailyWeatherForecastDataReading" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="dailyWeatherForecastDataReading" action="create" params="['dailyWeatherForecastData.id': dailyWeatherForecastDataInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'dailyWeatherForecastDataReading.label', default: 'DailyWeatherForecastDataReading')])}</g:link>

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
