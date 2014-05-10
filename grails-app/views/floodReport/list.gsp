
<%@ page import="heartbeat.FloodReport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'floodReport.label', default: 'FloodReport')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'floodReport.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="details" title="${message(code: 'floodReport.details.label', default: 'Details')}" />
                        
                            <g:sortableColumn property="floodHeight" title="${message(code: 'floodReport.floodHeight.label', default: 'Flood Height')}" />
                        
                            <g:sortableColumn property="floodHeightRating" title="${message(code: 'floodReport.floodHeightRating.label', default: 'Flood Height Rating')}" />
                        
                            <g:sortableColumn property="floodTime" title="${message(code: 'floodReport.floodTime.label', default: 'Flood Time')}" />
                        
                            <g:sortableColumn property="imageUrl" title="${message(code: 'floodReport.imageUrl.label', default: 'Image Url')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${floodReportInstanceList}" status="i" var="floodReportInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${floodReportInstance.id}">${fieldValue(bean: floodReportInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: floodReportInstance, field: "details")}</td>
                        
                            <td>${fieldValue(bean: floodReportInstance, field: "floodHeight")}</td>
                        
                            <td>${fieldValue(bean: floodReportInstance, field: "floodHeightRating")}</td>
                        
                            <td><g:formatDate date="${floodReportInstance.floodTime}" /></td>
                        
                            <td>${fieldValue(bean: floodReportInstance, field: "imageUrl")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${floodReportInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
