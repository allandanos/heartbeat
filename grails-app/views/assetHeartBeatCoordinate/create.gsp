

<%@ page import="heartbeat.AssetHeartBeatCoordinate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'assetHeartBeatCoordinate.label', default: 'AssetHeartBeatCoordinate')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${assetHeartBeatCoordinateInstance}">
            <div class="errors">
                <g:renderErrors bean="${assetHeartBeatCoordinateInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lat"><g:message code="assetHeartBeatCoordinate.lat.label" default="Lat" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: assetHeartBeatCoordinateInstance, field: 'lat', 'errors')}">
                                    <g:textField name="lat" value="${fieldValue(bean: assetHeartBeatCoordinateInstance, field: 'lat')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lon"><g:message code="assetHeartBeatCoordinate.lon.label" default="Lon" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: assetHeartBeatCoordinateInstance, field: 'lon', 'errors')}">
                                    <g:textField name="lon" value="${fieldValue(bean: assetHeartBeatCoordinateInstance, field: 'lon')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
