function love.load()
    -- Crear el canvas (zona de dibujo)
    canvasWidth = 800
    canvasHeight = 600
    drawCanvas = love.graphics.newCanvas(canvasWidth, canvasHeight)

    -- Color del pincel
    brushColor = {1, 0, 0} -- rojo

    -- Control de dibujo
    isDrawing = false
end

function love.mousepressed(x, y, button)
    if button == 1 then
        isDrawing = true
        drawOnCanvas(x, y)
    end
end

function love.mousereleased(x, y, button)
    if button == 1 then
        isDrawing = false
    end
end

function love.mousemoved(x, y, dx, dy)
    if isDrawing then
        drawOnCanvas(x, y)
    end
end

function drawOnCanvas(x, y)
    love.graphics.setCanvas(drawCanvas)
    love.graphics.setColor(brushColor)
    love.graphics.circle("fill", x, y, 4) -- tamaño del pincel
    love.graphics.setCanvas()
end

function love.draw()
    love.graphics.setColor(1, 1, 1) -- blanco
    love.graphics.draw(drawCanvas, 0, 0)
    
    -- (opcional) dibujar borde del canvas
    love.graphics.setColor(0.5, 0.5, 0.5)
    love.graphics.rectangle("line", 0, 0, canvasWidth, canvasHeight)
end
