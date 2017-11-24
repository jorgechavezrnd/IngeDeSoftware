require './lib/monster'

describe Monster  do

	before(:each) do
		@monster=Monster.new
	end

	it "deberia devolver verdadero si el cazador esta vivo" do
		expect(@monster.monsterAlive).to eq(true)
	end

	it "deberia devolver falso si el cazador esta muerto" do
		@monster.killMonster
		expect(@monster.monsterAlive).to eq(false)
	end

end
