local math = require("math")

posX = 0
anguloRotacao = 0

function DefinePontoX(xCentro, yCentro, raio, angulo)
    x = xCentro + raio * math.cos(math.rad(angulo))

    return x
end

function DefinePontoY(xCentro, yCentro, raio, angulo)
    y = yCentro + raio * math.sin(math.rad(angulo))

    return y
end

function love.draw()
    xCentro = 200
    yCentro = 200
    rMaior = 100
    nPontas = 50
    saltos = 13

    for n = 1, nPontas do
        ponto1X = DefinePontoX(posX + xCentro, yCentro, rMaior, anguloRotacao + 360 * saltos * (n ^ 2 - 1) / nPontas)
        ponto1Y = DefinePontoY(posX + xCentro, yCentro, rMaior, anguloRotacao + 360 * saltos * (n ^ 2 - 1) / nPontas)
        ponto2X = DefinePontoX(posX + xCentro, yCentro, rMaior, anguloRotacao + (360 * saltos * n ^ 2) / nPontas)
        ponto2Y = DefinePontoY(posX + xCentro, yCentro, rMaior, anguloRotacao + (360 * saltos * n ^ 2) / nPontas)

        love.graphics.line(ponto1X, ponto1Y, ponto2X, ponto2Y)
    end
end

--Será o loop no qual o jogo rodará até ser fechado. Aqui ocorrerão os eventos em tempo real.
function love.update(dt)
    --quando a seta da esquerda for pressionada
    if love.keyboard.isDown("left") then
        --[[ dt é uma constante que contra os frames da tela
        ele move a posX para 100 frames pro lado ]]
        --
        posX = posX - 100 * dt
        --girando a imagem
        anguloRotacao = anguloRotacao - dt * 50
    end

    --seta direita
    if love.keyboard.isDown("right") then
        --[[ dt é uma constante que contra os frames da tela
        ele move a posX para 100 frames pro lado ]]
        --
        posX = posX + 100 * dt
        --girando a imagem
        anguloRotacao = anguloRotacao + dt * 50
    end
end
