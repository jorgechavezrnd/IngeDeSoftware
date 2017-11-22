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
	
	it "deberia mostrar el mensaje Te encuentras en la habitacion 1" do
		@game.newDefaultGame(false, 'small')
		expect(@game.getPlayerPositionMessage).to eq("\n      Te encuentras en la habitacion 1")
	end

	it "deberia devolver verdadero si el wumpus no esta muerto" do
		@game.newDefaultGame(false, 'small')
		expect(@game.wumpusAlive).to eq(true)
	end

	it "deberia devolver falso si el wumpus esta muerto" do
		@game.newDefaultGame(false, 'small')
		@wumpus=@game.getWumpus
		@wumpus.setPlayerStatus
		@game.setWumpus(@wumpus)
		expect(@game.wumpusAlive).to eq(false)
	end
	
	it "deberia mostrar el mensaje Que accion quieres realizar? * Moverse * Lanzar flecha" do
		@game.newDefaultGame(false, 'small')
		expect(@game.showMessageAction).to eq("\n\t    Que accion quieres realizar? \n\t    * Moverse\n\t    * Lanzar flecha")
	end

	it "deberia mostrar el mensaje No tiene flechas que disparar" do
		@game.newDefaultGame(false, 'small')
		expect(@game.showMessageEmptyArrow).to eq("\n    \tNo tiene flechas que disparar")
	end

	it "deberia mostrar el mensaje No puedes moverte por ahi" do
		@game.newDefaultGame(false, 'small')
		expect(@game.showMessageNotMovement).to eq("\n    \tNo puedes moverte por ahi")
	end

	it "deberia mostrar el mensaje La flecha se pierde de tu vista" do
		@game.newDefaultGame(false, 'small')
		expect(@game.showMessageMissingArrow).to eq("\n\t\tLa flecha se pierde de tu vista")
	end

	it "deberia mostrar el mensaje Hay un olor en el aire, el wumpus está cerca" do
		@game.newDefaultGame(false, 'small')
		expect(@game.showMessageWumpusAround).to eq("\n\t    Hay un olor en el aire, el wumpus está cerca")
	end

	it "deberia devolver verdadero si tengo flechas" do
		@game.newDefaultGame(false, 'small')
		expect(@game.haveArrows).to eq(true)
	end

	it "deberia devolver falso si no tengo flechas" do
		expect(@game.haveArrows).to eq(false)
	end

	it "deberia devolver el numero de flechas que tengo" do
		expect(@game.getNumberArrow).to eq('0')
	end

	it "deberia devolver verdadero si perdi el juego" do
		@game.newDefaultGame(false, 'small')
		@wumpus=@game.getWumpus
		@game.setPlayer(@wumpus)
		expect(@game.YourLose).to eq(true)
	end

	it "deberia devolver falso si no perdi el juego" do
		@game.newDefaultGame(false, 'small')
		expect(@game.YourLose).to eq(false)
	end

	it "deberia devolver verdadero si el jugador se movio" do
		@game.newDefaultGame(false, 'small')
		expect(@game.movePlayer('South')).to eq(true)
	end

	it "deberia devolver falso si el jugador no se movio" do
		@game.newDefaultGame(false, 'small')
		expect(@game.movePlayer('North')).to eq(false)
	end

	it "deberia devolver verdadero si el wumpus se encuentra a mi alrededor" do
		@game.newDefaultGame(false, 'small')
		@wumpus=@game.getWumpus
		@player=@game.getPlayer
		@wumpus.setPositionX(@player.getPositionX+1)
		@wumpus.setPositionY(@player.getPositionY)
		@game.setWumpus(@wumpus)
		expect(@game.detectWumpus).to eq(true)
	end

	it "deberia devolver falso si el no se encuentra a mi alrededor" do
		@game.newDefaultGame(false, 'small')
		expect(@game.detectWumpus).to eq(false)
	end

	it "deberia devolver verdadero si la flecha se disparo y le dio al wumpus" do
		@game.newDefaultGame(false, 'small')
		@wumpus=@game.getWumpus
		@player=@game.getPlayer
		@wumpus.setPositionX(@player.getPositionX+1)
		@wumpus.setPositionY(@player.getPositionY)
		@game.setWumpus(@wumpus)
		expect(@game.shotArrow('East')).to eq(true)
	end

	it "deberia devolver falso si la flecha se disparo y no le dio al wumpus" do
		@game.newDefaultGame(false, 'small')
		expect(@game.shotArrow('South')).to eq(false)
	end
=begin
	it "deberia devolver 10 si el murcielago se movio" do
		@game.newDefaultGame(false, 'small')
		@game.dismissTurnsBats
		@game.dismissTurnsBats
		@game.dismissTurnsBats
		@game.dismissTurnsBats
		@game.dismissTurnsBats
		@game.dismissTurnsBats
		@game.dismissTurnsBats
		@game.dismissTurnsBats
		@game.dismissTurnsBats
		@game.dismissTurnsBats
		@game.MoveBat
		expect(@game.getRemainingTurnBats).to eq(10)
	end

	it "deberia devolver verdadero si el wumpus se movio" do
		@game.newDefaultGame(false, 'small')
		expect(@game.MoveWumpus).to eq(true)
	end

	it "deberia devolver falso si el wumpus no se movio" do
		@game.newDefaultGame(false, 'small')
		@wumpus=@game.getWumpus
		@wumpus.setPlayerStatus
		@game.setWumpus(@wumpus)
		expect(@game.MoveWumpus).to eq(false)
	end
=end
	
end