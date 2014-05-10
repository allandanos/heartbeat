

<%@ page import="heartbeat.HeartBeatCoordinate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'heartBeatCoordinate.label', default: 'HeartBeatCoordinate')}" />
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
            <g:hasErrors bean="${heartBeatCoordinateInstance}">
            <div class="errors">
                <g:renderErrors bean="${heartBeatCoordinateInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="heartBeat"><g:message code="heartBeatCoordinate.heartBeat.label" default="Heart Beat" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: heartBeatCoordinateInstance, field: 'heartBeat', 'errors')}">
                                    <g:select name="heartBeat.id" from="${heartbeat.HeartBeat.list()}" optionKey="id" value="${heartBeatCoordinateInstance?.heartBeat?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lat"><g:message code="heartBeatCoordinate.lat.label" default="Lat" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: heartBeatCoordinateInstance, field: 'lat', 'errors')}">
                                    <g:textField name="lat" value="${fieldValue(bean: heartBeatCoordinateInstance, field: 'lat')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lng"><g:message code="heartBeatCoordinate.lng.label" default="Lng" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: heartBeatCoordinateInstance, field: 'lng', 'errors')}">
                                    <g:textField name="lng" value="${fieldValue(bean: heartBeatCoordinateInstance, field: 'lng')}" />
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
