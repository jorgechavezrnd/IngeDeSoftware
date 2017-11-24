require './lib/hunter'

describe Hunter  do

	before(:each) do
		@hunter=Hunter.new
	end

	it "deberia devolver verdadero si el cazador esta vivo" do
		expect(@hunter.hunterAlive).to eq(true)
	end

	it "deberia devolver falso si el cazador esta muerto" do
		@hunter.killHunter
		expect(@hunter.hunterAlive).to eq(false)
	end

	it "deberia devolver la cantidad de flechas que tiene el cazador" do
		expect(@hunter.getQuantityArrows).to eq(0)
	end

	it "deberia devolver la cantidad de 1 flecha del cazador" do
		@hunter.takeArrow
		expect(@hunter.getQuantityArrows).to eq(1)
	end

	it "deberia devolver la cantidad de 0 flechas del cazador" do
		@hunter.takeArrow
		@hunter.dropArrow
		expect(@hunter.getQuantityArrows).to eq(0)
	end

	it "deberia devolver la posicion del cazador" do
		@hunter.takeArrow
		@hunter.dropArrow
		expect(@hunter.getQuantityArrows).to eq(0)
	end

	it "deberia devolver la cantidad de 0 flechas del cazador" do
		@hunter.takeArrow
		@hunter.dropArrow
		expect(@hunter.getQuantityArrows).to eq(0)
	end

end