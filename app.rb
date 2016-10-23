require './main'

class HiController < Controller
  def action
    @response_text = 'hi'
  end
end

class HelloController < Controller
  def action
    @response_text = 'hello'
  end
end

Application = Router.new({
 '/hi' => HiController,
 '/hello' => HelloController
})
