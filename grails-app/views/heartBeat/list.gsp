
<%@ page import="heartbeat.HeartBeat" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'heartBeat.label', default: 'HeartBeat')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'heartBeat.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="end" title="${message(code: 'heartBeat.end.label', default: 'End')}" />
                        
                            <g:sortableColumn property="start" title="${message(code: 'heartBeat.start.label', default: 'Start')}" />
                        
                            <th><g:message code="heartBeat.user.label" default="User" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${heartBeatInstanceList}" status="i" var="heartBeatInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${heartBeatInstance.id}">${fieldValue(bean: heartBeatInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${heartBeatInstance.end}" /></td>
                        
                            <td><g:formatDate date="${heartBeatInstance.start}" /></td>
                        
                            <td>${fieldValue(bean: heartBeatInstance, field: "user")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${heartBeatInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
