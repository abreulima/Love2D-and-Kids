local x = 300
local y = 250
local cat
 
function love.load()
    cat = love.graphics.newImage("cat.png")
end

function love.update(dt)

    -- Player will go up
    if love.keyboard.isDown("w") then
        y = y - 1
    end

    -- Player will go down
    if love.keyboard.isDown("s") then
        y = y + 1
    end

    -- Player will go right
    if love.keyboard.isDown("d") then
        x = x + 1
    end

    -- Player will go left
    if love.keyboard.isDown("a") then
        x = x - 1
    end

end


function love.draw()
    love.graphics.circle("fill", x, y, 25)
    love.graphics.draw(cat, 0, 0)
end