-- main.lua

local textoCompleto = "Hola viajero. Bienvenido a nuestro pueblo."
local textoMostrado = ""
local tiempoEntreCaracteres = 0.05 -- segundos entre letras
local temporizador = 0
local indice = 1
local completo = false

function love.load()
    -- fuente = love.graphics.newFont("mi_fuente.ttf", 24) -- reemplaza por tu fuente o usa nil
    -- love.graphics.setFont(fuente)
end

function love.update(dt)
    if not completo and indice <= #textoCompleto then
        temporizador = temporizador + dt
        if temporizador >= tiempoEntreCaracteres then
            textoMostrado = string.sub(textoCompleto, 1, indice)
            indice = indice + 1
            temporizador = 0
        end
    end
end

function love.draw()
    love.graphics.print(textoMostrado, 50, 50)
end

function love.keypressed(key)
    if key == "space" and not completo then
        textoMostrado = textoCompleto
        indice = #textoCompleto + 1
        completo = true
    end
end
