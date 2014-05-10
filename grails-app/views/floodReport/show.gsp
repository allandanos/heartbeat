
<%@ page import="heartbeat.FloodReport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'floodReport.label', default: 'FloodReport')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="floodReport.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: floodReportInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="floodReport.details.label" default="Details" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: floodReportInstance, field: "details")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="floodReport.floodHeight.label" default="Flood Height" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: floodReportInstance, field: "floodHeight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="floodReport.floodHeightRating.label" default="Flood Height Rating" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: floodReportInstance, field: "floodHeightRating")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="floodReport.floodTime.label" default="Flood Time" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${floodReportInstance?.floodTime}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="floodReport.imageUrl.label" default="Image Url" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: floodReportInstance, field: "imageUrl")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="floodReport.lat.label" default="Lat" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: floodReportInstance, field: "lat")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="floodReport.lng.label" default="Lng" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: floodReportInstance, field: "lng")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${floodReportInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
