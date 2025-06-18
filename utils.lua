function fix_xy(x, y)
    return x / scale_x, y / scale_y
end

function into_rect(rect, px, py)
    local x, y, w, h = rect.x, rect.y, rect.w, rect.h
    return px >= x and px <= x + w and
           py >= y and py <= y + h
end