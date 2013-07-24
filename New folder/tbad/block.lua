function BlockLoad()
	emptyBlock = { img = nil, hp = 0 }
	grassFlatBlock = { img = grassFlatBlock_spr, hp = 50 }
	dirtBlock = { img = DirtBlock_spr, hp = 50 }
end 

function BlockSpawn( sx,sy,cbid,cbidno,sz )
	if cbidno ~= 0 then
		worldBlocks[#worldBlocks + 1] = { x = math.floor(sx / sz), y = math.floor(sy / sz), id = cbid, numid = cbidno }
	end 
end

function BlockHitboxSpawn( hbx,hby,hbs )
	table.insert(blockHitboxes, { x = hbx, y = hby, sz = hbs })
end

function SelectBlock( id )
	if id == 0 then
		return emptyBlock
	elseif id == 1 then
		return grassFlatBlock
	elseif id == 2 then 
		return dirtBlock
	end
end

function GetBlockName( id )
	if id == 0 then
		return "Empty"
	elseif id == 1 then
		return "Grass Flat Block"
	end
end

function BlockGridRef( bx,by,bsz )
	local bXGrid = bx * bsz
	local bYGrid = by * bsz
	return bXGrid, bYGrid
end

function CheckEmptyBlock( ex,ey,bs )
	local empt = true 
	for i=1, #worldBlocks do
		if worldBlocks[i].x * bs == ex and worldBlocks[i].y * bs == ey then
			empt = false
			break   
		end
	end
return empt 
end

function RemoveBlock( rmx,rmy )
	for i,v in ipairs(worldBlocks) do
		if v["x"] == rmx and v["y"] == rmy then
			table.remove(worldBlocks, i)
		end 
	end 
end






