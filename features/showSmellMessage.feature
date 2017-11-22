Feature:  Como jugador
			Quiero ver un mensaje cuando el wumpus se encuentre cerca
			Para saber cuando disparar las flechas o moverme a otra habitación


Scenario:
          Given visito la pantalla de juego y esto cerca del wumpus
          Then deberia mostrarme "Hay un olor en el aire, el wumpus está cerca"
          