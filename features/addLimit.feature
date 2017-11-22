Feature: Como jugador
		  Quiero agregar límites predefinidos entre cuartos
	      Para poder moverme con menos facilidad y aumentar la dificultad

Scenario:
		 Given visito la pantalla de inicio
         And presiona el boton "Jugar"
		 Then deberia mostrarme "Te encuentras en la habitacion..." tras haberse generado los limites

