
Feature:  Como jugador
          Quiero ver un mensaje cuando llegue a morir
          Para saber que termino la partida
          
Scenario:
          Given visito la pantalla del juego
          When aparece el mensaje "El wumpus te encontró y decidió atacarte. Trataste de defenderte pero fue inútil. Fin del juego."
          Then vuelvo a la pantalla de inicio
          And muestra "Wumpus Labyrinth"