package heartbeat

class DailyWeatherForecastDataController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dailyWeatherForecastDataInstanceList: DailyWeatherForecastData.list(params), dailyWeatherForecastDataInstanceTotal: DailyWeatherForecastData.count()]
    }

    def create = {
        def dailyWeatherForecastDataInstance = new DailyWeatherForecastData()
        dailyWeatherForecastDataInstance.properties = params
        return [dailyWeatherForecastDataInstance: dailyWeatherForecastDataInstance]
    }

    def save = {
        def dailyWeatherForecastDataInstance = new DailyWeatherForecastData(params)
        if (dailyWeatherForecastDataInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dailyWeatherForecastData.label', default: 'DailyWeatherForecastData'), dailyWeatherForecastDataInstance.id])}"
            redirect(action: "show", id: dailyWeatherForecastDataInstance.id)
        }
        else {
            render(view: "create", model: [dailyWeatherForecastDataInstance: dailyWeatherForecastDataInstance])
        }
    }

    def show = {
        def dailyWeatherForecastDataInstance = DailyWeatherForecastData.get(params.id)
        if (!dailyWeatherForecastDataInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dailyWeatherForecastData.label', default: 'DailyWeatherForecastData'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dailyWeatherForecastDataInstance: dailyWeatherForecastDataInstance]
        }
    }

    def edit = {
        def dailyWeatherForecastDataInstance = DailyWeatherForecastData.get(params.id)
        if (!dailyWeatherForecastDataInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dailyWeatherForecastData.label', default: 'DailyWeatherForecastData'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [dailyWeatherForecastDataInstance: dailyWeatherForecastDataInstance]
        }
    }

    def update = {
        def dailyWeatherForecastDataInstance = DailyWeatherForecastData.get(params.id)
        if (dailyWeatherForecastDataInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dailyWeatherForecastDataInstance.version > version) {
                    
                    dailyWeatherForecastDataInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dailyWeatherForecastData.label', default: 'DailyWeatherForecastData')] as Object[], "Another user has updated this DailyWeatherForecastData while you were editing")
                    render(view: "edit", model: [dailyWeatherForecastDataInstance: dailyWeatherForecastDataInstance])
                    return
                }
            }
            dailyWeatherForecastDataInstance.properties = params
            if (!dailyWeatherForecastDataInstance.hasErrors() && dailyWeatherForecastDataInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dailyWeatherForecastData.label', default: 'DailyWeatherForecastData'), dailyWeatherForecastDataInstance.id])}"
                redirect(action: "show", id: dailyWeatherForecastDataInstance.id)
            }
            else {
                render(view: "edit", model: [dailyWeatherForecastDataInstance: dailyWeatherForecastDataInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dailyWeatherForecastData.label', default: 'DailyWeatherForecastData'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dailyWeatherForecastDataInstance = DailyWeatherForecastData.get(params.id)
        if (dailyWeatherForecastDataInstance) {
            try {
                dailyWeatherForecastDataInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dailyWeatherForecastData.label', default: 'DailyWeatherForecastData'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dailyWeatherForecastData.label', default: 'DailyWeatherForecastData'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dailyWeatherForecastData.label', default: 'DailyWeatherForecastData'), params.id])}"
            redirect(action: "list")
        }
    }
}
