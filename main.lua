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

-- Вручную запускаем инициализацию сразу после загрузки скрипта из сети
love.load()
