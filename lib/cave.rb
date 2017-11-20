require './lib/room'
class Cave

  def initialize
    @numberCols = 0
    @numberRows = 0 
    @rooms=Array.new(1)
    for i in 0..1
      @rooms[i] = Array.new(1)
    end
  end

  def setNumberCols(numberCols)
    @numberCols=numberCols
  end

  def setNumberRows(numberRows)
    @numberRows=numberRows
  end

  def getNumberCols
    return @numberCols
  end

  def getNumberRows
    return @numberRows
  end

  def createDefaultSmallMap
    @numberRows=4
    @numberCols=4
    generateMap(@numberRows,@numberCols)
    generateWallsDefaultSmallMap
  end

  def createDefaultMediumMap
    @numberRows=8
    @numberCols=8
    generateMap(@numberRows,@numberCols)

  end

  def createDefaultBigMap
    @numberRows=12
    @numberCols=12
    generateMap(@numberRows,@numberCols)
  end

  def createEditedMap(numberRows,numberCols)
    @numberCols=numberCols
    @numberRows=numberRows
    generateMap(@numberRows,@numberCols)
  end

  def generateMap(numberRows,numberCols)
    @rooms=Array.new(numberRows)
    for i in 0..(numberRows - 1)
      @rooms[i] = Array.new(numberCols - 1)
    end
    for i in 0..(numberRows - 1)
      for j in 0..(numberCols - 1)
        @rooms[i][j] = Room.new
      end
    end
  end

  def generateWallsDefaultSmallMap
    @room=getRoom(0,0)
    @room.OpenEntrySouth
    @room.OpenEntryEast
    setRoom(@room,0,0)
    @room=getRoom(0,1)
    @room.OpenEntryNorth
    setRoom(@room,0,1)
    @room=getRoom(0,2)
    @room.OpenEntryEast
    setRoom(@room,0,2)
    @room=getRoom(0,3)
    @room.OpenEntryEast
    setRoom(@room,0,3)
    @room=getRoom(1,0)
    @room.OpenEntryWest
    @room.OpenEntryEast
    setRoom(@room,1,0)
    @room=getRoom(1,1)
    @room.OpenEntryEast
    setRoom(@room,1,1)
    @room=getRoom(1,2)
    @room.OpenEntrySouth
    @room.OpenEntryWest
    @room.OpenEntryEast
    setRoom(@room,1,2)
    @room=getRoom(1,3)
    @room.OpenEntryNorth
    @room.OpenEntryWest
    setRoom(@room,1,3)
    @room=getRoom(2,0)
    @room.OpenEntrySouth
    @room.OpenEntryWest
    @room.OpenEntryEast
    setRoom(@room,2,0)
    @room=getRoom(2,1)
    @room.OpenEntryNorth
    @room.OpenEntrySouth
    @room.OpenEntryWest
    setRoom(@room,2,1)
    @room=getRoom(2,2)
    @room.OpenEntryNorth
    @room.OpenEntrySouth
    @room.OpenEntryWest
    @room.OpenEntryEast
    setRoom(@room,2,2)
    @room=getRoom(2,3)
    @room.OpenEntryNorth
    setRoom(@room,2,3)
    @room=getRoom(3,0)
    @room.OpenEntrySouth
    @room.OpenEntryWest
    setRoom(@room,3,0)
    @room=getRoom(3,1)
    @room.OpenEntryNorth
    setRoom(@room,3,1)
    @room=getRoom(3,2)
    @room.OpenEntrySouth
    @room.OpenEntryWest
    setRoom(@room,3,2)
    @room=getRoom(3,3)
    @room.OpenEntryNorth
    setRoom(@room,3,3)
  end

  def quantityOfRooms
    return @numberRows*@numberCols
  end

  def getRoom(positionX,positionY)
    return @rooms[positionX][positionY]
  end

  def setRoom(room,positionX,positionY)
    @rooms[positionX][positionY]=room
  end

  def movePlayerToRoom(positionX,positionY)
    @room=getRoom(positionX,positionY)
    @room.setPlayerStay
    setRoom(@room,positionX,positionY)
  end

  def moveWumpusToRoom(positionX,positionY)
    @room=getRoom(positionX,positionY)
    @room.setWumpusStay
    setRoom(@room,positionX,positionY)
  end

  def moveBatsToRoom(positionX,positionY)
    @room=getRoom(positionX,positionY)
    @room.setBatsStay
    setRoom(@room,positionX,positionY)
  end

  def moveArrowToRoom(positionX,positionY)
    @room=getRoom(positionX,positionY)
    @room.setArrowStay
    setRoom(@room,positionX,positionY)
  end

  def putArrowToRoom(positionX,positionY)
    @room=getRoom(positionX,positionY)
    @room.incrementArrowQuantity
    setRoom(@room,positionX,positionY)
  end

  def removeArrowToRoom(positionX,positionY)
    @room=getRoom(positionX,positionY)
    @room.decreaseArrowQuantity
    setRoom(@room,positionX,positionY)
  end

  def putWaterWellToRoom(positionX,positionY)
    @room=getRoom(positionX,positionY)
    @room.setWaterWellStay
    setRoom(@room,positionX,positionY)
  end

  def putBreezeToRoom(positionX,positionY)
    @room=getRoom(positionX,positionY)
    @room.setBreezeStay
    setRoom(@room,positionX,positionY)
  end

  
end

