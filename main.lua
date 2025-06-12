require("splash_screen")
require("menu_screen")
require("credits_screen")
require("game_screen")

virtual_width = 1920
virtual_height = 1080
local canvas
local scale_x, scale_y

-- local splash_screen = {}
-- local menu_screen = {}
-- local credits_screen = {}
-- local game_screen = {}

function love.load()
    -- fondo = love.graphics.newImage("assets/images/splash/splash_bg.jpg")
    -- Obtener resolución de pantalla completa
    local screen_width, screen_height = love.window.getDesktopDimensions()
    
    -- Activar modo pantalla completa
    love.window.setMode(screen_width, screen_height, {
        fullscreen = true,
        fullscreentype = "desktop",
        vsync = 1,
        msaa = 4
    })

    -- Crear canvas de resolución virtual
    canvas = love.graphics.newCanvas(virtual_width, virtual_height)
    canvas:setFilter("nearest", "nearest")
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- Calcular escala para llenar la pantalla (puedes usar math.min para mantener aspect ratio)
    scale_x = screen_width / virtual_width
    scale_y = screen_height / virtual_height

    -- splash_screen.draw = splash_screen_draw
    -- splash_screen.keypressed = splash_screen_keypressed
    splash_screen_init()
    menu_screen_init()
    credits_screen_init()
    game_screen_init()

    current_screen = splash_screen
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
    current_screen.update(dt)
end

function love.keypressed(key)
    current_screen.keypressed(key)
end