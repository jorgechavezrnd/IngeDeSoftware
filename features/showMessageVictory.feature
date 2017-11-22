Feature:  Como jugador
		  Quiero ver un mensaje de victoria
		  Para saber cuando llegue a ganar el juego

          
Scenario:
          Given visito la pantalla del juego
          And muestra el mensaje "Acabaste con el wumpus. Bien Hecho!"
          Then deberia devolverme la menu principal 
          And mostrarme "Wumpus Labyrinth"
