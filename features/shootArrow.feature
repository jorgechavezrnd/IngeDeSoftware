Feature:  Como jugador
		  Quiero lanzar flechas
		  Para matar al wumpus
          
Scenario:
          Given visito la pagina de juego
          When presiona el boton "Lanzar flecha"
          And presiona el boton de direccion despues del mensaje "A donde quieres disparar?"
          Then si no le diste al wumpus me muestra "La flecha se pierde de tu vista" 

Scenario:
          Given visito la pagina de juego
          When presiona el boton "Lanzar flecha"
          And presiona el boton de direccion despues del mensaje "A donde quieres disparar?"
          Then me muestra Muestra el mensaje de victoria si es que se mato al wumpus y te devuelve al menu principal