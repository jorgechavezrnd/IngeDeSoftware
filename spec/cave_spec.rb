require './lib/cave'

describe Cave do
	
	before(:each) do
		@cave = Cave.new
	end

	it "deberia devolver verdadero si el jugador esta en el cuarto 1" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,0)
		room = @cave.getRoomOfCave(0,0)
		expect(room.hunterHere).to eq(true)
	end

	it "deberia devolver falso si el jugador no esta en el cuarto 1" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,0)
		@cave.movePlayerToRoom(0,0)
		room = @cave.getRoomOfCave(0,0)
		expect(room.hunterHere).to eq(false)
	end

	it "deberia devolver verdadero si el wumpus esta en el cuarto 1" do
		@cave.createCave('small')
		@cave.moveWumpusToRoom(0,0)
		room = @cave.getRoomOfCave(0,0)
		expect(room.wumpusHere).to eq(true)
	end

	it "deberia devolver falso si el wumpus no esta en el cuarto 1" do
		@cave.createCave('small')
		@cave.moveWumpusToRoom(0,0)
		@cave.moveWumpusToRoom(0,0)
		room = @cave.getRoomOfCave(0,0)
		expect(room.wumpusHere).to eq(false)
	end

	it "deberia devolver verdadero si la flecha esta en el cuarto 1" do
		@cave.createCave('small')
		@cave.moveArrowToRoom(0,0)
		room = @cave.getRoomOfCave(0,0)
		expect(room.arrowHere).to eq(true)
	end

	it "deberia devolver falso si la flecha no esta en el cuarto 1" do
		@cave.createCave('small')
		@cave.moveArrowToRoom(0,0)
		@cave.moveArrowToRoom(0,0)
		room = @cave.getRoomOfCave(0,0)
		expect(room.arrowHere).to eq(false)
	end
	it "deberia devolver verdadero si los murcielagos estan en el cuarto 1" do
		@cave.createCave('small')
		@cave.moveBatsToRoom(0,0)
		room = @cave.getRoomOfCave(0,0)
		expect(room.batsHere).to eq(true)
	end

	it "deberia devolver falso si los murcielagos no estan en el cuarto 1" do
		@cave.createCave('small')
		@cave.moveBatsToRoom(0,0)
		@cave.moveBatsToRoom(0,0)
		 room = @cave.getRoomOfCave(0,0)
		expect(room.batsHere).to eq(false)
	end

	it "deberia devolver verdadero si hay un pozo en el cuarto 1" do
		@cave.createCave('small')
		@cave.putWaterWellToRoom(0,0)
		room = @cave.getRoomOfCave(0,0)
		expect(room.waterWellHere).to eq(true)
	end

	it "deberia devolver falso si no hay un pozo en el cuarto 1" do
		@cave.createCave('small')
		@cave.putWaterWellToRoom(0,0)
		@cave.putWaterWellToRoom(0,0)
		room = @cave.getRoomOfCave(0,0)
		expect(room.waterWellHere).to eq(false)
	end
	it "deberia devolver verdadero si hay una brisa en el cuarto 1" do
		@cave.createCave('small')
		@cave.putBreezeToRoom(0,0)
		room = @cave.getRoomOfCave(0,0)
		expect(room.breezeHere).to eq(true)
	end

	it "deberia devolver falso si no hay una brisa en el cuarto 1" do
		@cave.createCave('small')
		@cave.putBreezeToRoom(0,0)
		@cave.putBreezeToRoom(0,0)
		room = @cave.getRoomOfCave(0,0)
		expect(room.breezeHere).to eq(false)
	end
	it "deberia devolver la cantidad de flechas en el cuarto 1" do
		@cave.createCave('small')
		@cave.putArrowToRoom(0,0)
		@cave.putArrowToRoom(0,0)
		@cave.removeArrowToRoom(0,0)
		room = @cave.getRoomOfCave(0,0)
		expect(room.quantityArrowHere).to eq(1)
	end

	it "deberia devolver falso si no hay camino al Norte" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,0)
		room = @cave.getRoomOfCave(0,0)
		expect(room.northOpen).to eq(false)
	end

	it "deberia verdadero si hay camino al Norte" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(2,1)
		room = @cave.getRoomOfCave(2,1)
		expect(room.northOpen).to eq(true)
	end

	it "deberia devolver falso si no hay camino al Sur" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(1,0)
		room = @cave.getRoomOfCave(1,0)
		expect(room.southOpen).to eq(false)
	end

	it "deberia verdadero si hay camino al Sur" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,0)
		room = @cave.getRoomOfCave(0,0)
		expect(room.southOpen).to eq(true)
	end

	it "deberia devolver falso si no hay camino al Este" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,1)
		room = @cave.getRoomOfCave(0,1)
		expect(room.eastOpen).to eq(false)
	end

	it "deberia verdadero si hay camino al Este" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,0)
		room = @cave.getRoomOfCave(0,0)
		expect(room.eastOpen).to eq(true)
	end

	it "deberia devolver falso si no hay camino al Oeste" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,1)
		room = @cave.getRoomOfCave(0,1)
		expect(room.westOpen).to eq(false)
	end

	it "deberia devolver verdadero si hay camino al Oeste" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(1,0)
		room = @cave.getRoomOfCave(1,0)
		expect(room.westOpen).to eq(true)
	end

	it "deberia devolver verdadero si el cazador se encuentra en el cuarto con el wumpus" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,0)
		@cave.moveWumpusToRoom(0,0)
		expect(@cave.hunterWithWumpus(0,0)).to be true
	end

	it "deberia devolver falso si el cazador no se encuentra en el cuarto con el wumpus" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,0)
		@cave.moveWumpusToRoom(0,0)
		@cave.moveWumpusToRoom(0,0)
		@cave.moveWumpusToRoom(1,0)
		expect(@cave.hunterWithWumpus(0,0)).to be false
	end

	it "deberia devolver verdadero si el cazador se encuentra en el cuarto con los murcielagos" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,0)
		@cave.moveBatsToRoom(0,0)
		expect(@cave.hunterWithBats(0,0)).to be true
	end

	it "deberia devolver falso si el cazador no se encuentra en el cuarto con los murcielagos" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,0)
		@cave.moveBatsToRoom(0,0)
		@cave.moveBatsToRoom(0,0)
		@cave.moveBatsToRoom(1,0)
		expect(@cave.hunterWithBats(0,0)).to be false
	end

	it "deberia devolver verdadero si el cazador se encuentra en el cuarto con pozo" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,0)
		@cave.putWaterWellToRoom(0,0)
		expect(@cave.hunterWithWaterWell(0,0)).to be true
	end

	it "deberia devolver falso si el cazador no se encuentra en el cuarto con pozo" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,0)
		@cave.putWaterWellToRoom(0,0)
		@cave.putWaterWellToRoom(0,0)
		@cave.putWaterWellToRoom(1,0)
		expect(@cave.hunterWithWaterWell(0,0)).to be false
	end

	it "deberia devolver verdadero si el cazador se encuentra en el cuarto con una brisa" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,0)
		@cave.putBreezeToRoom(0,0)
		expect(@cave.hunterWithBreeze(0,0)).to be true
	end

	it "deberia devolver falso si el cazador no se encuentra en el cuarto con una brisa" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,0)
		@cave.putBreezeToRoom(0,0)
		@cave.putBreezeToRoom(0,0)
		@cave.putBreezeToRoom(1,0)
		expect(@cave.hunterWithBreeze(0,0)).to be false
	end

	it "deberia devolver verdadero si el cazador se encuentra en el cuarto con flechas" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,0)
		@cave.moveArrowToRoom(0,0)
		expect(@cave.hunterWithArrows(0,0)).to be true
	end

	it "deberia devolver falso si el cazador no se encuentra en el cuarto con flechas" do
		@cave.createCave('small')
		@cave.movePlayerToRoom(0,0)
		@cave.moveArrowToRoom(0,0)
		@cave.moveArrowToRoom(0,0)
		@cave.moveArrowToRoom(1,0)
		expect(@cave.hunterWithArrows(0,0)).to be false
	end

end