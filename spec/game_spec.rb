require './lib/game'

describe Game do
	before(:each) do
		@game=Game.new
	end
	it "deberia devolver la cantidad de cuartos de 16 en un nuevo mapa pequeño por defecto" do
		@game.newDefaultGame(false, 'small')
		expect(@game.getQuantityOfRooms).to eq(16)
	end
	it "deberia devolver 1 si el jugador esta en la habitacion 1 al iniciar el juego" do
		@game.newDefaultGame(false, 'small')
		expect(@game.getHunterPosition).to eq(1)
	end
	it "deberia devolver 16 si el wumpus esta en la habitacion 16 al iniciar el juego" do
		@game.newDefaultGame(false, 'small')
		expect(@game.getWumpusPosition).to eq(16)
	end

	it "deberia devolver 13 si los murcielagos estan en la habitacion 13 al iniciar el juego" do
		@game.newDefaultGame(false, 'small')
		expect(@game.getBatsPosition).to eq(13)
	end

	it "deberia devolver verdadero si el wumpus se movera en el juego" do
		@game.newDefaultGame(true, 'small')
		expect(@game.wumpusMove).to eq(true)
	end

	it "deberia devolver falso si el wumpus no se movera en el juego" do
		@game.newDefaultGame(false, 'small')
		expect(@game.wumpusMove).to eq(false)
	end

	it "deberia devolver verdadero si el cazador se encuentra en el cuarto 1" do
		@game.newDefaultGame(false, 'small')
		room = @game.getRoomOfHunter(0,0)
		expect(room.hunterHere).to eq(true)
	end

	it "deberia devolver falso si el cazador se encuentra en el cuarto 2" do
		@game.newDefaultGame(false, 'small')
		room = @game.getRoomOfHunter(1,0)
		expect(room.hunterHere).to eq(false)
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
		expect(@game.getHunterPositionMessage).to eq("\n      Te encuentras en la habitacion 1")
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

	it "deberia devolver North si el numero es 0" do
		@game.newDefaultGame(false, 'small')
		expect(@game.decideRandomDirection(0)).to eq("North")
	end

	it "deberia devolver South si el numero es 1" do
		@game.newDefaultGame(false, 'small')
		expect(@game.decideRandomDirection(1)).to eq("South")
	end

	it "deberia devolver East si el numero es 2" do
		@game.newDefaultGame(false, 'small')
		expect(@game.decideRandomDirection(2)).to eq("East")
	end

	it "deberia devolver West si el numero es 3" do
		@game.newDefaultGame(false, 'small')
		expect(@game.decideRandomDirection(3)).to eq("West")
	end

	it "deberia devolver verdadero si estoy muerto" do
		@game.newDefaultGame(false, 'small')
		expect(@game.youDeath).to be true
	end

	it "deberia devolver falso si no estoy muerto" do
		@game.newDefaultGame(false, 'small')
		hunter = @game.getHunter
		hunter.killHunter
		@game.setHunter(hunter)
		expect(@game.youDeath).to be false
	end

	it "deberia verdadero si el cazador se puede mover al Norte" do
		@game.newDefaultGame(false, 'small')
		hunter = @game.getHunter
		hunter.setPositionY(1)
		expect(@game.correctMovement(hunter,'North')).to be true
	end

	it "deberia falso si el cazador no se puede mover al Norte" do
		@game.newDefaultGame(false, 'small')
		hunter = @game.getHunter
		expect(@game.correctMovement(hunter,'North')).to be false
	end

	it "deberia verdadero si el cazador se puede mover al Sur" do
		@game.newDefaultGame(false, 'small')
		hunter = @game.getHunter
		expect(@game.correctMovement(hunter,'South')).to be true
	end

	it "deberia falso si el cazador no se puede mover al Sur" do
		@game.newDefaultGame(false, 'small')
		hunter = @game.getHunter
		hunter.setPositionY(1)
		expect(@game.correctMovement(hunter,'South')).to be false
	end

	it "deberia verdadero si el cazador se puede mover al Este" do
		@game.newDefaultGame(false, 'small')
		hunter = @game.getHunter
		expect(@game.correctMovement(hunter,'East')).to be true
	end

	it "deberia falso si el cazador no se puede mover al Este" do
		@game.newDefaultGame(false, 'small')
		hunter = @game.getHunter
		hunter.setPositionY(1)
		expect(@game.correctMovement(hunter,'East')).to be false
	end

	it "deberia verdadero si el cazador se puede mover al Oeste" do
		@game.newDefaultGame(false, 'small')
		hunter = @game.getHunter
		hunter.setPositionX(1)
		expect(@game.correctMovement(hunter,'West')).to be true
	end

	it "deberia falso si el cazador no se puede mover al Oeste" do
		@game.newDefaultGame(false, 'small')
		hunter = @game.getHunter
		expect(@game.correctMovement(hunter,'West')).to be false
	end
	
	
	it "deberia devolver verdadero si el jugador se movio" do
		@game.newDefaultGame(false, 'small')
		expect(@game.moveHunter('South')).to eq(true)
	end

	it "deberia devolver falso si el jugador no se movio" do
		@game.newDefaultGame(false, 'small')
		expect(@game.moveHunter('North')).to eq(false)
	end

	it "deberia devolver verdadero si la flecha se disparo y le dio al wumpus" do
		@game.newDefaultGame(false, 'small')
		wumpus = @game.getWumpus
		hunter = @game.getHunter
		wumpus.setPositionX(hunter.getPositionX+2)
		wumpus.setPositionY(hunter.getPositionY)
		@game.setWumpus(wumpus)
		expect(@game.shotArrow('East')).to be true
	end

	it "deberia devolver falso si la flecha se disparo y no le dio al wumpus" do
		@game.newDefaultGame(false, 'small')
		expect(@game.shotArrow('South')).to eq(false)
	end

	it "deberia devolver falso si el murcielago ya no se encuentra en el cuarto" do
		@game.newDefaultGame(false, 'small')
		bats = @game.getBats
		room = @game.getRoomOfHunter(bats.getPositionX,bats.getPositionY)
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
		@game.moveBat
		expect(room.batsHere).to be false
	end

	it "deberia devolver falso si el wumpus ya no se encuentra en el cuarto" do
		@game.newDefaultGame(false, 'small')
		wumpus = @game.getWumpus
		room = @game.getRoomOfHunter(wumpus.getPositionX,wumpus.getPositionY)
		@game.moveWumpus
		expect(room.wumpusHere).to be false
	end

	it "deberia devolver verdadero si el murcielago se encuentra en otro cuarto" do
		@game.newDefaultGame(false, 'small')
		bats = @game.getBats
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
		@game.moveBat
		room = @game.getRoomOfHunter(bats.getPositionX,bats.getPositionY)
		expect(room.batsHere).to be true
	end

	it "deberia devolver verdadero si el wumpus se encuentra en el cuarto" do
		@game.newDefaultGame(false, 'small')
		wumpus = @game.getWumpus
		@game.moveWumpus
		room = @game.getRoomOfHunter(wumpus.getPositionX,wumpus.getPositionY)
		expect(room.wumpusHere).to be true
	end

	it "deberia devolver verdadero si el wumpus se encuentra al Sur" do
		@game.newDefaultGame(false, 'small')
		wumpus = @game.getWumpus
		wumpus.setPositionX(0)
		wumpus.setPositionY(1)
		@game.setWumpus(wumpus)
		expect(@game.detectWumpus('South')).to be true
	end

	it "deberia devolver verdadero si el wumpus se encuentra al Norte" do
		@game.newDefaultGame(false, 'small')
		wumpus = @game.getWumpus
		hunter = @game.moveHunter('South')
		wumpus.setPositionX(0)
		wumpus.setPositionY(0)
		@game.setWumpus(wumpus)
		expect(@game.detectWumpus('North')).to be true
	end

	it "deberia devolver verdadero si el wumpus se encuentra al Este" do
		@game.newDefaultGame(false, 'small')
		wumpus = @game.getWumpus
		wumpus.setPositionX(1)
		wumpus.setPositionY(0)
		@game.setWumpus(wumpus)
		expect(@game.detectWumpus('East')).to be true
	end

	it "deberia devolver verdadero si el wumpus se encuentra al Oeste" do
		@game.newDefaultGame(false, 'small')
		wumpus = @game.getWumpus
		hunter = @game.getHunter
		@game.moveHunter('East')
		wumpus.setPositionX(0)
		wumpus.setPositionY(0)
		@game.setWumpus(wumpus)
		expect(@game.detectWumpus('West')).to be true
	end

	it "deberia devolver falso si el wumpus no esta cerca mio" do
		@game.newDefaultGame(false, 'small')
		expect(@game.detectWumpus('East')).to be false
	end
end
