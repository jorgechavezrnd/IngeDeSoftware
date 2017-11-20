require './lib/room'
describe Room do

 	before(:each) do
		@room=Room.new
	end

	it "deberia devolver falso si la entrada Norte esta cerrada" do
		expect(@room.EntryOpen('North')).to eq(false)
	end
	it "deberia devolver falso si la entrada Sur esta cerrada" do
		expect(@room.EntryOpen('South')).to eq(false)
	end
	it "deberia devolver falso si la entrada Este esta cerrada" do
		expect(@room.EntryOpen('East')).to eq(false)
	end
	it "deberia devolver falso si la entrada Oeste esta cerrada" do
		expect(@room.EntryOpen('West')).to eq(false)
	end
	it "deberia devolver verdadero si la entrada Norte esta abierta" do
		@room.OpenEntryNorth
		expect(@room.EntryOpen('North')).to eq(true)
	end
	it "deberia devolver verdadero si la entrada Sur esta abierta" do
		@room.OpenEntrySouth
		expect(@room.EntryOpen('South')).to eq(true)
	end
	it "deberia devolver verdadero si la entrada Este esta abierta" do
		@room.OpenEntryEast
		expect(@room.EntryOpen('East')).to eq(true)
	end
	it "deberia devolver verdadero si la entrada Oeste esta abierta" do
		@room.OpenEntryWest
		expect(@room.EntryOpen('West')).to eq(true)
	end

	it "deberia devolver falso si el jugador no esta en la habitacion" do
		expect(@room.PlayerHere).to eq(false)
	end
	it "deberia devolver falso si el wumpus no esta en la habitacion" do
		@room.OpenEntryWest
		expect(@room.WumpusHere).to eq(false)
	end
	it "deberia devolver falso si no hay flechas en la habitacion" do
		expect(@room.ArrowHere).to eq(false)
	end
	it "deberia devolver falso si no hay murcielagos en la habitacion" do
		expect(@room.BatsHere).to eq(false)
	end
	it "deberia devolver falso si no hay brisa en la habitacion" do
		expect(@room.BreezeHere).to eq(false)
	end
	it "deberia devolver falso si no hay un pozo en la habitacion" do
		expect(@room.waterWellHere).to eq(false)
	end
	it "deberia devolver verdadero si el jugador esta en la habitacion" do
		@room.setPlayerStay
		expect(@room.PlayerHere).to eq(true)
	end
	it "deberia devolver verdadero si el wumpus no esta en la habitacion" do
		@room.setWumpusStay
		expect(@room.WumpusHere).to eq(true)
	end
	it "deberia devolver verdadero si hay flechas en la habitacion" do
		expect(@room.setArrowStay).to eq(true)
	end
	it "deberia devolver verdadero si hay murcielagos en la habitacion" do
		@room.setBatsStay
		expect(@room.BatsHere).to eq(true)
	end
	it "deberia devolver verdadero si hay brisa en la habitacion" do
		@room.setBreezeStay
		expect(@room.BreezeHere).to eq(true)
	end
	it "deberia devolver verdadero si hay un pozo en la habitacion" do
		@room.setWaterWellStay
		expect(@room.waterWellHere).to eq(true)
	end

	it "deberia devolver la cantidad de flechas en la habitacion" do
		@room.incrementArrowQuantity
		@room.incrementArrowQuantity
		@room.decreaseArrowQuantity
		expect(@room.QuantityArrowHere).to eq(1)
	end

end