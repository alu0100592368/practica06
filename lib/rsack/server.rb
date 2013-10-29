module Rsack
  class Server
    
    def initialize(app=nil)
      @app = app
    end
    
    def call(env)
      @app.call(env) if @app
      #["200", {}, "hello"]
      # response = Rack::Response.new
      # response.write("¡Hola Mundo!")
      # response.finish
    end
  end
end