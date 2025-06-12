-- main.lua
player = {
    x = 100, y = 100,
    w = 32, h = 32,
    speed = 200,
    ySpeed = 0,
    jumpForce = -400,
    gravity = 800,
    onGround = false
}

platforms = {
    {x = 0, y = 400, w = 800, h = 50},
    {x = 200, y = 300, w = 100, h = 20},
    {x = 400, y = 250, w = 100, h = 20}
}

function love.load()
end

function love.update(dt)
    -- Movimiento horizontal
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
    end

    -- Aplicar gravedad
    player.ySpeed = player.ySpeed + player.gravity * dt
    player.y = player.y + player.ySpeed * dt
    player.onGround = false

    -- Colisiones con plataformas
    for _, plat in ipairs(platforms) do
        if player.x + player.w > plat.x and player.x < plat.x + plat.w then
            if player.y + player.h > plat.y and player.y + player.h < plat.y + plat.h and player.ySpeed >= 0 then
                player.y = plat.y - player.h
                player.ySpeed = 0
                player.onGround = true
            end
        end
    end
end

function love.keypressed(key)
    if key == "space" and player.onGround then
        player.ySpeed = player.jumpForce
    end
end

function love.draw()
    -- Dibujar jugador
    love.graphics.setColor(1, 0.5, 0)
    love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)

    -- Dibujar plataformas
    love.graphics.setColor(0.3, 0.8, 0.3)
    for _, plat in ipairs(platforms) do
        love.graphics.rectangle("fill", plat.x, plat.y, plat.w, plat.h)
    end
end
