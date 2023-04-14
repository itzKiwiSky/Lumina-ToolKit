function love.load()
    -- control --
    gamestate = require 'libraries.control.gamestate'
    camera = require 'libraries.control.camera'
    timer = require 'libraries.control.timer'
    -- filesystem --
    json = require 'libraries.filesystem.json'
    nativefs = require 'libraries.filesystem.nativefs'
    lip = require 'libraries.filesystem.lip'
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

    -- addons loader --
    Addons = love.filesystem.getDirectoryItems("libraries/addons")
    for addon = 1, #Addons, 1 do
        require("libraries.addons." .. string.gsub(Addons[addon], ".lua", ""))
    end

    States = {
        PlayState = require 'src.States.PlayState'
    }

    gamestate.registerEvents()
    gamestate.switch(States.PlayState)

end
