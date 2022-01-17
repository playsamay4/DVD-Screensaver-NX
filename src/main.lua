function love.load()
    dvdSprite = love.graphics.newImage('/assets/dvd.png')
    dvdX = love.math.random(-14,1318.4)
    dvdY = love.math.random(-39,360)
    dvdXV = love.math.random(0,1)
    dvdYV = love.math.random(0,1)
    dvdXSpeed = 176
    dvdYSpeed = 206
    dvdXSpeedMax = 176
    dvdYSpeedMax = 206
    colorsR = {255,0,0,255}
    colorsG = {0,255,0,255}
    colorsB = {0,0,255,0}
    colorIndex = 1
    colorIndexLen = 4
end


function love.update(dt) 
 
    if dvdXV == 1 then dvdX = dvdX + dvdXSpeed*dt end
    if dvdXV == 0 then dvdX = dvdX - dvdXSpeed*dt end
    if dvdYV == 1 then dvdY = dvdY + dvdYSpeed*dt end
    if dvdYV == 0 then dvdY = dvdY - dvdYSpeed*dt end

    if dvdX < -15 then 
        dvdXV = 1
        dvdXSpeed = love.math.random(dvdXSpeedMax,dvdYSpeedMax)
        colorIndex = colorIndex + 1
     end
    if dvdX > (love.graphics.getWidth()*1.01 - dvdSprite:getWidth()) then 
        dvdXV = 0 
        dvdXSpeed = love.math.random(dvdXSpeedMax,dvdYSpeedMax)
        colorIndex = colorIndex + 1
    end
    if dvdY < -40 then 
        dvdYV = 1 
        dvdYSpeed = love.math.random(dvdXSpeedMax,dvdYSpeedMax)
        colorIndex = colorIndex + 1
    end
    if dvdY > (love.graphics.getWidth()/1.5 - dvdSprite:getWidth()) then 
        dvdYV = 0 
        dvdYSpeed = love.math.random(dvdXSpeedMax,dvdYSpeedMax)
        colorIndex = colorIndex + 1
    end

    if colorIndex > colorIndexLen then colorIndex = 1 end

end


function love.draw()
    love.graphics.setColor(colorsR[colorIndex],colorsG[colorIndex],colorsB[colorIndex])
    love.graphics.draw(dvdSprite, dvdX,dvdY,0,1,1)
end

function love.gamepadpressed(joystick,button)
    if button == 'start' then
        love.event.quit()
    end
end