-- Requiere la librería anim8
local anim8 = require 'libs/anim8'

-- Resolución
local screenWidth = 1280
local screenHeight = 720

-- Cargar imagen del sprite
local player = {}
local bullets = {}
local gravity = 800

function love.load()
    love.window.setMode(screenWidth, screenHeight)
    player.image = love.graphics.newImage("assets/images/player.png")
    player.grid = anim8.newGrid(64, 64, player.image:getWidth(), player.image:getHeight())

    -- Animaciones
    player.animations = {
        left = anim8.newAnimation(player.grid('1-2', 1), 0.5),
        right = anim8.newAnimation(player.grid('3-4', 1), 0.5)
    }

    player.x = screenWidth / 2
    player.y = screenHeight - 64
    player.w = 64
    player.h = 64
    player.vx = 0
    player.vy = 0
    player.speed = 200
    player.jumpForce = -400
    player.onGround = true
    player.direction = "right"
    player.currentAnim = player.animations.right
end

function love.update(dt)
    -- Movimiento horizontal
    player.vx = 0
    if love.keyboard.isDown("left") then
        player.vx = -player.speed
        player.direction = "left"
        player.currentAnim = player.animations.left
    elseif love.keyboard.isDown("right") then
        player.vx = player.speed
        player.direction = "right"
        player.currentAnim = player.animations.right
    end

    -- Actualizar posición
    player.x = player.x + player.vx * dt

    -- Limitar al borde de la pantalla
    player.x = math.max(0, math.min(player.x, screenWidth - player.w))

    -- Saltar
    if not player.onGround then
        player.vy = player.vy + gravity * dt
    end

    player.y = player.y + player.vy * dt

    -- Colisión con el suelo
    if player.y >= screenHeight - player.h then
        player.y = screenHeight - player.h
        player.vy = 0
        player.onGround = true
    else
        player.onGround = false
    end

    -- Actualizar animación
    player.currentAnim:update(dt)

    -- Actualizar proyectiles
    for i = #bullets, 1, -1 do
        local b = bullets[i]
        b.x = b.x + b.vx * dt
        if b.x < 0 or b.x > screenWidth then
            table.remove(bullets, i)
        end
    end
end

function love.keypressed(key)
    if key == "space" and player.onGround then
        player.vy = player.jumpForce
        player.onGround = false
    elseif key == "x" then
        shoot()
    end
end

function shoot()
    local vx = player.direction == "right" and 400 or -400
    local bullet = {
        x = player.x + player.w / 2 - 4,
        y = player.y + player.h / 2 - 4,
        vx = vx,
        size = 8
    }
    table.insert(bullets, bullet)
end

function love.draw()
    -- Dibujar plataforma (piso)
    love.graphics.setColor(1,1,1)
    -- love.graphics.setColor(0.2, 0.2, 0.2)
    love.graphics.rectangle("fill", 0, screenHeight - 10, screenWidth, 10)

    -- Dibujar jugador
    player.currentAnim:draw(player.image, player.x, player.y)

    -- Dibujar proyectiles
    love.graphics.setColor(1, 1, 1)
    for _, b in ipairs(bullets) do
        love.graphics.rectangle("fill", b.x, b.y, b.size, b.size)
    end

    love.graphics.setColor(1, 1, 1)
end
