
<%@ page import="heartbeat.AssetHeartBeat" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'assetHeartBeat.label', default: 'AssetHeartBeat')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'assetHeartBeat.id.label', default: 'Id')}" />
                        
                            <th><g:message code="assetHeartBeat.asset.label" default="Asset" /></th>
                        
                            <g:sortableColumn property="end" title="${message(code: 'assetHeartBeat.end.label', default: 'End')}" />
                        
                            <g:sortableColumn property="start" title="${message(code: 'assetHeartBeat.start.label', default: 'Start')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${assetHeartBeatInstanceList}" status="i" var="assetHeartBeatInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${assetHeartBeatInstance.id}">${fieldValue(bean: assetHeartBeatInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: assetHeartBeatInstance, field: "asset")}</td>
                        
                            <td><g:formatDate date="${assetHeartBeatInstance.end}" /></td>
                        
                            <td><g:formatDate date="${assetHeartBeatInstance.start}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${assetHeartBeatInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
