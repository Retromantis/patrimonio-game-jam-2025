splash_screen = {}

function splash_screen_init()
    splash_screen.draw = splash_screen_draw
    splash_screen.update = splash_screen_update
    splash_screen.keypressed = splash_screen_keypressed
    splash_screen.splash_delay = 2 -- segundos de espera
    splash_screen.elapsed_time = 0 -- Tiempo transcurrido

    splash_screen.bg = love.graphics.newImage("assets/images/splash/splash_bg.jpg")
end

function splash_screen_draw()
   love.graphics.draw(splash_screen.bg, 0, 0)
end

function splash_screen_update(dt)
    splash_screen.elapsed_time = splash_screen.elapsed_time + dt
    if splash_screen.elapsed_time >= splash_screen.splash_delay then
        current_screen = menu_screen
    end
end

function splash_screen_keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end