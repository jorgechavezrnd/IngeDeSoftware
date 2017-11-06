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
    posRand = Random.new
    @player.x = posRand.rand(0..($NUMBER_ROWS - 1))
    @player.y = posRand.rand(0..($NUMBER_COLUMNS - 1))
    
    for i in 0..($NUMBER_ROWS - 1)
      for j in 0..($NUMBER_COLUMNS - 1)
        @rooms[i][j] = 0
      end
    end
    
    @rooms[@player.x][@player.y] = 1
  end
  
  def movePlayer(address)
    if address == 'arriba'
      if @player.x > 0
        resetRooms
        @player.x = @player.x - 1
        updateRooms
        return true
      end
    elsif address == 'abajo'
      if @player.x < 9
        resetRooms
        @player.x = @player.x + 1
        updateRooms
        return true
      end
    elsif address == 'izquierda'
      if @player.y > 0
        resetRooms
        @player.y = @player.y - 1
        updateRooms
        return true
      end
    else
      if @player.y < 9
        resetRooms
        @player.y = @player.y + 1
        updateRooms
        return true
      end
    end
    return false
  end
  
  def resetRooms
    @rooms[@player.x][@player.y] = 0
  end
  
  def updateRooms
    @rooms[@player.x][@player.y] = 1
  end
  
  def getPlayer
    return @player
  end
  
  def getRooms
    return @rooms
  end
  
end