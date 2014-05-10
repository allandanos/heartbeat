package heartbeat

class AssetTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [assetTypeInstanceList: AssetType.list(params), assetTypeInstanceTotal: AssetType.count()]
    }

    def create = {
        def assetTypeInstance = new AssetType()
        assetTypeInstance.properties = params
        return [assetTypeInstance: assetTypeInstance]
    }

    def save = {
        def assetTypeInstance = new AssetType(params)
        if (assetTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'assetType.label', default: 'AssetType'), assetTypeInstance.id])}"
            redirect(action: "show", id: assetTypeInstance.id)
        }
        else {
            render(view: "create", model: [assetTypeInstance: assetTypeInstance])
        }
    }

    def show = {
        def assetTypeInstance = AssetType.get(params.id)
        if (!assetTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assetType.label', default: 'AssetType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [assetTypeInstance: assetTypeInstance]
        }
    }

    def edit = {
        def assetTypeInstance = AssetType.get(params.id)
        if (!assetTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assetType.label', default: 'AssetType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [assetTypeInstance: assetTypeInstance]
        }
    }

    def update = {
        def assetTypeInstance = AssetType.get(params.id)
        if (assetTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (assetTypeInstance.version > version) {
                    
                    assetTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'assetType.label', default: 'AssetType')] as Object[], "Another user has updated this AssetType while you were editing")
                    render(view: "edit", model: [assetTypeInstance: assetTypeInstance])
                    return
                }
            }
            assetTypeInstance.properties = params
            if (!assetTypeInstance.hasErrors() && assetTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'assetType.label', default: 'AssetType'), assetTypeInstance.id])}"
                redirect(action: "show", id: assetTypeInstance.id)
            }
            else {
                render(view: "edit", model: [assetTypeInstance: assetTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assetType.label', default: 'AssetType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def assetTypeInstance = AssetType.get(params.id)
        if (assetTypeInstance) {
            try {
                assetTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'assetType.label', default: 'AssetType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'assetType.label', default: 'AssetType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assetType.label', default: 'AssetType'), params.id])}"
            redirect(action: "list")
        }
    }
}
