-- Создаем переменную для нашего шрифта
local customFont 

function love.load()
    -- Настраиваем заголовок окна панели
    love.window.setTitle("DOORS Tournament Hub")
    love.window.setMode(1000, 700)
    
    -- Загружаем твой шрифт (файл должен лежать рядом с локальным main.lua!)
    customFont = love.graphics.newFont("doorsFont.ttf", 24)
end

function love.draw()
    -- Делаем фирменный темно-коричневый фон DOORS
    love.graphics.clear(0.15, 0.1, 0.08) 
    
    -- Защита: если вдруг шрифт ещё не загрузился, создаем его на лету
    if not customFont then
        customFont = love.graphics.newFont("doorsFont.ttf", 24)
    end
    
    -- Говорим движку использовать наш загруженный шрифт
    love.graphics.setFont(customFont)
    
    -- Теперь кириллица отобразится идеально!
    love.graphics.print("Турнир-Панель DOORS: В разработке...", 50, 50)
end

-- ВАЖНО: Вручную вызываем love.load(), чтобы принудительно 
-- применились размеры окна, заголовок и загрузился шрифт
love.load()
