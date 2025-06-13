-- Animal Rescue: Simple Love2D Game for Kids

function love.load()
    love.window.setTitle("Animal Rescue!")
    love.window.setMode(800, 600)

    player = {
        x = 100,
        y = 100,
        speed = 200,
        size = 40
    }

    rescued = 0

    animals = {
        {x = 300, y = 200, rescued = false},
        {x = 500, y = 100, rescued = false},
        {x = 600, y = 400, rescued = false},
    }

    font = love.graphics.newFont(24)
    love.graphics.setFont(font)
end

function love.update(dt)
    -- Movement
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
    elseif love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
    end

    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        player.y = player.y + player.speed * dt
    elseif love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        player.y = player.y - player.speed * dt
    end
end

function love.keypressed(key)
    if key == "space" then
        for i, animal in ipairs(animals) do
            if not animal.rescued and isNear(player, animal) then
                animal.rescued = true
                rescued = rescued + 1
            end
        end
    end
end

function love.draw()
    -- Draw player
    love.graphics.setColor(0.2, 0.6, 1) -- Blue
    love.graphics.rectangle("fill", player.x, player.y, player.size, player.size)

    -- Draw animals
    for _, animal in ipairs(animals) do
        if not animal.rescued then
            love.graphics.setColor(1, 0.5, 0.5) -- Pink cage
            love.graphics.rectangle("fill", animal.x, animal.y, 30, 30)
            love.graphics.setColor(0, 0, 0)
            love.graphics.print("🐶", animal.x + 5, animal.y + 5)
        else
            love.graphics.setColor(0, 1, 0)
            love.graphics.print("🎉 Thank you!", animal.x - 10, animal.y)
        end
    end

    -- Score
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Animals Rescued: " .. rescued .. "/" .. #animals, 10, 10)

    -- Win message
    if rescued == #animals then
        love.graphics.setColor(1, 1, 0)
        love.graphics.printf("🎉 You rescued all the animals!", 0, 550, 800, "center")
    end
end

function isNear(p, a)
    local dist = math.sqrt((p.x - a.x)^2 + (p.y - a.y)^2)
    return dist < 50
end
