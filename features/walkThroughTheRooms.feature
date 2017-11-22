Feature:  Como jugador
          Quiero caminar por los cuartos
          Para moverme a traves del laberinto del juego
          
Scenario:
          Given visito la pagina de juego
          When presiona el boton "Moverse"
          And presiona el boton de direccion despues del mensaje "A donde quieres moverte?"
          Then me muestra "Te encuentras en la habitacion"