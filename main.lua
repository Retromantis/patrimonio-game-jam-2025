require("utils")
require("screens.splash_screen")
require("screens.menu_screen")
require("screens.credits_screen")
require("screens.game_screen")
require("screens.narrative_screen")

virtual_width = 1920
virtual_height = 1080
scale_x, scale_y = 0, 0
local canvas

-- lovebird = require "lovebird"

function love.load()
    -- Obtener resolución de pantalla completa
    local screen_width, screen_height = love.window.getDesktopDimensions()

    tahoma_regular = love.graphics.newFont("assets/fonts/tahoma.ttf", 36) -- 36 es el tamaño
    love.graphics.setFont(tahoma_regular)

    -- love.window.setMode(screen_width, screen_height, {
    --     fullscreen = true,
    --     fullscreentype = "desktop",
    --     vsync = 1,
    --     msaa = 4
    -- })

    -- Crear canvas de resolución virtual
    canvas = love.graphics.newCanvas(virtual_width, virtual_height)
    canvas:setFilter("nearest", "nearest")
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- Calcular escala para llenar la pantalla (puedes usar math.min para mantener aspect ratio)
    scale_x = screen_width / virtual_width
    scale_y = screen_height / virtual_height

    splash_screen.load()
    menu_screen.load()
    -- credits_screen_load()
    -- game_screen_load()
    narrative_screen.load()

    track_menu = love.audio.newSource("assets/sounds/menu.wav", "stream")
    track_02 = love.audio.newSource("assets/sounds/track02.ogg", "stream")
    track_03 = love.audio.newSource("assets/sounds/track03.ogg", "stream")
    track_06 = love.audio.newSource("assets/sounds/track06.ogg", "stream")
    track_12 = love.audio.newSource("assets/sounds/track12.ogg", "stream")

    goto_screen(narrative_screen)
end

function goto_screen(screen)
    screen.init()
    current_screen = screen
end

function love.draw()
    -- Dibujar en el canvas virtual
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    current_screen.draw()
    love.graphics.setCanvas()

    -- Escalar y dibujar el canvas a pantalla completa
    -- love.graphics.setColor(1, 1, 1)
    love.graphics.draw(canvas, 0, 0, 0, scale_x, scale_y)
end

function love.update(dt)
    -- lovebird.update()
    current_screen.update(dt)
end

function love.keypressed(key)
    current_screen.keypressed(key)
end

function love.mousepressed(x, y, button)
    current_screen.mousepressed(x, y, button)
end