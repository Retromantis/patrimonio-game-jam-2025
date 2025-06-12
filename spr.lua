-- main.lua

local boton = {
    x = 300,
    y = 200,
    ancho = 200,
    alto = 60,
    texto = "JUGAR",
    presionado = false
}

function love.load()
    love.window.setTitle("Botón Interactivo")
    love.window.setMode(800, 600)
end

function love.update(dt)
end

function love.draw()
    -- Fondo blanco
    love.graphics.clear(1, 1, 1)

    -- Cambiar color del botón según su estado
    if boton.presionado then
        love.graphics.setColor(1, 0, 0)  -- rojo
    else
        love.graphics.setColor(0, 0, 1)  -- azul
    end

    -- Dibujar botón
    love.graphics.rectangle("fill", boton.x, boton.y, boton.ancho, boton.alto, 10, 10)

    -- Dibujar texto del botón
    love.graphics.setColor(1, 1, 1)  -- texto en blanco
    love.graphics.printf(
        boton.texto,
        boton.x,
        boton.y + 20,
        boton.ancho,
        "center"
    )

    -- Mostrar mensaje si fue presionado
    if boton.presionado then
        love.graphics.setColor(0, 0, 0)
        love.graphics.print("botón presionado", 320, 300)
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then  -- click izquierdo
        if x > boton.x and x < boton.x + boton.ancho and
           y > boton.y and y < boton.y + boton.alto then
            boton.presionado = true
        end
    end
end

function love.mousereleased(x, y, button)
    if button == 1 then  -- click izquierdo
        if x > boton.x and x < boton.x + boton.ancho and
           y > boton.y and y < boton.y + boton.alto then
            boton.presionado = false
        end
    end
end

-- local anim8 = require 'libs.anim8'

-- local spriteImage
-- local animation

-- function love.load()
--     spriteImage = love.graphics.newImage("assets/sprite.png")

--     -- Crear un grid: 2 columnas, 1 fila, cada celda 32x32
--     local g = anim8.newGrid(32, 32, spriteImage:getWidth(), spriteImage:getHeight())

--     -- Crear la animación: usar las 2 primeras columnas de la primera fila
--     animation = anim8.newAnimation(g('1-2', 1), 0.2)  -- 0.2s por frame
-- end

-- function love.update(dt)
--     animation:update(dt)
-- end

-- function love.draw()
--     animation:draw(spriteImage, 100, 100)
-- end

