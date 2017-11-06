Feature:  Como jugador
          Quiero iniciar una partida
          Para empezar a jugar

Scenario:
          Given visito la pagina de inicio
          Then deberia mostrarme "Wumpus Labyrinth"
          
Scenario:
          Given visito la pagina de inicio
          When presiono el boton "Jugar"
          Then deberia mostrarme la pantalla del juego