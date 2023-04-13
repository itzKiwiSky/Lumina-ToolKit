playstate = {}

function playstate:enter()
    gradient = love.graphics.newGradient({direction = "horizontal", {0, 0, 0, 0}, {255, 255, 255, 255}})

    
    print(debug.getTableContent(math))

    img, quads = love.graphics.getQuads("arquivo")
end

function playstate:draw()
    love.graphics.drawInRect(gradient, 0, 0, 120, 120)
end

function playstate:update(elapsed)
    
end

return playstate