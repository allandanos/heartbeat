
<%@ page import="heartbeat.AssetHeartBeatCoordinate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'assetHeartBeatCoordinate.label', default: 'AssetHeartBeatCoordinate')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'assetHeartBeatCoordinate.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'assetHeartBeatCoordinate.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lat" title="${message(code: 'assetHeartBeatCoordinate.lat.label', default: 'Lat')}" />
                        
                            <g:sortableColumn property="lng" title="${message(code: 'assetHeartBeatCoordinate.lng.label', default: 'Lng')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${assetHeartBeatCoordinateInstanceList}" status="i" var="assetHeartBeatCoordinateInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${assetHeartBeatCoordinateInstance.id}">${fieldValue(bean: assetHeartBeatCoordinateInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${assetHeartBeatCoordinateInstance.dateCreated}" /></td>
                        
                            <td>${fieldValue(bean: assetHeartBeatCoordinateInstance, field: "lat")}</td>
                        
                            <td>${fieldValue(bean: assetHeartBeatCoordinateInstance, field: "lng")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${assetHeartBeatCoordinateInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
