package heartbeat

class AssetHeartBeatController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [assetHeartBeatInstanceList: AssetHeartBeat.list(params), assetHeartBeatInstanceTotal: AssetHeartBeat.count()]
    }

    def create = {
        def assetHeartBeatInstance = new AssetHeartBeat()
        assetHeartBeatInstance.properties = params
        return [assetHeartBeatInstance: assetHeartBeatInstance]
    }

    def save = {
        def assetHeartBeatInstance = new AssetHeartBeat(params)
        if (assetHeartBeatInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'assetHeartBeat.label', default: 'AssetHeartBeat'), assetHeartBeatInstance.id])}"
            redirect(action: "show", id: assetHeartBeatInstance.id)
        }
        else {
            render(view: "create", model: [assetHeartBeatInstance: assetHeartBeatInstance])
        }
    }

    def show = {
        def assetHeartBeatInstance = AssetHeartBeat.get(params.id)
        if (!assetHeartBeatInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assetHeartBeat.label', default: 'AssetHeartBeat'), params.id])}"
            redirect(action: "list")
        }
        else {
            [assetHeartBeatInstance: assetHeartBeatInstance]
        }
    }

    def edit = {
        def assetHeartBeatInstance = AssetHeartBeat.get(params.id)
        if (!assetHeartBeatInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assetHeartBeat.label', default: 'AssetHeartBeat'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [assetHeartBeatInstance: assetHeartBeatInstance]
        }
    }

    def update = {
        def assetHeartBeatInstance = AssetHeartBeat.get(params.id)
        if (assetHeartBeatInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (assetHeartBeatInstance.version > version) {
                    
                    assetHeartBeatInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'assetHeartBeat.label', default: 'AssetHeartBeat')] as Object[], "Another user has updated this AssetHeartBeat while you were editing")
                    render(view: "edit", model: [assetHeartBeatInstance: assetHeartBeatInstance])
                    return
                }
            }
            assetHeartBeatInstance.properties = params
            if (!assetHeartBeatInstance.hasErrors() && assetHeartBeatInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'assetHeartBeat.label', default: 'AssetHeartBeat'), assetHeartBeatInstance.id])}"
                redirect(action: "show", id: assetHeartBeatInstance.id)
            }
            else {
                render(view: "edit", model: [assetHeartBeatInstance: assetHeartBeatInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assetHeartBeat.label', default: 'AssetHeartBeat'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def assetHeartBeatInstance = AssetHeartBeat.get(params.id)
        if (assetHeartBeatInstance) {
            try {
                assetHeartBeatInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'assetHeartBeat.label', default: 'AssetHeartBeat'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'assetHeartBeat.label', default: 'AssetHeartBeat'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assetHeartBeat.label', default: 'AssetHeartBeat'), params.id])}"
            redirect(action: "list")
        }
    }
}
