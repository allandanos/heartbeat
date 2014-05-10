package heartbeat

class FloodReportController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [floodReportInstanceList: FloodReport.list(params), floodReportInstanceTotal: FloodReport.count()]
    }

    def create = {
        def floodReportInstance = new FloodReport()
        floodReportInstance.properties = params
        return [floodReportInstance: floodReportInstance]
    }

    def save = {
        def floodReportInstance = new FloodReport(params)
        if (floodReportInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'floodReport.label', default: 'FloodReport'), floodReportInstance.id])}"
            redirect(action: "show", id: floodReportInstance.id)
        }
        else {
            render(view: "create", model: [floodReportInstance: floodReportInstance])
        }
    }

    def show = {
        def floodReportInstance = FloodReport.get(params.id)
        if (!floodReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'floodReport.label', default: 'FloodReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            [floodReportInstance: floodReportInstance]
        }
    }

    def edit = {
        def floodReportInstance = FloodReport.get(params.id)
        if (!floodReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'floodReport.label', default: 'FloodReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [floodReportInstance: floodReportInstance]
        }
    }

    def update = {
        def floodReportInstance = FloodReport.get(params.id)
        if (floodReportInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (floodReportInstance.version > version) {
                    
                    floodReportInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'floodReport.label', default: 'FloodReport')] as Object[], "Another user has updated this FloodReport while you were editing")
                    render(view: "edit", model: [floodReportInstance: floodReportInstance])
                    return
                }
            }
            floodReportInstance.properties = params
            if (!floodReportInstance.hasErrors() && floodReportInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'floodReport.label', default: 'FloodReport'), floodReportInstance.id])}"
                redirect(action: "show", id: floodReportInstance.id)
            }
            else {
                render(view: "edit", model: [floodReportInstance: floodReportInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'floodReport.label', default: 'FloodReport'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def floodReportInstance = FloodReport.get(params.id)
        if (floodReportInstance) {
            try {
                floodReportInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'floodReport.label', default: 'FloodReport'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'floodReport.label', default: 'FloodReport'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'floodReport.label', default: 'FloodReport'), params.id])}"
            redirect(action: "list")
        }
    }
}
