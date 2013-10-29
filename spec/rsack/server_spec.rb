require 'spec_helper'

describe RockPaperScissors::App do
  #let(:server) { Rack::MockRequest.new(RockPaperScissors::App.new) }
  def server
    Rack::MockRequest.new(Rack::Session::Cookie.new(RockPaperScissors::App.new, :key => 'rack.session', :secret => 'ppt'))
  end

  context '/' do
    it "Debería retornar el código 200" do
      response = server.get('/')
      response.status.should == 200
    end
  end

  context '/' do
    it "Debería mostrar Bienvenido a Piedra Papel y Tijera" do
      response = server.get('/')
      response.body == 'Bienvenido a Piedra Papel y Tijera'
    end
  end

  context "/?choice='Papel'" do
    it "Debería retornar el código 200" do
      response = server.get("/?choice='Papel'")
      response.status.should == 200
    end
  end

  context "/?choice='Tijera'" do
    it "Debería retornar el código 200" do
      response = server.get("/?choice='Tijera'")
      response.status.should == 200
    end
  end

end