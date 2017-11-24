require './lib/room'
describe Room do

 	before(:each) do
		@room=Room.new
	end

	it "deberia devolver falso si la entrada Norte esta cerrada" do
		expect(@room.entryOpen('North')).to eq(false)
	end

	it "deberia devolver falso si la entrada Sur esta cerrada" do
		expect(@room.entryOpen('South')).to eq(false)
	end

	it "deberia devolver falso si la entrada Este esta cerrada" do
		expect(@room.entryOpen('East')).to eq(false)
	end

	it "deberia devolver falso si la entrada Oeste esta cerrada" do
		expect(@room.entryOpen('West')).to eq(false)
	end
	it "deberia devolver verdadero si la entrada Norte esta abierta" do
		@room.openEntryNorth
		expect(@room.entryOpen('North')).to eq(true)
	end
	it "deberia devolver verdadero si la entrada Sur esta abierta" do
		@room.openEntrySouth
		expect(@room.entryOpen('South')).to eq(true)
	end
	it "deberia devolver verdadero si la entrada Este esta abierta" do
		@room.openEntryEast
		expect(@room.entryOpen('East')).to eq(true)
	end
	it "deberia devolver verdadero si la entrada Oeste esta abierta" do
		@room.openEntryWest
		expect(@room.entryOpen('West')).to eq(true)
	end

	it "deberia devolver falso si el jugador no esta en la habitacion" do
		expect(@room.hunterHere).to eq(false)
	end
	it "deberia devolver falso si el wumpus no esta en la habitacion" do
		@room.openEntryWest
		expect(@room.wumpusHere).to eq(false)
	end
	it "deberia devolver falso si no hay flechas en la habitacion" do
		expect(@room.arrowHere).to eq(false)
	end
	it "deberia devolver falso si no hay murcielagos en la habitacion" do
		expect(@room.batsHere).to eq(false)
	end
	it "deberia devolver falso si no hay brisa en la habitacion" do
		expect(@room.breezeHere).to eq(false)
	end
	it "deberia devolver falso si no hay un pozo en la habitacion" do
		expect(@room.waterWellHere).to eq(false)
	end
	it "deberia devolver verdadero si el jugador esta en la habitacion" do
		@room.setHunterStay
		expect(@room.hunterHere).to eq(true)
	end
	it "deberia devolver verdadero si el wumpus esta en la habitacion" do
		@room.setWumpusStay
		expect(@room.wumpusHere).to eq(true)
	end
	it "deberia devolver verdadero si hay flechas en la habitacion" do
		@room.setArrowStay
		expect(@room.arrowHere).to eq(true)
	end
	it "deberia devolver verdadero si hay murcielagos en la habitacion" do
		@room.setBatsStay
		expect(@room.batsHere).to eq(true)
	end
	it "deberia devolver verdadero si hay brisa en la habitacion" do
		@room.setBreezeStay
		expect(@room.breezeHere).to eq(true)
	end
	it "deberia devolver verdadero si hay un pozo en la habitacion" do
		@room.setWaterWellStay
		expect(@room.waterWellHere).to eq(true)
	end

	it "deberia devolver la cantidad de flechas en la habitacion" do
		@room.incrementArrowQuantity
		@room.incrementArrowQuantity
		@room.decreaseArrowQuantity
		expect(@room.quantityArrowHere).to eq(1)
	end

end