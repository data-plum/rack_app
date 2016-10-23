require 'rack'
require 'pp'

class Router
  def initialize(routes)
    @routes = routes
  end

  def call(env)
    @routes.default = Controller

    controller = @routes[env['PATH_INFO']]

    Controller.new.call(controller)
  end
end

class Controller
  def call(controller)
    action

    responce(controller)
  end

  def action
    @response_text = 'not found'
  end
  
private
  
  def responce(controller)
    controller == self.class.name ? [404, {}, [@response_text]] : [200, {}, [controller.new.action]]
  end
end
