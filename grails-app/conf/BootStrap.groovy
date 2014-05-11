import org.codehaus.groovy.grails.commons.ApplicationAttributes
import grails.util.Environment;
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH

import heartbeat.*

class BootStrap {

    def syncService
    
    def authenticateService
    
    def init = { servletContext ->
        
        /**
         * The following is a fix for the Grails Runtime Exception : Broken pipe
         * when the application has been left idle for a time and one tries to
         * login.
         * ref: http://sacharya.com/grails-dbcp-stale-connections/
         */
        def ctx=servletContext.getAttribute(ApplicationAttributes.APPLICATION_CONTEXT)
        def dataSource = ctx.dataSourceUnproxied
		
        dataSource.setMinEvictableIdleTimeMillis(1000 * 60 * 30)
        dataSource.setTimeBetweenEvictionRunsMillis(1000 * 60 * 30)
        dataSource.setNumTestsPerEvictionRun(3)
		
        dataSource.setTestOnBorrow(true)
        dataSource.setTestWhileIdle(false)
        dataSource.setTestOnReturn(false)
        dataSource.setValidationQuery("SELECT 1")

        log.info "------- Data Source Info --------"		
        dataSource.properties.each { log.info it }
        log.info "---------------------------------"
        
        initUserRoles()
        
    }
    
    def destroy = {
        
    }
    
    def initUserRoles = {
        
        Role roleUser
        Role roleAdmin
        
        User userUser
        User userAdmin
        
        if (Role.count() == 0) {
            roleUser = new Role(authority:'ROLE_USER', description:'App user').save(flush:true, failOnError:true)
            roleAdmin = new Role(authority:'ROLE_ADMIN', description:'Admin user').save(flush:true, failOnError:true)
            log.info "Roles added."
        } else {
            roleUser = Role.findByAuthority('ROLE_USER');
            roleAdmin = Role.findByAuthority('ROLE_ADMIN');
        }
        
        if (!User.findByUsername('user')) {
            //Adding ApiUsers
            userUser = new User(username:'user',
                userRealName:'User',
                enabled: true,
                emailShow: true,
                email: 'admin@heartbeat.com.ph',
                passwd: authenticateService.encodePassword('user')).save(flush:true, failOnError:true)
            log.info "Admin user created."
            //Note that here we associate users with their respective roles
            roleAdmin.addToPeople(userUser)
            log.info "Admin Role mapped to users."
        } else {
            log.debug "username:user already present"
        }
		
        if (!User.findByUsername('admin')) {
            //Adding ApiUsers
            userAdmin = new User(username:'admin',
                userRealName:'Administrator',
                enabled: true,
                emailShow: true,
                email: 'admin@heartbeat.com.ph',
                passwd: authenticateService.encodePassword('admin')).save(flush:true, failOnError:true)
            log.info "Admin admin created." 
            //Note that here we associate users with their respective roles
            roleAdmin.addToPeople(userAdmin)
            roleAdmin.addToPeople(userUser)
            log.info "Admin Role mapped to users."
        } else {
            log.debug "username:admin already present"
        }
        
        
    }
}
