package heartbeat

class DailyWeatherForecastDataReadingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dailyWeatherForecastDataReadingInstanceList: DailyWeatherForecastDataReading.list(params), dailyWeatherForecastDataReadingInstanceTotal: DailyWeatherForecastDataReading.count()]
    }

    def create = {
        def dailyWeatherForecastDataReadingInstance = new DailyWeatherForecastDataReading()
        dailyWeatherForecastDataReadingInstance.properties = params
        return [dailyWeatherForecastDataReadingInstance: dailyWeatherForecastDataReadingInstance]
    }

    def save = {
        def dailyWeatherForecastDataReadingInstance = new DailyWeatherForecastDataReading(params)
        if (dailyWeatherForecastDataReadingInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dailyWeatherForecastDataReading.label', default: 'DailyWeatherForecastDataReading'), dailyWeatherForecastDataReadingInstance.id])}"
            redirect(action: "show", id: dailyWeatherForecastDataReadingInstance.id)
        }
        else {
            render(view: "create", model: [dailyWeatherForecastDataReadingInstance: dailyWeatherForecastDataReadingInstance])
        }
    }

    def show = {
        def dailyWeatherForecastDataReadingInstance = DailyWeatherForecastDataReading.get(params.id)
        if (!dailyWeatherForecastDataReadingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dailyWeatherForecastDataReading.label', default: 'DailyWeatherForecastDataReading'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dailyWeatherForecastDataReadingInstance: dailyWeatherForecastDataReadingInstance]
        }
    }

    def edit = {
        def dailyWeatherForecastDataReadingInstance = DailyWeatherForecastDataReading.get(params.id)
        if (!dailyWeatherForecastDataReadingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dailyWeatherForecastDataReading.label', default: 'DailyWeatherForecastDataReading'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [dailyWeatherForecastDataReadingInstance: dailyWeatherForecastDataReadingInstance]
        }
    }

    def update = {
        def dailyWeatherForecastDataReadingInstance = DailyWeatherForecastDataReading.get(params.id)
        if (dailyWeatherForecastDataReadingInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dailyWeatherForecastDataReadingInstance.version > version) {
                    
                    dailyWeatherForecastDataReadingInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dailyWeatherForecastDataReading.label', default: 'DailyWeatherForecastDataReading')] as Object[], "Another user has updated this DailyWeatherForecastDataReading while you were editing")
                    render(view: "edit", model: [dailyWeatherForecastDataReadingInstance: dailyWeatherForecastDataReadingInstance])
                    return
                }
            }
            dailyWeatherForecastDataReadingInstance.properties = params
            if (!dailyWeatherForecastDataReadingInstance.hasErrors() && dailyWeatherForecastDataReadingInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dailyWeatherForecastDataReading.label', default: 'DailyWeatherForecastDataReading'), dailyWeatherForecastDataReadingInstance.id])}"
                redirect(action: "show", id: dailyWeatherForecastDataReadingInstance.id)
            }
            else {
                render(view: "edit", model: [dailyWeatherForecastDataReadingInstance: dailyWeatherForecastDataReadingInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dailyWeatherForecastDataReading.label', default: 'DailyWeatherForecastDataReading'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dailyWeatherForecastDataReadingInstance = DailyWeatherForecastDataReading.get(params.id)
        if (dailyWeatherForecastDataReadingInstance) {
            try {
                dailyWeatherForecastDataReadingInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dailyWeatherForecastDataReading.label', default: 'DailyWeatherForecastDataReading'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dailyWeatherForecastDataReading.label', default: 'DailyWeatherForecastDataReading'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dailyWeatherForecastDataReading.label', default: 'DailyWeatherForecastDataReading'), params.id])}"
            redirect(action: "list")
        }
    }
}
