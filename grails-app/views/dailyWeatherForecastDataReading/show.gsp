
<%@ page import="heartbeat.DailyWeatherForecastDataReading" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dailyWeatherForecastDataReading.label', default: 'DailyWeatherForecastDataReading')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dailyWeatherForecastDataReading.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dailyWeatherForecastDataReading.rainfall.label" default="Rainfall" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: "rainfall")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dailyWeatherForecastDataReading.realFeel.label" default="Real Feel" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: "realFeel")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dailyWeatherForecastDataReading.temperature.label" default="Temperature" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: "temperature")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dailyWeatherForecastDataReading.time.label" default="Time" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: "time")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dailyWeatherForecastDataReading.windspeed.label" default="Windspeed" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: "windspeed")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dailyWeatherForecastDataReading.relativeHum.label" default="Relative Hum" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: "relativeHum")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dailyWeatherForecastDataReading.windDir.label" default="Wind Dir" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: "windDir")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dailyWeatherForecastDataReading.icon.label" default="Icon" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: "icon")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dailyWeatherForecastDataReading.data.label" default="Data" /></td>
                            
                            <td valign="top" class="value"><g:link controller="dailyWeatherForecastData" action="show" id="${dailyWeatherForecastDataReadingInstance?.data?.id}">${dailyWeatherForecastDataReadingInstance?.data?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${dailyWeatherForecastDataReadingInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
