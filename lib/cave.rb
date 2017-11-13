Player = Struct.new(:x, :y)

$NUMBER_ROWS = 4
$NUMBER_COLUMNS = 4
$NUMBER_ARROW = 3

class Cave
  
  def initialize

    @rooms = Array.new($NUMBER_ROWS)
    for i in 0..($NUMBER_ROWS - 1)
      @rooms[i] = Array.new($NUMBER_COLUMNS)
    end
    
    @player = Player.new
    @wumpus = Player.new
    @arrow = Player.new
    posRand = Random.new

    @player.x = posRand.rand(0..($NUMBER_ROWS - 1))
    @player.y = posRand.rand(0..($NUMBER_COLUMNS - 1))
    @arrow.x=@player.x
    @arrow.y=@player.y
    @wumpus.x = posRand.rand(0..($NUMBER_ROWS - 1))
    @wumpus.y = posRand.rand(0..($NUMBER_COLUMNS - 1))
    @numberArrows=$NUMBER_ARROW

    if (@player.x == @wumpus.x) && (@player.y == @wumpus.y)
      same_position = true
      while same_position == true
        @wumpus.x = posRand.rand(0..($NUMBER_ROWS - 1))
        @wumpus.y = posRand.rand(0..($NUMBER_COLUMNS - 1))
        if (@player.x == @wumpus.x) && (@player.y == @wumpus.y)
          same_position = true
        else
          same_position = false
        end
      end
    end
    
    for i in 0..($NUMBER_ROWS - 1)
      for j in 0..($NUMBER_COLUMNS - 1)
        @rooms[i][j] = 0
      end
    end
    
    @rooms[@player.x][@player.y] = 1
    @rooms[@wumpus.x][@wumpus.y] = 2

  end

  def resetRooms
    @rooms[@player.x][@player.y] = 0
    @rooms[@wumpus.x][@wumpus.y] = 0
  end
  
  def updateRooms
    @rooms[@player.x][@player.y] = 1
    @rooms[@wumpus.x][@wumpus.y] = 2
    if (@player.x == @wumpus.x) && (@player.y == @wumpus.y)
      return true
    end
    return false
  end
  

  def movePlayer(address)
    
    if address == 'arriba'
          if @player.x > 0
            resetRooms
            @player.x = @player.x - 1
            return true
          end
        elsif address == 'abajo'
          if @player.x < ($NUMBER_ROWS-1)
            resetRooms
            @player.x = @player.x + 1
            return true
          end
        elsif address == 'izquierda'
          if @player.y > 0
            resetRooms
            @player.y = @player.y - 1
            return true
          end
        else
          if @player.y < ($NUMBER_COLUMNS-1)
            resetRooms
           @player.y = @player.y + 1
           return true
        end
      end
      return false
  end

  def verifyDeath
    return updateRooms
  end

  def detectWumpus
    if( ((@player.x+1)==@wumpus.x)|| ((@player.x-1)==@wumpus.x) || ((@player.y+1)==@wumpus.y) || ((@player.y-1)==@wumpus.y) )
      return true
    else
      return false
    end
  end

  def shotArrow(address)

    @arrow  = Player.new
    @arrow.x = @player.x
    @arrow.y = @player.y
    if(@numberArrows>0)
      reduceArrows
    end
    if address == 'arriba'
      while @arrow.x >= 0 do
        if @arrow.x == @wumpus.x && @arrow.y == @wumpus.y
          return true
        end
        @arrow.x = @arrow.x - 1
      end
    end
    if address == 'abajo'
      while @arrow.x < $NUMBER_ROWS do
        if @arrow.x == @wumpus.x && @arrow.y == @wumpus.y
          return true
        end
        @arrow.x = @arrow.x + 1
      end
    end
    if address == 'izquierda'
      while @arrow.y >= 0 do
        if @arrow.x == @wumpus.x && @arrow.y == @wumpus.y
          return true
        end
        @arrow.y = @arrow.y - 1
      end
    end
    if address == 'derecha'
      while @arrow.y < $NUMBER_COLUMNS do
        if @arrow.x == @wumpus.x && @arrow.y == @wumpus.y
          return true
        end
        @arrow.y = @arrow.y + 1
      end
    end
    return false
  end

  def getPlayer
    return @player
  end
  
  def getRooms
    return @rooms
  end

  def getWumpus
    return @wumpus
  end
  
  def getPlayerPosition
      return "
    Te encuentras en la habitacion " + ((($NUMBER_COLUMNS)*$CAVE.getPlayer.x) + ($CAVE.getPlayer.y+1)).to_s
  end

  def getNumberArrow
    return @numberArrows.to_s
  end

  def verifyArrows
    if(@numberArrows==0)
      return true
    end
    return false
  end

  def showMessageAction
    return "
    Que accion quieres realizar? 
    * Moverse
    * Lanzar flecha"
  end

  def showMessageEmptyArrow
    return "
    No tiene flechas que disparar"
  end

  def showMessageNotMovement
    return "
    No puedes moverte por ahi"
  end

  def showMessageShoot
    return "
    A donde desea disparar?
    * Norte
    * Sur
    * Este
    * Oeste"
  end

  def showMessageMove 
    return "
    A donde desea moverse?
    * Norte
    * Sur
    * Este
    * Oeste"
  end

  def showMessageMissingArrow
    return "
    La flecha se pierde de tu vista"
  end

  def reduceArrows
    @numberArrows-=1
  end

  def showMessageWumpusAround
    return "
    Hay un olor en el aire, el wumpus está cerca"
  end

end