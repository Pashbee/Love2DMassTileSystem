
function LoadBlockResources()
	spr_the_block = love.graphics.newImage("images/spr_tbad_blocks.png")

	grassFlatBlock_spr = love.graphics.newQuad(0 * GameWorld.blockSize, 0 * GameWorld.blockSize, 1 * GameWorld.blockSize, 1 * GameWorld.blockSize,
												10 * GameWorld.blockSize, 10 * GameWorld.blockSize)
	DirtBlock_spr = love.graphics.newQuad(1 * GameWorld.blockSize, 0 * GameWorld.blockSize, 1 * GameWorld.blockSize, 1 * GameWorld.blockSize,
												10 * GameWorld.blockSize, 10 * GameWorld.blockSize)

	blockSetBatch = love.graphics.newSpriteBatch(spr_the_block, GameWorld.blockGridXSize * GameWorld.blockGridYSize)

end

-- Placeholder block
--spr_the_block = love.graphics.newImage("images/spr_tbad_blocks_1.png")
--spr_the_block2 = love.graphics.newImage("images/spr_tbad_blocks_2.png")