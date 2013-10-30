require 'rack/request'
require 'rack/response'
require 'haml'
 
module RockPaperScissors
  class App
    def initialize(app = nil)
      @app = app
      @content_type = :html
      @defeat = {'Piedra' => 'Tijera', 'Papel' => 'Piedra', 'Tijera' => 'Papel'}
      @throws = @defeat.keys
      @tiradas = {'Empates' => 0, 'Derrotas' => 0, 'Victorias' => 0}
    end

    def set_env(env)
      @env = env
      @session = env['rack.session']
    end

    def some_key 
      return @session['some_key'].to_i if @session['some_key']
      @session['some_key'] = 0
    end

    def some_key=(value)
      @session['some_key'] = value
    end

    def call(env)
      set_env(env)
      req = Rack::Request.new(env)
      # req.env.keys.sort.each { |x| puts "#{x} => #{req.env[x]}" }
      computer_throw = @throws.sample
      player_throw = req.GET["choice"]
      answer = if !@throws.include?(player_throw)
          "Elija una de las tres opciones:"
        elsif player_throw == computer_throw
          @tiradas['Empates'] = @tiradas['Empates'] + 1
          "¡Haz empatado con la máquina!"
        elsif computer_throw == @defeat[player_throw]
          @tiradas['Victorias'] = @tiradas['Victorias'] + 1
          "¡Muyy biennn ganaste! #{player_throw} gana a #{computer_throw}"
        else
          @tiradas['Derrotas'] = @tiradas['Derrotas'] + 1
          "Oops...¡Perdiste! #{computer_throw} gana a #{player_throw}. ¡Suerte la próxima vez!"
        end
      engine = Haml::Engine.new File.open("views/index.haml").read
      res = Rack::Response.new
      self.some_key = self.some_key + 1 if req.path == '/'
      res.write engine.render(
        {},
        :tiradas => @tiradas,
        :answer => answer,
        :throws => @throws,
        :computer_throw => computer_throw,
        :player_throw => player_throw,
        :some_key => some_key)
      res.finish
    end # call
  end   # App
end     # RockPaperScissors