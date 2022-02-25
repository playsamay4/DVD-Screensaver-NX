function love.load()
    dvdSpriteW = love.graphics.newImage('/assets/dvd.png')
    dvdSpriteR = love.graphics.newImage('/assets/dvdRed.png')
    dvdSpriteG = love.graphics.newImage('/assets/dvdGreen.png')
    dvdSpriteB = love.graphics.newImage('/assets/dvdBlue.png')
    dvdSpriteY = love.graphics.newImage('/assets/dvdYellow.png')
    dvdSpriteT = love.graphics.newImage('/assets/dvdTeal.png')
    dvdSpriteP = love.graphics.newImage('/assets/dvdPurple.png')
    dvdSpriteO = love.graphics.newImage('/assets/dvdOrange.png')
    dvdSpriteU = dvdSpriteW
    dvdX = love.math.random(-14,1318.4)
    dvdY = love.math.random(-39,360)
    dvdXV = love.math.random(0,1)
    dvdYV = love.math.random(0,1)
    dvdXSpeed = 100
    dvdYSpeed = 150
    currentSpriteUse = 0
end


function love.update(dt) 
    if dvdXV == 1 then dvdX = dvdX + dvdXSpeed*dt end
    if dvdXV == 0 then dvdX = dvdX - dvdXSpeed*dt end
    if dvdYV == 1 then dvdY = dvdY + dvdYSpeed*dt end
    if dvdYV == 0 then dvdY = dvdY - dvdYSpeed*dt end

    if dvdX < -15 then 
        dvdXV = 1
        dvdXSpeed = love.math.random(100,150)
        currentSpriteUse = currentSpriteUse + 1
     end
    if dvdX > (love.graphics.getWidth()*1.03 - dvdSpriteU:getWidth()) then 
        dvdXV = 0 
        dvdXSpeed = love.math.random(100,150)
        currentSpriteUse = currentSpriteUse + 1
    end
    if dvdY < -40 then 
        dvdYV = 1 
        dvdYSpeed = love.math.random(100,150)
        currentSpriteUse = currentSpriteUse + 1
    end
    if dvdY > (love.graphics.getWidth()/1.5 - dvdSpriteU:getWidth()) then 
        dvdYV = 0 
        dvdYSpeed = love.math.random(100,150)
        currentSpriteUse = currentSpriteUse + 1
    end

    if currentSpriteUse > 7 then currentSpriteUse = 1 end

end


function love.draw()
    if currentSpriteUse == 0 then dvdSpriteU = dvdSpriteW end   
    if currentSpriteUse == 1 then dvdSpriteU = dvdSpriteR end
    if currentSpriteUse == 2 then dvdSpriteU = dvdSpriteG end
    if currentSpriteUse == 3 then dvdSpriteU = dvdSpriteB end
    if currentSpriteUse == 4 then dvdSpriteU = dvdSpriteY end
    if currentSpriteUse == 5 then dvdSpriteU = dvdSpriteT end
    if currentSpriteUse == 6 then dvdSpriteU = dvdSpriteP end
    if currentSpriteUse == 7 then dvdSpriteU = dvdSpriteO end

    love.graphics.draw(dvdSpriteU, dvdX,dvdY,0,1,1)
end

function love.gamepadpressed(joystick,button)
    if button == 'start' then love.event.quit() end
end