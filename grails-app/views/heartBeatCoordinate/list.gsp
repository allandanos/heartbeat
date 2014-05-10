
<%@ page import="heartbeat.HeartBeatCoordinate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'heartBeatCoordinate.label', default: 'HeartBeatCoordinate')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'heartBeatCoordinate.id.label', default: 'Id')}" />
                        
                            <th><g:message code="heartBeatCoordinate.heartBeat.label" default="Heart Beat" /></th>
                        
                            <g:sortableColumn property="lat" title="${message(code: 'heartBeatCoordinate.lat.label', default: 'Lat')}" />
                        
                            <g:sortableColumn property="lon" title="${message(code: 'heartBeatCoordinate.lon.label', default: 'Lon')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${heartBeatCoordinateInstanceList}" status="i" var="heartBeatCoordinateInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${heartBeatCoordinateInstance.id}">${fieldValue(bean: heartBeatCoordinateInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: heartBeatCoordinateInstance, field: "heartBeat")}</td>
                        
                            <td>${fieldValue(bean: heartBeatCoordinateInstance, field: "lat")}</td>
                        
                            <td>${fieldValue(bean: heartBeatCoordinateInstance, field: "lon")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${heartBeatCoordinateInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
