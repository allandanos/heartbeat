
<%@ page import="heartbeat.DailyWeatherForecast" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dailyWeatherForecast.label', default: 'DailyWeatherForecast')}" />
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
                            <td valign="top" class="name"><g:message code="dailyWeatherForecast.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dailyWeatherForecastInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dailyWeatherForecast.lastUpdate.label" default="Last Update" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${dailyWeatherForecastInstance?.lastUpdate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dailyWeatherForecast.lat.label" default="Lat" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dailyWeatherForecastInstance, field: "lat")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dailyWeatherForecast.lng.label" default="Lng" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dailyWeatherForecastInstance, field: "lng")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dailyWeatherForecast.location.label" default="Location" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dailyWeatherForecastInstance, field: "location")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dailyWeatherForecast.source.label" default="Source" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dailyWeatherForecastInstance, field: "source")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${dailyWeatherForecastInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>