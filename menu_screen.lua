menu_screen = {}

function menu_screen_init()
    menu_screen.draw = menu_screen_draw
    menu_screen.update = menu_screen_update
    menu_screen.keypressed = menu_screen_keypressed

    menu_screen.bg = love.graphics.newImage("assets/images/menu/menu_bg.jpg")
    menu_screen.bt_play = love.graphics.newImage("assets/images/menu/bt_play.jpg")
    menu_screen.bt_credits = love.graphics.newImage("assets/images/menu/bt_credits.jpg")
    menu_screen.bt_quit = love.graphics.newImage("assets/images/menu/bt_quit.jpg")
end

function menu_screen_update(dt)
end

function menu_screen_draw()
    love.graphics.draw(menu_screen.bg, 0, 0)

    local limit = 2000
    local x = (virtual_width - limit) / 2 -- Centra el recuadro de 600px
    -- love.graphics.print("MENÚ PRINCIPAL", 0, 100)
    love.graphics.printf("MENÚ PRINCIPAL", x, 100, limit, "center")
    love.graphics.printf("Presiona 1 para ir a Pantalla Creditos", x, 150, limit, "center")
    love.graphics.printf("Presiona 2 para ir a Pantalla Juego", x, 180, limit, "center")
end

function menu_screen_keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "1" then
        current_screen = credits_screen
    elseif key == "2" then
        current_screen = game_screen
    end
end