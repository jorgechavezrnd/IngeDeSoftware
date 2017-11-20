require './lib/cave'

describe Cave do
	
	before(:each) do
		@cave=Cave.new
	end

	it "deberia devolver la cantidad de 16 cuartos tras generar un mapa pequeño" do
		@cave.createDefaultSmallMap
		expect(@cave.quantityOfRooms).to eq(16)
	end

	it "deberia devolver la cantidad de 64 cuartos tras generar un mapa mediano" do
		@cave.createDefaultMediumMap
		expect(@cave.quantityOfRooms).to eq(64)
	end

	it "deberia devolver la cantidad de 144 cuartos tras generar un mapa grande" do
		@cave.createDefaultBigMap
		expect(@cave.quantityOfRooms).to eq(144)
	end

	it "deberia devolver la cantidad de cuartos que le damos tras generar un mapa editado" do
		@cave.createEditedMap(2,2)
		expect(@cave.quantityOfRooms).to eq(4)
	end

	it "deberia devolver verdadero si el jugador esta en el cuarto 1" do
		@cave.createDefaultSmallMap
		@cave.movePlayerToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.PlayerHere).to eq(true)
	end

	it "deberia devolver falso si el jugador no esta en el cuarto 1" do
		@cave.createDefaultSmallMap
		@cave.movePlayerToRoom(0,0)
		@cave.movePlayerToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.PlayerHere).to eq(false)
	end

	it "deberia devolver verdadero si el wumpus esta en el cuarto 1" do
		@cave.createDefaultSmallMap
		@cave.moveWumpusToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.WumpusHere).to eq(true)
	end

	it "deberia devolver falso si el wumpus no esta en el cuarto 1" do
		@cave.createDefaultSmallMap
		@cave.moveWumpusToRoom(0,0)
		@cave.moveWumpusToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.WumpusHere).to eq(false)
	end

	it "deberia devolver verdadero si la flecha esta en el cuarto 1" do
		@cave.createDefaultSmallMap
		@cave.moveArrowToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.ArrowHere).to eq(true)
	end

	it "deberia devolver falso si la flecha no esta en el cuarto 1" do
		@cave.createDefaultSmallMap
		@cave.moveArrowToRoom(0,0)
		@cave.moveArrowToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.ArrowHere).to eq(false)
	end
	it "deberia devolver verdadero si los murcielagos estan en el cuarto 1" do
		@cave.createDefaultSmallMap
		@cave.moveBatsToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.BatsHere).to eq(true)
	end

	it "deberia devolver falso si los murcielagos no estan en el cuarto 1" do
		@cave.createDefaultSmallMap
		@cave.moveBatsToRoom(0,0)
		@cave.moveBatsToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.BatsHere).to eq(false)
	end

	it "deberia devolver verdadero si hay un pozo en el cuarto 1" do
		@cave.createDefaultSmallMap
		@cave.putWaterWellToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.waterWellHere).to eq(true)
	end

	it "deberia devolver falso si no hay un pozo en el cuarto 1" do
		@cave.createDefaultSmallMap
		@cave.putWaterWellToRoom(0,0)
		@cave.putWaterWellToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.waterWellHere).to eq(false)
	end
	it "deberia devolver verdadero si hay una brisa en el cuarto 1" do
		@cave.createDefaultSmallMap
		@cave.putBreezeToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.BreezeHere).to eq(true)
	end

	it "deberia devolver falso si no hay una brisa en el cuarto 1" do
		@cave.createDefaultSmallMap
		@cave.putBreezeToRoom(0,0)
		@cave.putBreezeToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.BreezeHere).to eq(false)
	end
	it "deberia devolver la cantidad de flechas en el cuarto 1" do
		@cave.createDefaultSmallMap
		@cave.putArrowToRoom(0,0)
		@cave.putArrowToRoom(0,0)
		@cave.removeArrowToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.QuantityArrowHere).to eq(1)
	end

	it "deberia devolver falso si no hay camino al Norte" do
		@cave.createDefaultSmallMap
		@cave.movePlayerToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.northOpen).to eq(false)
	end

	it "deberia verdadero si hay camino al Norte" do
		@cave.createDefaultSmallMap
		@cave.movePlayerToRoom(2,1)
		@room=@cave.getRoom(2,1)
		expect(@room.northOpen).to eq(true)
	end

	it "deberia devolver falso si no hay camino al Sur" do
		@cave.createDefaultSmallMap
		@cave.movePlayerToRoom(1,0)
		@room=@cave.getRoom(1,0)
		expect(@room.southOpen).to eq(false)
	end

	it "deberia verdadero si hay camino al Sur" do
		@cave.createDefaultSmallMap
		@cave.movePlayerToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.southOpen).to eq(true)
	end

	it "deberia devolver falso si no hay camino al Este" do
		@cave.createDefaultSmallMap
		@cave.movePlayerToRoom(0,1)
		@room=@cave.getRoom(0,1)
		expect(@room.eastOpen).to eq(false)
	end

	it "deberia verdadero si hay camino al Este" do
		@cave.createDefaultSmallMap
		@cave.movePlayerToRoom(0,0)
		@room=@cave.getRoom(0,0)
		expect(@room.eastOpen).to eq(true)
	end

	it "deberia devolver falso si no hay camino al Oeste" do
		@cave.createDefaultSmallMap
		@cave.movePlayerToRoom(0,1)
		@room=@cave.getRoom(0,1)
		expect(@room.westOpen).to eq(false)
	end

	it "deberia verdadero si hay camino al Oeste" do
		@cave.createDefaultSmallMap
		@cave.movePlayerToRoom(1,0)
		@room=@cave.getRoom(1,0)
		expect(@room.westOpen).to eq(true)
	end

end
