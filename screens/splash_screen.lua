splash_screen = {

    splash_delay = 2,
    elapsed_time = 0,

    bg = love.graphics.newImage("assets/images/splash/splash_bg.jpg"),

    load = function()
    end,

    draw = function()
        love.graphics.draw(splash_screen.bg, 0, 0)
    end,

    init = function()
    end,

    update = function(dt)
        splash_screen.elapsed_time = splash_screen.elapsed_time + dt
        if splash_screen.elapsed_time >= splash_screen.splash_delay then
            current_screen = menu_screen
        end
    end,

    keypressed = function(key)
        if key == "escape" then
            love.event.quit()
        end
    end,

    mousepressed = function(x, y, button)
    end
}