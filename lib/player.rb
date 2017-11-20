class Player
    
    def initialize
        @x = 1
        @y = 1
        @live = false
    end

    def setPositionX(x)
        @x = x
    end

    def setPositionY(y)
        @y = y
    end

    def getPositionX
        return @x
    end

    def getPositionY
        return @y
    end

    def PlayerAlive
        return @live
    end

    def setPlayerStatus
        if (@live == true) then
            @live = false
        else
            @live = true
        end 
    end

end