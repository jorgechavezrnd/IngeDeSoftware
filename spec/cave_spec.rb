require './lib/cave'

describe Cave do
  before(:each) do
		@cave=Cave.new()
	end
  
  it "deberia devolver la posicion del jugador" do
		expect(@cave.getRooms[@cave.getPlayer.x][@cave.getPlayer.y]).to eq(1)
	end

	it "deberia devolver el mensaje La flecha se pierde de tu vista" do
		expect(@cave.showMessageMissingArrow).to eq("
    La flecha se pierde de tu vista")
	end

	it "deberia devolver el mensaje Hay un olor en el aire, el wumpus está cerca" do
		expect(@cave.showMessageWumpusAround).to eq("
    Hay un olor en el aire, el wumpus está cerca")
	end

	it "deberia devolver el mensaje Hay un olor en el aire, el wumpus está cerca" do
		expect(@cave.showMessageWumpusAround).to eq("
    Hay un olor en el aire, el wumpus está cerca")
	end

	it "deberia devolver los lugares donde puedo disparar" do
		expect(@cave.showMessageShoot).to eq("\n    A donde desea disparar?\n    * Norte\n    * Sur\n    * Este\n    * Oeste")
	end

	it "deberia devolver los lugares donde puedo moverme" do
		expect(@cave.showMessageMove).to eq("\n    A donde desea moverse?\n    * Norte\n    * Sur\n    * Este\n    * Oeste")
	end

	it "deberia devolver las opciones de accion" do
		expect(@cave.showMessageAction).to eq( "\n    Que accion quieres realizar? \n    * Moverse\n    * Lanzar flecha")
	end

	it "deberia devolver el mensaje No tiene flechas que disparar" do
		expect(@cave.showMessageEmptyArrow).to eq( "\n    No tiene flechas que disparar")
	end

	it "deberia devolver el mensaje No puedes moverte por ahi" do
		expect(@cave.showMessageNotMovement).to eq( "\n    No puedes moverte por ahi")
	end

	it "deberia devolver verdadero si no tengo flechas" do
		@cave.reduceArrows
		@cave.reduceArrows
		@cave.reduceArrows
		expect(@cave.verifyArrows).to eq(true)
	end

	it "deberia devolver falso si tengo flechas" do
		expect(@cave.verifyArrows).to eq(false)
	end

	it "deberia devolver verdadero si no tengo flechas" do
		expect(@cave.verifyArrows).to eq(false)
	end

end