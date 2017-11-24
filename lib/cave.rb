require './lib/map'
class Cave

  def initialize
    @map = Map.new   
  end

  def createCave(type)
    if (type == 'small')
      @map.createDefaultSmallMap
    elsif (type == 'medium')
      @map.createDefaultMediumMap
    elsif (type == 'big')
      @map.createDefaultBigMap
    end   
  end

  def getHeightCave
    return @map.getNumberRows
  end

  def getWidthCave
    return @map.getNumberCols
  end

  def createEditedMap(numberRows,numberCols)
    @map.createEditedMap(numberRows,numberCols)
  end

  def getRoomOfCave(positionX,positionY)
    return @map.getRoom(positionX,positionY)
  end

  def setRoomOfCave(room,positionX,positionY)
    @map.setRoom(room,positionX,positionY)
  end

  def movePlayerToRoom(positionX,positionY)
    room = getRoomOfCave(positionX,positionY)
    room.setHunterStay
    setRoomOfCave(room,positionX,positionY)
  end

  def moveWumpusToRoom(positionX,positionY)
    room = getRoomOfCave(positionX,positionY)
    room.setWumpusStay
    setRoomOfCave(room,positionX,positionY)
  end

  def moveBatsToRoom(positionX,positionY)
    room = getRoomOfCave(positionX,positionY)
    room.setBatsStay
    setRoomOfCave(room,positionX,positionY)
  end

  def moveArrowToRoom(positionX,positionY)
    room = getRoomOfCave(positionX,positionY)
    room.setArrowStay
    setRoomOfCave(room,positionX,positionY)
  end

  def putArrowToRoom(positionX,positionY)
    room = getRoomOfCave(positionX,positionY)
    room.incrementArrowQuantity
    setRoomOfCave(room,positionX,positionY)
  end

  def removeArrowToRoom(positionX,positionY)
    room = getRoomOfCave(positionX,positionY)
    room.decreaseArrowQuantity
    setRoomOfCave(room,positionX,positionY)
  end

  def putWaterWellToRoom(positionX,positionY)
    room = getRoomOfCave(positionX,positionY)
    room.setWaterWellStay
    setRoomOfCave(room,positionX,positionY)
  end

  def putBreezeToRoom(positionX,positionY)
    room = getRoomOfCave(positionX,positionY)
    room.setBreezeStay
    setRoomOfCave(room,positionX,positionY)
  end

  def hunterWithWumpus (positionX,positionY) 
    room = getRoomOfCave(positionX,positionY)
    if (room.hunterHere==true && room.wumpusHere==true)
      return true
    else
      return false
    end
  end 

  def hunterWithBats (positionX,positionY)
    room = getRoomOfCave(positionX,positionY)
    if (room.hunterHere==true && room.batsHere==true)
      return true
    else
      return false
    end
  end

  def hunterWithBreeze (positionX,positionY)
    room = getRoomOfCave(positionX,positionY)
    if (room.hunterHere==true && room.breezeHere==true)
      return true
    else
      return false
    end
  end

  def hunterWithArrows (positionX,positionY)
    room = getRoomOfCave(positionX,positionY)
    if (room.hunterHere==true && room.arrowHere==true)
      return true
    else
      return false
    end
  end

  def hunterWithWaterWell (positionX,positionY)
    room = getRoomOfCave(positionX,positionY)
    if (room.hunterHere==true && room.waterWellHere==true)
      return true
    else
      return false
    end
  end

end