require './lib/player'

describe Player  do 
	before(:each) do
		@player=Player.new
	end
	it "deberia devolver falso si el jugador esta muerto" do
		expect(@player.PlayerAlive).to eq(false)
	end
	it "deberia devolver falso si el jugador esta vivo" do
		@player.setPlayerStatus
		expect(@player.PlayerAlive).to eq(true)
	end
end