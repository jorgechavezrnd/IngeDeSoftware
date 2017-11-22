Feature:  Como jugador
          Quiero salir del juego
          Para dejar de jugar
          
Scenario:
          Given visito la pantalla del juego
          When presiono el boton "Salir"
          Then deberia devolverme la menu principal 
          And mostrarme "Wumpus Labyrinth"