menu_screen = {}

local BT_WDT = 417
local BT_HGT = 75

local mx, my = 0, 0

local bt_play = {}
local bt_resume = {}
local bt_quit = {}

function menu_screen.load()
    menu_screen.bg = love.graphics.newImage("assets/images/menu/menu_bg.jpg")

    bt_play.img = love.graphics.newImage("assets/images/menu/bt_play.png")
    bt_play.quads = {
        love.graphics.newQuad(0, 0, BT_WDT, BT_HGT, bt_play.img:getDimensions()),
        love.graphics.newQuad(BT_WDT, 0, BT_WDT, BT_HGT, bt_play.img:getDimensions())
    }
    bt_play.isHovered = false
    bt_play.x = 752
    bt_play.y = 670
    bt_play.w = BT_WDT
    bt_play.h = BT_HGT

    bt_resume.img = love.graphics.newImage("assets/images/menu/bt_resume.png")
    bt_resume.quads = {
        love.graphics.newQuad(0, 0, BT_WDT, BT_HGT, bt_resume.img:getDimensions()),
        love.graphics.newQuad(BT_WDT, 0, BT_WDT, BT_HGT, bt_resume.img:getDimensions())
    }
    bt_resume.isHovered = false
    bt_resume.x = 752
    bt_resume.y = 776
    bt_resume.w = BT_WDT
    bt_resume.h = BT_HGT

    bt_quit.img = love.graphics.newImage("assets/images/menu/bt_quit.png")
    bt_quit.quads = {
        love.graphics.newQuad(0, 0, BT_WDT, BT_HGT, bt_quit.img:getDimensions()),
        love.graphics.newQuad(BT_WDT, 0, BT_WDT, BT_HGT, bt_quit.img:getDimensions())
    }
    bt_quit.isHovered = false
    bt_quit.x = 752
    bt_quit.y = 883
    bt_quit.w = BT_WDT
    bt_quit.h = BT_HGT
end

function menu_screen.init()
    narrative_screen.current_music = track_menu
    narrative_screen.current_music:setLooping(true)
    narrative_screen.current_music:play()
end

function menu_screen.update(dt)
    mx, my = fix_xy(love.mouse.getPosition())

    -- Verifica si el mouse está sobre el botón
    bt_play.isHovered = into_rect(bt_play, mx, my)

    bt_resume.isHovered = into_rect(bt_resume, mx, my)

    bt_quit.isHovered = into_rect(bt_quit, mx, my)
end

function menu_screen.mousepressed(x, y, button)
    if button == 1 then
        if bt_play.isHovered then
            narrative_screen.current_music:stop()
            narrative_screen.set_level(levels[2])
            goto_screen(narrative_screen)
        elseif bt_resume.isHovered then
            narrative_screen.current_music:stop()
            narrative_screen.set_level(levels[2])
            goto_screen(narrative_screen)
        elseif bt_quit.isHovered then
            love.event.quit()
        end
    end
end

function menu_screen.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function menu_screen.draw()
    love.graphics.draw(menu_screen.bg, 0, 0)

    local frame = bt_play.isHovered and 2 or 1
    love.graphics.draw(bt_play.img, bt_play.quads[frame], bt_play.x, bt_play.y)

    local frame = bt_resume.isHovered and 2 or 1
    love.graphics.draw(bt_resume.img, bt_resume.quads[frame], bt_resume.x, bt_resume.y)

    local frame = bt_quit.isHovered and 2 or 1
    love.graphics.draw(bt_quit.img, bt_quit.quads[frame], bt_quit.x, bt_quit.y)
end