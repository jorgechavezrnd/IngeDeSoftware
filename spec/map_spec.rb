require './lib/map'

describe Map do
	
	before(:each) do
		@map=Map.new
	end

	it "deberia devolver la cantidad de 16 cuartos tras generar un mapa pequeño" do
		@map.createDefaultSmallMap
		expect(@map.quantityOfRooms).to eq(16)
	end

	it "deberia devolver la cantidad de 64 cuartos tras generar un mapa mediano" do
		@map.createDefaultMediumMap
		expect(@map.quantityOfRooms).to eq(64)
	end

	it "deberia devolver la cantidad de 144 cuartos tras generar un mapa grande" do
		@map.createDefaultBigMap
		expect(@map.quantityOfRooms).to eq(144)
	end

	it "deberia devolver la cantidad de cuartos que le damos tras generar un mapa editado" do
		@map.createEditedMap(2,2)
		expect(@map.quantityOfRooms).to eq(4)
	end

end