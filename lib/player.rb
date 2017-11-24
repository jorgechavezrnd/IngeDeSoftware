class Player
    
    def initialize
        @x = 1
        @y = 1
        @live = true
        
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

    def playerAlive
        return @live
    end

    def setPlayerStatus
        @live = false
    end

    def revivePlayer
        @live = true
    end

end