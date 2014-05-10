
<%@ page import="heartbeat.DailyWeatherForecastDataReading" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dailyWeatherForecastDataReading.label', default: 'DailyWeatherForecastDataReading')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'dailyWeatherForecastDataReading.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="rainfall" title="${message(code: 'dailyWeatherForecastDataReading.rainfall.label', default: 'Rainfall')}" />
                        
                            <g:sortableColumn property="realFeel" title="${message(code: 'dailyWeatherForecastDataReading.realFeel.label', default: 'Real Feel')}" />
                        
                            <g:sortableColumn property="temperature" title="${message(code: 'dailyWeatherForecastDataReading.temperature.label', default: 'Temperature')}" />
                        
                            <g:sortableColumn property="time" title="${message(code: 'dailyWeatherForecastDataReading.time.label', default: 'Time')}" />
                        
                            <g:sortableColumn property="windspeed" title="${message(code: 'dailyWeatherForecastDataReading.windspeed.label', default: 'Windspeed')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dailyWeatherForecastDataReadingInstanceList}" status="i" var="dailyWeatherForecastDataReadingInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${dailyWeatherForecastDataReadingInstance.id}">${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: "rainfall")}</td>
                        
                            <td>${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: "realFeel")}</td>
                        
                            <td>${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: "temperature")}</td>
                        
                            <td>${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: "time")}</td>
                        
                            <td>${fieldValue(bean: dailyWeatherForecastDataReadingInstance, field: "windspeed")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dailyWeatherForecastDataReadingInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
