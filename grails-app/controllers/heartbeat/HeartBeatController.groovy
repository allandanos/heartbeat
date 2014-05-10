package heartbeat

class HeartBeatController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [heartBeatInstanceList: HeartBeat.list(params), heartBeatInstanceTotal: HeartBeat.count()]
    }

    def create = {
        def heartBeatInstance = new HeartBeat()
        heartBeatInstance.properties = params
        return [heartBeatInstance: heartBeatInstance]
    }

    def save = {
        def heartBeatInstance = new HeartBeat(params)
        if (heartBeatInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'heartBeat.label', default: 'HeartBeat'), heartBeatInstance.id])}"
            redirect(action: "show", id: heartBeatInstance.id)
        }
        else {
            render(view: "create", model: [heartBeatInstance: heartBeatInstance])
        }
    }

    def show = {
        def heartBeatInstance = HeartBeat.get(params.id)
        if (!heartBeatInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'heartBeat.label', default: 'HeartBeat'), params.id])}"
            redirect(action: "list")
        }
        else {
            [heartBeatInstance: heartBeatInstance]
        }
    }

    def edit = {
        def heartBeatInstance = HeartBeat.get(params.id)
        if (!heartBeatInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'heartBeat.label', default: 'HeartBeat'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [heartBeatInstance: heartBeatInstance]
        }
    }

    def update = {
        def heartBeatInstance = HeartBeat.get(params.id)
        if (heartBeatInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (heartBeatInstance.version > version) {
                    
                    heartBeatInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'heartBeat.label', default: 'HeartBeat')] as Object[], "Another user has updated this HeartBeat while you were editing")
                    render(view: "edit", model: [heartBeatInstance: heartBeatInstance])
                    return
                }
            }
            heartBeatInstance.properties = params
            if (!heartBeatInstance.hasErrors() && heartBeatInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'heartBeat.label', default: 'HeartBeat'), heartBeatInstance.id])}"
                redirect(action: "show", id: heartBeatInstance.id)
            }
            else {
                render(view: "edit", model: [heartBeatInstance: heartBeatInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'heartBeat.label', default: 'HeartBeat'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def heartBeatInstance = HeartBeat.get(params.id)
        if (heartBeatInstance) {
            try {
                heartBeatInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'heartBeat.label', default: 'HeartBeat'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'heartBeat.label', default: 'HeartBeat'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'heartBeat.label', default: 'HeartBeat'), params.id])}"
            redirect(action: "list")
        }
    }
}
