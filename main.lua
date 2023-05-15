function love.load(args)
    -- control --
    gamestate = require 'libraries.control.gamestate'
    camera = require 'libraries.control.camera'
    timer = require 'libraries.control.timer'
    console = require 'libraries.control.console'
    -- filesystem --
    json = require 'libraries.filesystem.json'
    nativefs = require 'libraries.filesystem.nativefs'
    lip = require 'libraries.filesystem.lip'
    xml = require 'libraries.filesystem.xml'
    -- interface --
    suit = require 'libraries.interface.suit'
    gui = require 'libraries.interface.gspot'
    -- post processing --
    moonshine = require 'libraries.post-processing.moonshine'
    -- physics --
    bump = require 'libraries.physics.bump'
    -- utilities --
    collision = require 'libraries.utilities.collision'
    -- Basic 3D engine --
    g3d = require 'libraries.3D.g3d'

    -- load new console commands --
    console:new(90, 90)

    -- addons loader --
    Addons = love.filesystem.getDirectoryItems("libraries/addons")
    for addon = 1, #Addons, 1 do
        require("libraries.addons." .. string.gsub(Addons[addon], ".lua", ""))
    end

    -- default filter --
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- state loader--
    States = love.filesystem.getDirectoryItems("src/States")
    for state = 1, #States, 1 do
        require("src.States." .. string.gsub(States[state], ".lua", ""))
    end

    -- every argument passed to the game will direct to console
    if #args > 0 then
        console:run(table.concat(args, " "))
    end

    gamestate.registerEvents({'update', 'textinput', 'keypressed', 'mousepressed', 'mousereleased'})
    gamestate.switch(playstate)
end

function love.draw()
    gamestate.current():draw()
    suit.draw()
    console:render()
end

function love.update(elapsed)
    console:update()
end

function love.textinput(text)
    suit.textinput(text)
    console:textinput(text)
end

function love.textedited(text)
    suit.textedited(text)
end

function love.keypressed(k)
    suit.keypressed(k)
    console:keypressed(k)
end

function love.mousepressed(x, y, button)
    console:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
    console:mousereleased(x, y, button)
end

function love.errhand(error_message)
    local tracebackError = debug.traceback(error_message or "")
    local buttons = {"abort"}
    local errorText = [[
LuminaSDK found a error during the execution.

%s
    ]]
    local pressedButton = love.window.showMessageBox("LuminaSDK Exception", string.format(errorText, tracebackError), buttons, "error")
end