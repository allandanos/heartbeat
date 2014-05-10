package heartbeat

class HeartBeatCoordinateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [heartBeatCoordinateInstanceList: HeartBeatCoordinate.list(params), heartBeatCoordinateInstanceTotal: HeartBeatCoordinate.count()]
    }

    def create = {
        def heartBeatCoordinateInstance = new HeartBeatCoordinate()
        heartBeatCoordinateInstance.properties = params
        return [heartBeatCoordinateInstance: heartBeatCoordinateInstance]
    }

    def save = {
        def heartBeatCoordinateInstance = new HeartBeatCoordinate(params)
        if (heartBeatCoordinateInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'heartBeatCoordinate.label', default: 'HeartBeatCoordinate'), heartBeatCoordinateInstance.id])}"
            redirect(action: "show", id: heartBeatCoordinateInstance.id)
        }
        else {
            render(view: "create", model: [heartBeatCoordinateInstance: heartBeatCoordinateInstance])
        }
    }

    def show = {
        def heartBeatCoordinateInstance = HeartBeatCoordinate.get(params.id)
        if (!heartBeatCoordinateInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'heartBeatCoordinate.label', default: 'HeartBeatCoordinate'), params.id])}"
            redirect(action: "list")
        }
        else {
            [heartBeatCoordinateInstance: heartBeatCoordinateInstance]
        }
    }

    def edit = {
        def heartBeatCoordinateInstance = HeartBeatCoordinate.get(params.id)
        if (!heartBeatCoordinateInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'heartBeatCoordinate.label', default: 'HeartBeatCoordinate'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [heartBeatCoordinateInstance: heartBeatCoordinateInstance]
        }
    }

    def update = {
        def heartBeatCoordinateInstance = HeartBeatCoordinate.get(params.id)
        if (heartBeatCoordinateInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (heartBeatCoordinateInstance.version > version) {
                    
                    heartBeatCoordinateInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'heartBeatCoordinate.label', default: 'HeartBeatCoordinate')] as Object[], "Another user has updated this HeartBeatCoordinate while you were editing")
                    render(view: "edit", model: [heartBeatCoordinateInstance: heartBeatCoordinateInstance])
                    return
                }
            }
            heartBeatCoordinateInstance.properties = params
            if (!heartBeatCoordinateInstance.hasErrors() && heartBeatCoordinateInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'heartBeatCoordinate.label', default: 'HeartBeatCoordinate'), heartBeatCoordinateInstance.id])}"
                redirect(action: "show", id: heartBeatCoordinateInstance.id)
            }
            else {
                render(view: "edit", model: [heartBeatCoordinateInstance: heartBeatCoordinateInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'heartBeatCoordinate.label', default: 'HeartBeatCoordinate'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def heartBeatCoordinateInstance = HeartBeatCoordinate.get(params.id)
        if (heartBeatCoordinateInstance) {
            try {
                heartBeatCoordinateInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'heartBeatCoordinate.label', default: 'HeartBeatCoordinate'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'heartBeatCoordinate.label', default: 'HeartBeatCoordinate'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'heartBeatCoordinate.label', default: 'HeartBeatCoordinate'), params.id])}"
            redirect(action: "list")
        }
    }
}
