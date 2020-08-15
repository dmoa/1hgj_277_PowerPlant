la = love.audio
ld = love.data
le = love.event
lfile = love.filesystem
lf = love.font
lg = love.graphics
li = love.image
lj = love.joystick
lk = love.keyboard
lm = love.math
lmouse = love.mouse
lp = love.physics
lsound = love.sound
lsys = love.system
lth = love.thread
lt = love.timer
ltouch = love.touch
lv = love.video
lw = love.window

lg.setDefaultFilter("nearest", "nearest", 1)
lg.setLineStyle('rough')

splash = require "libs/splash"

function love.draw() splash:update() end
splash:startSplashScreen("start_screen.png", "", 1500, 500, 2, {}, function()

input = require "libs/input"
push = require "libs/push"
require "libs/AABB"
game_width, game_height = 800, 800
window_width, window_height = 800, 800
lw.setMode(window_width, window_height, {borderless = false})
push:setupScreen(game_width, game_height, window_width, window_height, {fullscreen = false, resizable = true, borderless = false})

screen = require "libs/shack"
screen:setDimensions(push:getDimensions())

player = require "Player"
fire = require "Fire"
rocks = require "Rocks"

font = love.graphics.newFont(20)

score = 0

function love.draw()
    screen:apply()
    push:start()

    lg.print("Coal Hunt\nwasd / arrow keys to move\ncollect rock coals and deliver them to the power plant\nStan O", font, 15, 100)
    lg.print("score: "..tostring(score), font, 15, 225)
    fire:Draw()
    player:Draw()
    rocks:Draw()

    push:finish()
end

function love.update(dt)
    screen:update(dt)
    player:Update(dt)
    fire:Update(dt)
    rocks:Update(dt)
end

function love.keypressed(key)
    if key == "escape" then le.quit() end
    if key == "return" and lk.isDown("lalt") then push:switchFullscreen() end
end

function love.resize(w, h)
  push:resize(w, h)
  lg.clear()
end

end)