-- Создаем переменную для нашего шрифта
local customFont 

function love.load()
    love.window.setTitle("DOORS Tournament Hub")
    love.window.setMode(1000, 700)
    
    -- ВАЖНО: Принудительно заставляем Love2D искать файлы 
    -- в той папке, где запущен проект (где лежит ваш main.lua)
    love.filesystem.setIdentity(".") 
    
    -- Теперь движок гарантированно найдет файл doorsFont.ttf на вашем ПК!
    customFont = love.graphics.newFont("doorsFont.ttf", 24)
end

-------------------------------

local GuiService = {}
GuiService.Elements = {}

-- Функция создания кнопки (как Instance.new("TextButton") в Roblox)
function GuiService.newButton(name, text, x, y, width, height, onClickFunction)
    local button = {
        name = name,
        text = text,
        x = x,
        y = y,
        width = width,
        height = height,
        -- Привязываем функцию клика (как MouseButton1Click:Connect)
        MouseButton1Click = onClickFunction, 
        isHovered = false
    }
    table.insert(GuiService.Elements, button)
    return button
end

----------------------------------

function love.update(dt)
    local mx, my = love.mouse.getPosition()
    -- Автоматически проверяем наведение мышки на ВСЕ наши кнопки
    for _, btn in ip000000000air = pairs(GuiService.Elements) do
        if mx >= btn.x and mx <= btn.x + btn.width and my >= btn.y and my <= btn.y + btn.height then
            btn.isHovered = true
        else
            btn.isHovered = false
        end
    end
end

function love.mousepressed(x, y, mouse_button, isTouch)
    -- Если нажата левая кнопка мыши (MouseButton1)
    if mouse_button == 1 then
        -- Проверяем, на какую из кнопок мы нажали
        for _, btn in pairs(GuiService.Elements) do
            if btn.isHovered and btn.MouseButton1Click then
                btn.MouseButton1Click() -- Вызываем привязанную функцию!
            end
        end
    end
end

-----------------------------------

function love.draw()
    -- Фирменный темно-коричневый фон DOORS
    love.graphics.clear(0.15, 0.1, 0.08) 
    
    -- Проверка на случай, если шрифт всё же не загрузился (включит стандартный)
    if customFont then
        love.graphics.setFont(customFont)
    else
        local fallbackFont = love.graphics.newFont(24)
        love.graphics.setFont(fallbackFont)
    end
    
    -- Отрисовка текста
    love.graphics.print("Турнир-Панель DOORS: В разработке...", 50, 50)
end

GuiService.newButton("gaz", "GAZGAZGAZ", 500, 350, 100, 100, function()
    love.event.quit()
end)

-- Вручную запускаем инициализацию сразу после загрузки скрипта из сети
love.load()
