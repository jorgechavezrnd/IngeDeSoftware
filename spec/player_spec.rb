require './lib/player'

describe Player  do 
	before(:each) do
		@player=Player.new
	end
	it "deberia devolver verdadero si el jugador esta vivo" do
		expect(@player.playerAlive).to eq(true)
	end
	it "deberia devolver falso si el jugador esta muerto" do
		@player.setPlayerStatus
		expect(@player.playerAlive).to eq(false)
	end
end