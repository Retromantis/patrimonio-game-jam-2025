game_screen = {}

function game_screen_init()
    game_screen.draw = game_screen_draw
    game_screen.update = game_screen_update
    game_screen.keypressed = game_screen_keypressed
end

function game_screen_draw()
    love.graphics.printf("Pantalla Juego", 0, 100, love.graphics.getWidth(), "center")
    love.graphics.printf("Presiona ESC para volver al menú", 0, 150, love.graphics.getWidth(), "center")
end

function game_screen_update(dt)
end

function game_screen_keypressed(key)
    if key == "escape" then
        current_screen = menu_screen
    end
end