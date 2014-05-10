

<%@ page import="heartbeat.DailyWeatherForecastDataReading" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dailyWeatherForecastDataReading.label', default: 'DailyWeatherForecastDataReading')}" />
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
            <g:hasErrors bean="${dailyWeatherForecastDataReadingInstance}">
            <div class="errors">
                <g:renderErrors bean="${dailyWeatherForecastDataReadingInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${dailyWeatherForecastDataReadingInstance?.id}" />
                <g:hiddenField name="version" value="${dailyWeatherForecastDataReadingInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rainfall"><g:message code="dailyWeatherForecastDataReading.rainfall.label" default="Rainfall" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastDataReadingInstance, field: 'rainfall', 'errors')}">
                                    <g:textField name="rainfall" value="${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: 'rainfall')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="realFeel"><g:message code="dailyWeatherForecastDataReading.realFeel.label" default="Real Feel" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastDataReadingInstance, field: 'realFeel', 'errors')}">
                                    <g:textField name="realFeel" value="${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: 'realFeel')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="temperature"><g:message code="dailyWeatherForecastDataReading.temperature.label" default="Temperature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastDataReadingInstance, field: 'temperature', 'errors')}">
                                    <g:textField name="temperature" value="${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: 'temperature')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="time"><g:message code="dailyWeatherForecastDataReading.time.label" default="Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastDataReadingInstance, field: 'time', 'errors')}">
                                    <g:textField name="time" value="${dailyWeatherForecastDataReadingInstance?.time}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="windspeed"><g:message code="dailyWeatherForecastDataReading.windspeed.label" default="Windspeed" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastDataReadingInstance, field: 'windspeed', 'errors')}">
                                    <g:textField name="windspeed" value="${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: 'windspeed')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="relativeHum"><g:message code="dailyWeatherForecastDataReading.relativeHum.label" default="Relative Hum" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastDataReadingInstance, field: 'relativeHum', 'errors')}">
                                    <g:textField name="relativeHum" value="${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: 'relativeHum')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="windDir"><g:message code="dailyWeatherForecastDataReading.windDir.label" default="Wind Dir" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastDataReadingInstance, field: 'windDir', 'errors')}">
                                    <g:textField name="windDir" value="${dailyWeatherForecastDataReadingInstance?.windDir}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="icon"><g:message code="dailyWeatherForecastDataReading.icon.label" default="Icon" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastDataReadingInstance, field: 'icon', 'errors')}">
                                    <g:textField name="icon" value="${dailyWeatherForecastDataReadingInstance?.icon}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="data"><g:message code="dailyWeatherForecastDataReading.data.label" default="Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dailyWeatherForecastDataReadingInstance, field: 'data', 'errors')}">
                                    <g:select name="data.id" from="${heartbeat.DailyWeatherForecastData.list()}" optionKey="id" value="${dailyWeatherForecastDataReadingInstance?.data?.id}" noSelection="['null': '']" />
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
