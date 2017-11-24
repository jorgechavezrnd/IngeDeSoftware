class Room

   def initialize
   		@entries = [0,0,0,0]
         @wumpus = false
         @hunter = false
         @arrow = false
         @bats = false
         @waterWell = false
         @breeze = false
         @quantityArrow = 0
   end

   def wumpusHere
      return @wumpus
   end

   def hunterHere
      return @hunter
   end

   def arrowHere
      return @arrow
   end

   def batsHere
      return @bats
   end

   def waterWellHere
      return @waterWell
   end

   def breezeHere
      return @breeze
   end

   def quantityArrowHere
      return @quantityArrow
   end
   
   def incrementArrowQuantity
      @quantityArrow = @quantityArrow + 1
   end

   def decreaseArrowQuantity
      if (@quantityArrow > 0) then
         @quantityArrow = @quantityArrow - 1
      end
   end

   def setWumpusStay
      if (@wumpus) then
         @wumpus =false
      else
         @wumpus = true
      end
   end

   def setArrowStay
      if (@arrow) then
         @arrow = false
      else
         @arrow = true
      end
   end

   def setHunterStay
      if(@hunter) then
         @hunter = false
      else
         @hunter = true
      end
   end

   def setBatsStay
      if (@bats) then         
         @bats = false
      else
         @bats = true
      end
   end

   def setWaterWellStay
      if (@waterWell) then 
         @waterWell = false
      else
         @waterWell = true
      end
   end

   def setBreezeStay
      if (@breeze) then
         @breeze = false
      else
         @breeze = true
      end
   end

   def openEntryNorth
   		@entries[0]=1
   end

   def closeEntryNorth
   		@entries[0]=0
   end

   def openEntrySouth
   		@entries[1]=1
   end

   def closeEntrySouth
   		@entries[1]=0
   end

   def openEntryEast
   		@entries[2]=1
   end
   def closeEntryEast
   		@entries[2]=0
   end

   def openEntryWest
   		@entries[3]=1
   end
   
   def closeEntryWest
   		@entries[3] = 0
   end

   
   def northOpen
         return @entries[0] == 1
   end

   def southOpen
         return @entries[1] == 1
   end

   def eastOpen
         return @entries[2] == 1
   end

   def westOpen
         return @entries[3] == 1
   end
   
   def entryOpen(direction)
		if(direction == 'South')then
			return southOpen
		elsif (direction == 'North') then
			return northOpen
		elsif (direction == 'East') then
			return eastOpen
		elsif (direction == 'West') then
			return westOpen
		end
   end

end