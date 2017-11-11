Player = Struct.new(:x, :y)

$NUMBER_ROWS = 5
$NUMBER_COLUMNS = 5

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
      if @player.x < ($NUMBER_ROWS-1)
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
      if @player.y < ($NUMBER_COLUMNS-1)
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
  
  def detectWumpus
    if( ((@player.x+1)==@wumpus.x)|| ((@player.x-1)==@wumpus.x) || ((@player.y+1)==@wumpus.y) || ((@player.y-1)==@wumpus.y) )
      return true
    else
      return false
    end
  end

  def shootArrow
    if address == 'arriba'
      for i in @player.y..0
        if((@arrow.y==@wumpus.y) && (@arrow.x==@wumpus.x))
          return true
        else
          @arrow.y=(@arrow.y-1)
        end
      end
    elsif address == 'abajo'
      for i in 0..@player.y
        if((@arrow.y==@wumpus.y) && (@arrow.x==@wumpus.x))
          return true
        else
          @arrow.y=(@arrow.y+1)
        end
      end

    elsif address == 'izquierda'
      for i in @player.x..0
        if((@arrow.y==@wumpus.y) && (@arrow.x==@wumpus.x))
          return true
        else
          @arrow.x=(@arrow.x-1)
        end
      end

    else
      for i in 0..@player.x
        if((@arrow.y==@wumpus.y) && (@arrow.x==@wumpus.x))
          return true
        else
          @arrow.x=(@arrow.x+1)
        end
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
  
end