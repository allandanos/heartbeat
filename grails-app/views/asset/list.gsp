
<%@ page import="heartbeat.Asset" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'asset.label', default: 'Asset')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'asset.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="mobile" title="${message(code: 'asset.mobile.label', default: 'Mobile')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'asset.name.label', default: 'Name')}" />
                        
                            <th><g:message code="asset.type.label" default="Type" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${assetInstanceList}" status="i" var="assetInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${assetInstance.id}">${fieldValue(bean: assetInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: assetInstance, field: "mobile")}</td>
                        
                            <td>${fieldValue(bean: assetInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: assetInstance, field: "type")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${assetInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
