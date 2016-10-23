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















# hello_app = ->(env) { [200, {}, ['hello']] }
# hi_app = ->(env) { [200, {}, ['hi']] }

# class App
#   attr_accessor :routes

#   def call(env)
#     route_response(env)
#   end

# private

#   def route_response(env)
#     @routes.default = ->(_) { [404, {}, ['not found']] }

#     @routes[env['PATH_INFO']].call(env)
#   end
# end

# AppInstance = App.new
# AppInstance.routes = {
#   '/hello' => hello_app,
#   '/hi' => hi_app
# }









