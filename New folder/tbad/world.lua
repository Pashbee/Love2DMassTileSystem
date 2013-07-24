world = class:new()

function world:init( bgx,bgy ) 
	-- This is the effective combined block size of the world
	self.blockGridXSize = bgx
	self.blockGridYSize = bgy 
	-- Each block Width & Height
	self.blockSize = 16

	-- all the world blocks
	WorldBlocks = {}
	love.graphics.setBackgroundColor(82,198,233)
	
	
end

function world:update()
	local oldpcxMin,oldpcxMax = self:CheckBlockXMinMax()
	local oldpcyMin,oldpcyMax = self:CheckBlockYMinMax()
	local newpcxMin = math.floor(PlayerCam.x - self.blockSize / self.blockSize)
		if newpcxMin <= 0 then
			newpcxMin = 1
		end 

	if newpcxMin ~= oldpcxMin then
		self:updateSpriteBatch()
	end 

end

function world:CheckBlockXMinMax()
	local xMin = math.floor(PlayerCam.x - self.blockSize / self.blockSize)
	local xMax = math.floor(PlayerCam.x + love.graphics.getWidth() / self.blockSize)
	if xMin <=0 then
		xMin = 1
	end
	return xMin,xMax
end

function world:CheckBlockYMinMax()
	local yMin = math.floor(PlayerCam.y - self.blockSize / self.blockSize)
	local yMax = math.floor(PlayerCam.y + love.graphics.getHeight() / self.blockSize)
	if yMin <=0 then
		yMin = 1
	end
	if yMax <=0 then
		yMax = 1
	end
	return yMin,yMax
end


function world:updateSpriteBatch()
	local xdmin,xdmax = self:CheckBlockXMinMax()
	local ydmin,ydmax = self:CheckBlockYMinMax()

	blockSetBatch:bind()
	blockSetBatch:clear()
	for i=ydmin,ydmax do
  		for j=xdmin,xdmax do
  			if WorldBlocks[i][j].idno ~= 0 then 
  				blockSetBatch:addq( WorldBlocks[i][j].id.img, j * self.blockSize - self.blockSize, i * self.blockSize - self.blockSize ) 
  			end  
  		end
  	end
	blockSetBatch:unbind()
end




function world:draw()
	love.graphics.draw(blockSetBatch)
end

function world:randomSeedMap()
	local cBlock = 0
	local BaseLevel = math.random(15,25)
	self.baseHeightConstant = (BaseLevel * self.blockSize) - self.blockSize
	
	for i=1,self.blockGridYSize do
  		WorldBlocks[i] = {}
  		for j=1,self.blockGridXSize do
  			if i == BaseLevel then
  				cBlock = 1
  			end 
  			if i > BaseLevel then  
  				cBlock = 2
  			end  			
  			 
  			WorldBlocks[i][j] = {id = SelectBlock(cBlock), idno = cBlock}
  		end
	end
self:updateSpriteBatch()
end

