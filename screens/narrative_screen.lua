require("assets.levels.levels")

narrative_screen = {
    dialog_frame = love.graphics.newImage("assets/images/narrative/dialog_frame.png"),
    cinematic_frame = love.graphics.newImage("assets/images/narrative/cinematic_frame.png"),
}

local mx, my = 0, 0

local BT_WDT = 79
local BT_HGT = 79
local bt_next = {}

local NUM_BACKGROUNDS = 0
local lst_backgrounds = {}

local NUM_PARAGRAPHS = 0
local idx_paragraph = 1
local lst_paragraphs = {}

local DIALOG_TEXT_X = 523
local DIALOG_TEXT_Y = 643
local DIALOG_TEXT_W = 900

local DIALOG_TEXT_BG_X = 440
local DIALOG_TEXT_BG_Y = 586
local DIALOG_TEXT_BG_W = 1048
local DIALOG_TEXT_BG_H = 320

local DIALOG_BT_NEXT_X = 1512
local DIALOG_BT_NEXT_Y = 826

local SLIDE_TEXT_X = 523
local SLIDE_TEXT_Y = 725
local SLIDE_TEXT_W = 900

local SLIDE_TEXT_BG_X = 0
local SLIDE_TEXT_BG_Y = 800
local SLIDE_TEXT_BG_W = 1920
local SLIDE_TEXT_BG_H = 280

local SLIDE_BT_NEXT_X = 1512
local SLIDE_BT_NEXT_Y = 920

local text_bg_x = DIALOG_TEXT_BG_X
local text_bg_y = DIALOG_TEXT_BG_Y
local text_bg_w = DIALOG_TEXT_BG_W
local text_bg_h = DIALOG_TEXT_BG_H

local title = ""
local text = ""
local TITLE_X, TITLE_Y = 802, 555
local TITLE_W = 320
local text_x, text_y = DIALOG_TEXT_X, DIALOG_TEXT_Y
local text_w = DIALOG_TEXT_W
local command = 0

local current_level = nil

function narrative_screen.load()
    bt_next.img = love.graphics.newImage("assets/images/narrative/bt_next.png")
    bt_next.quads = {
        love.graphics.newQuad(0, 0, BT_WDT, BT_HGT, bt_next.img:getDimensions()),
        love.graphics.newQuad(BT_WDT, 0, BT_WDT, BT_HGT, bt_next.img:getDimensions())
    }
    bt_next.isHovered = false
    bt_next.x = DIALOG_BT_NEXT_X
    bt_next.y = DIALOG_BT_NEXT_Y
    bt_next.w = BT_WDT
    bt_next.h = BT_HGT

    textObject = love.graphics.newText(tahoma_regular, "")

    narrative_screen.set_level(levels[1])

    NUM_BACKGROUNDS = #backgrounds

    for i = 1, NUM_BACKGROUNDS do
        lst_backgrounds[backgrounds[i][1]] = love.graphics.newImage("assets/images/backgrounds/" .. backgrounds[i][2])
    end
end

function narrative_screen.set_level(level)
    current_level = level
    lst_paragraphs = level.paragraphs
    NUM_PARAGRAPHS = #lst_paragraphs
end

function narrative_screen.init()
    if current_level and current_level.on_start then
        current_level.on_start()
    end
    idx_paragraph = 1
    scene_background = nil
    texture_background = nil

    narrative_screen.update_scene()
end

function narrative_screen.draw()
    if scene_background then
        love.graphics.draw(scene_background, 0, 0)
    end

    if texture_id and texture_id ~= "" then
        love.graphics.draw(texture_background, 0, 0)  

        love.graphics.draw(narrative_screen.dialog_frame, 0, 0)
        love.graphics.printf(title, TITLE_X, TITLE_Y, TITLE_W, "center")
    elseif text and text ~= "" then
            love.graphics.draw(narrative_screen.cinematic_frame, 0, 0)
    end
    
    if text and text ~= "" then
        love.graphics.draw(textObject, text_x, text_y)
    end

    local frame = bt_next.isHovered and 2 or 1
    love.graphics.draw(bt_next.img, bt_next.quads[frame], bt_next.x, bt_next.y)
end

function narrative_screen.update(dt)
    mx, my = fix_xy(love.mouse.getPosition())

    bt_next.isHovered = into_rect(bt_next, mx, my)
end

function narrative_screen.keypressed(key)
    if key == "space" then
        narrative_screen.next_scene()
    elseif key == "escape" then
        -- Volver al menú principal o a la pantalla anterior
        goto_screen(menu_screen)
    end
end

function narrative_screen.mousepressed(x, y, button)
    if button == 1 then
        if bt_next.isHovered then
            narrative_screen.next_scene()
        end
    end
end

function narrative_screen.next_scene()
    if idx_paragraph < NUM_PARAGRAPHS then
        idx_paragraph = idx_paragraph + 1
        narrative_screen.update_scene()
    elseif current_level.on_finish then
        current_level.on_finish()
    end
end

function narrative_screen.update_scene()
    background_id = lst_paragraphs[idx_paragraph][1]
    texture_id = lst_paragraphs[idx_paragraph][2]
    title = lst_paragraphs[idx_paragraph][3]
    text = lst_paragraphs[idx_paragraph][4]

    if background_id and background_id ~= "" then
        scene_background = lst_backgrounds[background_id]
    else
        scene_background = nil  
    end

    if text and text ~= "" then
        if texture_id and texture_id ~= "" then
            texture_background = lst_backgrounds[texture_id]

            text_x = DIALOG_TEXT_X
            text_y = DIALOG_TEXT_Y
            text_w = DIALOG_TEXT_W
            text_bg_x = DIALOG_TEXT_BG_X
            text_bg_y = DIALOG_TEXT_BG_Y
            text_bg_w = DIALOG_TEXT_BG_W
            text_bg_h = DIALOG_TEXT_BG_H
            bt_next.x = DIALOG_BT_NEXT_X
            bt_next.y = DIALOG_BT_NEXT_Y
        else
            texture_background = nil

            text_x = SLIDE_TEXT_X
            text_y = SLIDE_TEXT_Y
            text_w = SLIDE_TEXT_W
            text_bg_x = SLIDE_TEXT_BG_X
            text_bg_y = SLIDE_TEXT_BG_Y
            text_bg_w = SLIDE_TEXT_BG_W
            text_bg_h = SLIDE_TEXT_BG_H
            bt_next.x = SLIDE_BT_NEXT_X
            bt_next.y = SLIDE_BT_NEXT_Y
        end

        textObject:setf(text, text_w, "left")
    end        
end