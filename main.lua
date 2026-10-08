local customFont -- Создаем переменную для нашего шрифта

function love.load()
    -- Настраиваем заголовок окна панели
    love.window.setTitle("DOORS Tournament Hub")
    love.window.setMode(1000, 700)
    
    -- Загружаем твой шрифт (файл должен лежать рядом с main.lua!)
    -- Цифра 24 — это размер букв
    customFont = love.graphics.newFont("doorsFont.ttf", 24)
end

function love.draw()
    -- Делаем фирменный темно-коричневый фон DOORS
    love.graphics.clear(0.15, 0.1, 0.08) 
    
    -- Говорим движку использовать наш загруженный шрифт с поддержкой русского языка
    love.graphics.setFont(customFont)
    
    -- Теперь кириллица отобразится идеально!
    love.graphics.print("Турнир-Панель DOORS: В разработке...", 50, 50)
end
