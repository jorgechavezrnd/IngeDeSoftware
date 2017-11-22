Feature:  Como jugador
          Quiero ver un mensaje de movimiento erróneo
          Para saber cuando me equivoque al realizar un movimiento

Scenario:
          Given visito la pantalla del juego
          When presiono el boton "Lanzar flecha"
          Then muestra el mensaje "No tienes flechas para disparar."

Scenario:
          Given visito la pantalla del juego
          When presiono el boton "Moverse"
          And presiono una direccion despues del mensaje "A donde quieres moverte?"
          Then muestra el mensaje "No puedes moverte por ahi"
          
          