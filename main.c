local is_near = require("is_near")

function love.load()
    love.window.setMode(800, 600) -- Size
    love.window.setTitle("Title") -- Title
    love.graphics.setDefaultFilter("nearest")

    -- player characteristics 
    player = {
        image = love.graphics.newImage("Player.png"),
        x = 100,
        y = 100,
        speed = 120,
        size = 16
    }

    --- List Animals
    animals = 
    {
        { x = 600, y = 200, size = 16, image = love.graphics.newImage("Player.png"),  rescued = false},
        { x = 200, y = 400, size = 16, image = love.graphics.newImage("Player.png"),  rescued = false},
        { x = 500, y = 500, size = 16, image = love.graphics.newImage("Player.png"),  rescued = false}
    }

    --- Rescued Animals
    rescued = 0


end

function love.update(dt)

    if love.keyboard.isDown("right", "d") then
        player.x = player.x + player.speed * dt
    end

    -- Move left
    if love.keyboard.isDown("left", "a") then
        player.x = player.x - player.speed * dt
    end

    -- Move down
    if love.keyboard.isDown("down", "s") then
        player.y = player.y + player.speed * dt
    end

    -- Move up
    if love.keyboard.isDown("up", "w") then
        player.y = player.y - player.speed * dt
    end

    --- Check Collisions
    for _, animal in ipairs(animals) do
        if not animal.rescued and is_near(player, animal) then
            animal.rescued = true
            rescued =  rescued + 1 
        end
    end

end

function love.draw()
    
    -- Draw Player
    love.graphics.draw(player.image, player.x, player.y, 0, 4, 4)

    --- Draw animals
    for _, animal in ipairs(animals) do
        if not animal.rescued then
            love.graphics.draw(animal.image, animal.x, animal.y, 0, 4, 4)
        else
            love.graphics.print("Thank You", animal.x, animal.y)
        end
    end
        
    --- Draw Score
    love.graphics.print("Animals Rescued: " .. rescued)



end

