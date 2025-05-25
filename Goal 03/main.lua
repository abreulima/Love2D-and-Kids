local x = 300
local y = 250


function love.update(dt)

    -- Player will go up
    if love.keyboard.isDown("w") then
        y = y - 1
    end

    -- Player will go down
    if love.keyboard.isDown("s") then
        y = y + 1
    end

    -- What about left and right?

end


function love.draw()
    love.graphics.print("Karia", x, y)
end