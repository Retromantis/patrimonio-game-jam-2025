credits_screen = {}

function credits_screen_init()
    credits_screen.draw = credits_screen_draw
    credits_screen.update = credits_screen_update
    credits_screen.keypressed = credits_screen_keypressed
end

function credits_screen_draw()
    love.graphics.printf("Pantalla Creditos", 0, 100, love.graphics.getWidth(), "center")
    love.graphics.printf("Presiona ESC para volver al menú", 0, 150, love.graphics.getWidth(), "center")
end

function credits_screen_update(dt)
end

function credits_screen_keypressed(key)
    if key == "escape" then
        current_screen = menu_screen
    end
end