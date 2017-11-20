require './lib/game'

describe Game do
	before(:each) do
		@game=Game.new
	end
	it "deberia devolver la cantidad de cuartos de 16 en un nuevo mapa pequeño por defecto" do
		@game.newDefaultGame(false, 'small')
		@cave=@game.getCave
		expect(@cave.quantityOfRooms).to eq(16)
	end
	it "deberia devolver 1 si el jugador esta en la habitacion 1 al iniciar el juego" do
		@game.newDefaultGame(false, 'small')
		expect(@game.getPlayerPosition).to eq(1)
	end
	it "deberia devolver 16 si el wumpus esta en la habitacion 16 al iniciar el juego" do
		@game.newDefaultGame(false, 'small')
		expect(@game.getWumpusPosition).to eq(16)
	end
	it "deberia devolver verdadero si el wumpus se movera en el juego" do
		@game.newDefaultGame(true, 'small')
		expect(@game.WumpusMove).to eq(true)
	end
	it "deberia devolver falso si el wumpus no se movera en el juego" do
		@game.newDefaultGame(false, 'small')
		expect(@game.WumpusMove).to eq(false)
	end
	it "deberia devolver la cantidad de spray en el juego" do
		@game.newDefaultGame(false, 'small')
		expect(@game.getQuantitySpray).to eq(1)
	end

	it "deberia devolver 10 turnos para que los murcielagos se muevan en el juego" do
		@game.newDefaultGame(false, 'small')
		expect(@game.getRemainingTurnBats).to eq(10)
	end

	it "deberia disminuir a 9 turnos para que los murcielagos se muevan el juego" do
		@game.newDefaultGame(false, 'small')
		@game.dismissTurnsBats
		expect(@game.getRemainingTurnBats).to eq(9)
	end

	it "deberia reiniciar los turnos de los murcielagos a 10" do
		@game.newDefaultGame(false, 'small')
		@game.dismissTurnsBats
		@game.dismissTurnsBats
		@game.dismissTurnsBats
		expect(@game.resetReaminingTurnsBats).to eq(10)
	end 
	
end 

=begin
	100 monedas al matarlo

=end