local customFont 

-- ========================================================
-- НАШ КУСТАРНЫЙ GUI СЕРВИС
-- ========================================================
local GuiService = {}
GuiService.Elements = {}

-- Функция создания кнопки (как Instance.new("TextButton"))
function GuiService.newButton(name, text, x, y, width, height, onClickFunction)
    local button = {
        name = name,
        text = text,
        x = x,
        y = y,
        width = width,
        height = height,
        MouseButton1Click = onClickFunction, 
        isHovered = false
    }
    table.insert(GuiService.Elements, button)
    return button
end

-- ========================================================
-- ЗАГРУЗКА ИГРЫ
-- ========================================================
function love.load()
    love.window.setTitle("DOORS Tournament Hub")
    love.window.setMode(1000, 700)
    
    love.filesystem.setIdentity(".") 
    customFont = love.graphics.newFont("doorsFont.ttf", 24)

    -- Перенесли создание кнопки СЮДА (внутри love.load)
    -- Она закроет игру при нажатии, так как привязан love.event.quit
    GuiService.newButton("gaz", "GAZGAZGAZ", 500, 350, 200, 60, function()
        love.event.quit()
    end)
end

-- ========================================================
-- ОБНОВЛЕНИЕ ЛОГИКИ (КАДРЫ)
-- ========================================================
function love.update(dt)
    local mx, my = love.mouse.getPosition()
    
    -- ИСПРАВЛЕНО: Чистый и правильный цикл без опечаток
    for _, btn in pairs(GuiService.Elements) do
        if mx >= btn.x and mx <= btn.x + btn.width and my >= btn.y and my <= btn.y + btn.height then
            btn.isHovered = true
        else
            btn.isHovered = false
        end
    end
end

-- ========================================================
-- ОТСЛЕЖИВАНИЕ КЛИКОВ МЫШКИ
-- ========================================================
function love.mousepressed(x, y, mouse_button, isTouch)
    if mouse_button == 1 then
        for _, btn in pairs(GuiService.Elements) do
            if btn.isHovered and btn.MouseButton1Click then
                btn.MouseButton1Click() 
            end
        end
    end
end

-- ========================================================
-- ОТРИСОВКА ГРАФИКИ
-- ========================================================
function love.draw()
    -- Фирменный темно-коричневый фон DOORS
    love.graphics.clear(0.15, 0.1, 0.08) 
    
    if customFont then
        love.graphics.setFont(customFont)
    else
        local fallbackFont = love.graphics.newFont(24)
        love.graphics.setFont(fallbackFont)
    end
    
    -- Рисуем текст заголовка
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Турнир-Панель DOORS: В разработке...", 50, 50)

    -- ДОБАВЛЕНО: Автоматически рисуем все кнопки из таблицы GuiService
    for _, btn in pairs(GuiService.Elements) do
        -- Если мышка наведена — делаем кнопку светлее
        if btn.isHovered then
            love.graphics.setColor(0.4, 0.3, 0.2)
        else
            love.graphics.setColor(0.25, 0.18, 0.12)
        end
        
        -- Тело кнопки и золотая обводка DOORS
        love.graphics.rectangle("fill", btn.x, btn.y, btn.width, btn.height, 5)
        love.graphics.setColor(0.8, 0.6, 0.2) 
        love.graphics.rectangle("line", btn.x, btn.y, btn.width, btn.height, 5)
        
        -- Текст внутри кнопки
        love.graphics.setColor(1, 1, 1)
        love.graphics.print(btn.text, btn.x + 20, btn.y + 15)
    end
end

-- Принудительный старт настроек
love.load()
