local collected = 0
local sleeptimer = 0.5

function getCollected()
	return collected
end

function space()
	local space = 0
	for n=1,9 do
		space = space + turtle.getItemSpace(n)
	end
	
	return space, 9*64
end

local function collect()
	collected = collected + 1
	if math.fmod(collected, 25) == 0 then
		print( "Mined "..collected.." blocks." )
	end
end

function tryDig()
	if space() < 64 then
		return false
	end
	
	while turtle.dig() do
		collect()
		sleep(sleeptimer)
		if not turtle.detect() then
			return true
		end
	end
	return not turtle.detect()
end

function tryDigUp()
	if space() < 64 then
		return false
	end

	while turtle.digUp() do
		collect()
		sleep(sleeptimer)
		if not turtle.detectUp() then
			return true
		end
	end
	return not turtle.detectUp()
end

function tryDigDown()
	if space() < 64 then
		return false
	end

	while turtle.digDown() do
		collect()
		sleep(sleeptimer)
		if not turtle.detectDown() then
			return true
		end
	end
	return not turtle.detectDown()
end


--[[
function findAndSelect(item)
	for X=1,9 do
		if turtle.getItemCount(X) > 0 then
			Freeslots = Freeslots - 1
        end
    end
]]