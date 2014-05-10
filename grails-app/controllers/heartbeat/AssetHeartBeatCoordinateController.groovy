package heartbeat

class AssetHeartBeatCoordinateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [assetHeartBeatCoordinateInstanceList: AssetHeartBeatCoordinate.list(params), assetHeartBeatCoordinateInstanceTotal: AssetHeartBeatCoordinate.count()]
    }

    def create = {
        def assetHeartBeatCoordinateInstance = new AssetHeartBeatCoordinate()
        assetHeartBeatCoordinateInstance.properties = params
        return [assetHeartBeatCoordinateInstance: assetHeartBeatCoordinateInstance]
    }

    def save = {
        def assetHeartBeatCoordinateInstance = new AssetHeartBeatCoordinate(params)
        if (assetHeartBeatCoordinateInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'assetHeartBeatCoordinate.label', default: 'AssetHeartBeatCoordinate'), assetHeartBeatCoordinateInstance.id])}"
            redirect(action: "show", id: assetHeartBeatCoordinateInstance.id)
        }
        else {
            render(view: "create", model: [assetHeartBeatCoordinateInstance: assetHeartBeatCoordinateInstance])
        }
    }

    def show = {
        def assetHeartBeatCoordinateInstance = AssetHeartBeatCoordinate.get(params.id)
        if (!assetHeartBeatCoordinateInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assetHeartBeatCoordinate.label', default: 'AssetHeartBeatCoordinate'), params.id])}"
            redirect(action: "list")
        }
        else {
            [assetHeartBeatCoordinateInstance: assetHeartBeatCoordinateInstance]
        }
    }

    def edit = {
        def assetHeartBeatCoordinateInstance = AssetHeartBeatCoordinate.get(params.id)
        if (!assetHeartBeatCoordinateInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assetHeartBeatCoordinate.label', default: 'AssetHeartBeatCoordinate'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [assetHeartBeatCoordinateInstance: assetHeartBeatCoordinateInstance]
        }
    }

    def update = {
        def assetHeartBeatCoordinateInstance = AssetHeartBeatCoordinate.get(params.id)
        if (assetHeartBeatCoordinateInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (assetHeartBeatCoordinateInstance.version > version) {
                    
                    assetHeartBeatCoordinateInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'assetHeartBeatCoordinate.label', default: 'AssetHeartBeatCoordinate')] as Object[], "Another user has updated this AssetHeartBeatCoordinate while you were editing")
                    render(view: "edit", model: [assetHeartBeatCoordinateInstance: assetHeartBeatCoordinateInstance])
                    return
                }
            }
            assetHeartBeatCoordinateInstance.properties = params
            if (!assetHeartBeatCoordinateInstance.hasErrors() && assetHeartBeatCoordinateInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'assetHeartBeatCoordinate.label', default: 'AssetHeartBeatCoordinate'), assetHeartBeatCoordinateInstance.id])}"
                redirect(action: "show", id: assetHeartBeatCoordinateInstance.id)
            }
            else {
                render(view: "edit", model: [assetHeartBeatCoordinateInstance: assetHeartBeatCoordinateInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assetHeartBeatCoordinate.label', default: 'AssetHeartBeatCoordinate'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def assetHeartBeatCoordinateInstance = AssetHeartBeatCoordinate.get(params.id)
        if (assetHeartBeatCoordinateInstance) {
            try {
                assetHeartBeatCoordinateInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'assetHeartBeatCoordinate.label', default: 'AssetHeartBeatCoordinate'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'assetHeartBeatCoordinate.label', default: 'AssetHeartBeatCoordinate'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assetHeartBeatCoordinate.label', default: 'AssetHeartBeatCoordinate'), params.id])}"
            redirect(action: "list")
        }
    }
}
