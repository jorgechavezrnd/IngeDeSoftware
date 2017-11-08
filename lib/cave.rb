Player = Struct.new(:x, :y)

$NUMBER_ROWS = 10
$NUMBER_COLUMNS = 10

class Cave
  
  def initialize
    @rooms = Array.new($NUMBER_ROWS)
    for i in 0..($NUMBER_ROWS - 1)
      @rooms[i] = Array.new($NUMBER_COLUMNS)
    end
    
    @player = Player.new
    @wumpus = Player.new
    posRand = Random.new
    @player.x = posRand.rand(0..($NUMBER_ROWS - 1))
    @player.y = posRand.rand(0..($NUMBER_COLUMNS - 1))
    @wumpus.x = posRand.rand(0..($NUMBER_ROWS - 1))
    @wumpus.y = posRand.rand(0..($NUMBER_COLUMNS - 1))
    
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
  
  def movePlayer(address)
    if address == 'arriba'
      if @player.x > 0
        resetRooms
        @player.x = @player.x - 1
        if updateRooms
          return 3
        end
        return 2
      end
    elsif address == 'abajo'
      if @player.x < 9
        resetRooms
        @player.x = @player.x + 1
        if updateRooms
          return 3
        end
        return 2
      end
    elsif address == 'izquierda'
      if @player.y > 0
        resetRooms
        @player.y = @player.y - 1
        if updateRooms
          return 3
        end
        return 2
      end
    else
      if @player.y < 9
        resetRooms
        @player.y = @player.y + 1
        if updateRooms
          return 3
        end
        return 2
      end
    end
    return 1
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
  
  def getPlayer
    return @player
  end
  
  def getRooms
    return @rooms
  end
  
end