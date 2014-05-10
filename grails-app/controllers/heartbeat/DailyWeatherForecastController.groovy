package heartbeat

class DailyWeatherForecastController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dailyWeatherForecastInstanceList: DailyWeatherForecast.list(params), dailyWeatherForecastInstanceTotal: DailyWeatherForecast.count()]
    }

    def create = {
        def dailyWeatherForecastInstance = new DailyWeatherForecast()
        dailyWeatherForecastInstance.properties = params
        return [dailyWeatherForecastInstance: dailyWeatherForecastInstance]
    }

    def save = {
        def dailyWeatherForecastInstance = new DailyWeatherForecast(params)
        if (dailyWeatherForecastInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dailyWeatherForecast.label', default: 'DailyWeatherForecast'), dailyWeatherForecastInstance.id])}"
            redirect(action: "show", id: dailyWeatherForecastInstance.id)
        }
        else {
            render(view: "create", model: [dailyWeatherForecastInstance: dailyWeatherForecastInstance])
        }
    }

    def show = {
        def dailyWeatherForecastInstance = DailyWeatherForecast.get(params.id)
        if (!dailyWeatherForecastInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dailyWeatherForecast.label', default: 'DailyWeatherForecast'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dailyWeatherForecastInstance: dailyWeatherForecastInstance]
        }
    }

    def edit = {
        def dailyWeatherForecastInstance = DailyWeatherForecast.get(params.id)
        if (!dailyWeatherForecastInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dailyWeatherForecast.label', default: 'DailyWeatherForecast'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [dailyWeatherForecastInstance: dailyWeatherForecastInstance]
        }
    }

    def update = {
        def dailyWeatherForecastInstance = DailyWeatherForecast.get(params.id)
        if (dailyWeatherForecastInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dailyWeatherForecastInstance.version > version) {
                    
                    dailyWeatherForecastInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dailyWeatherForecast.label', default: 'DailyWeatherForecast')] as Object[], "Another user has updated this DailyWeatherForecast while you were editing")
                    render(view: "edit", model: [dailyWeatherForecastInstance: dailyWeatherForecastInstance])
                    return
                }
            }
            dailyWeatherForecastInstance.properties = params
            if (!dailyWeatherForecastInstance.hasErrors() && dailyWeatherForecastInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dailyWeatherForecast.label', default: 'DailyWeatherForecast'), dailyWeatherForecastInstance.id])}"
                redirect(action: "show", id: dailyWeatherForecastInstance.id)
            }
            else {
                render(view: "edit", model: [dailyWeatherForecastInstance: dailyWeatherForecastInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dailyWeatherForecast.label', default: 'DailyWeatherForecast'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dailyWeatherForecastInstance = DailyWeatherForecast.get(params.id)
        if (dailyWeatherForecastInstance) {
            try {
                dailyWeatherForecastInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dailyWeatherForecast.label', default: 'DailyWeatherForecast'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dailyWeatherForecast.label', default: 'DailyWeatherForecast'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dailyWeatherForecast.label', default: 'DailyWeatherForecast'), params.id])}"
            redirect(action: "list")
        }
    }
}
