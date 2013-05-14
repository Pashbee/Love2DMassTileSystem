require "class"
require "resources"
require "debugstatus"
require "world"
require "block"
require "camera"
require "collision"
require "player"
require "funfuncs"


function love.load()
	PlayerCam = camera:new()
	DB = debugstatus:new(true)
	GameWorld = world:new(200,200)
	LoadBlockResources()
	BlockLoad()
	GameWorld:randomSeedMap()
	Hero = player:new(5, 100, -100)
end

function love.update(dt)
	GameWorld:update()
	Hero:control(dt)
	PlayerCam:follow(Hero)
end


function love.draw()
	PlayerCam:set()
	GameWorld:draw()
	DB:draw()
	Hero:draw()
	PlayerCam:unset()
end

function love.keypressed(key)
	DB:keypressed(key)
	if key == "escape" then 
		love.event.push("quit")
	end
	Hero:jumping(key)
end