class Room

   def initialize
      
   		@entries = [0,0,0,0]
         @wumpus = false
         @player = false
         @arrow = false
         @bats = false
         @waterWell = false
         @breeze = false
         @quantityArrow = 0

   end

   def WumpusHere
      return @wumpus
   end

   def PlayerHere
      return @player
   end

   def QuantityArrowHere
      return @quantityArrow
   end
   
   def ArrowHere
      return @arrow
   end

   def BatsHere
      return @bats
   end

   def waterWellHere
      return @waterWell
   end

   def BreezeHere
      return @breeze
   end

   def setWumpusStay
      if (@wumpus==false) then
         @wumpus=true
      else
         @wumpus=false
      end
   end

   def setArrowStay
      if (@arrow==false) then
         @arrow=true
      else
         @arrow=false
      end
   end

   def setPlayerStay
      if(@player==true) then
         @player=false
      else
         @player=true
      end
   end

   def incrementArrowQuantity
      @quantityArrow=@quantityArrow+1
   end

   def decreaseArrowQuantity
      if (@quantityArrow>0) then
         @quantityArrow=@quantityArrow-1
      end
   end

   def setBatsStay
      if (@bats==false) then         
         @bats=true
      else
         @bats=false
      end
   end

   def setWaterWellStay
      if (@waterWell==false) then 
         @waterWell=true
      else
         @waterWell=false
      end
   end

   def setBreezeStay
      if (@breeze==false) then
         @breeze=true
      else
         @breeze=false
      end
   end

   def OpenEntryNorth
   		@entries[0]=1
   end

   def CloseEntryNorth
   		@entries[0]=0
   end

   def OpenEntrySouth
   		@entries[1]=1
   end

   def CloseEntrySouth
   		@entries[1]=0
   end

   def OpenEntryEast
   		@entries[2]=1
   end
   def CloseEntryEast
   		@entries[2]=0
   end

   def OpenEntryWest
   		@entries[3]=1
   end
   def CloseEntryWest
   		@entries[3]=0
   end

   
   def northOpen
         return (@entries[0]==1)
   end
   def southOpen
         return (@entries[1]==1)
   end
   def eastOpen
         return (@entries[2]==1)
   end
   def westOpen
         return (@entries[3]==1)
   end
   

   def EntryOpen(direction)
   		if(direction=='South')then
   			return southOpen
   		elsif (direction=='North') then
   			return northOpen
   		elsif (direction=='East') then
   			return eastOpen
   		elsif (direction=='West') then
   			return westOpen
   		end
   end

   

end