

<%@ page import="heartbeat.HeartBeat" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'heartBeat.label', default: 'HeartBeat')}" />
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
            <g:hasErrors bean="${heartBeatInstance}">
            <div class="errors">
                <g:renderErrors bean="${heartBeatInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="end"><g:message code="heartBeat.end.label" default="End" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: heartBeatInstance, field: 'end', 'errors')}">
                                    <g:datePicker name="end" precision="day" value="${heartBeatInstance?.end}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="start"><g:message code="heartBeat.start.label" default="Start" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: heartBeatInstance, field: 'start', 'errors')}">
                                    <g:datePicker name="start" precision="day" value="${heartBeatInstance?.start}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="heartBeat.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: heartBeatInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${heartbeat.User.list()}" optionKey="id" value="${heartBeatInstance?.user?.id}"  />
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
