require './lib/cave'

describe Cave do
  before(:each) do
		@cave=Cave.new()
	end
  
  it "deberia devolver la posicion del jugador" do
		expect(@cave.getRooms[@cave.getPlayer.x][@cave.getPlayer.y]).to eq(1)
	end

end