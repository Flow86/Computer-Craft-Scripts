local pos = { 0, 0, 0, 1 }
local maxRetries = 8
local debug = false

local function printPos()
	print('pos: '..pos[1]..", "..pos[2]..", "..pos[3].." facing: "..pos[4])
end

local function retry(cmd)
	local retry = 0;
	while not cmd() do
		sleep(0.2)
		if retry > maxRetries then return false end
		retry = retry + 1
	end
	return true
end

function getPosAndFacing()
	return pos
end

function getX()
	return pos[1]
end

function getY()
	return pos[2]
end

function getZ()
	return pos[3]
end

function getFacing()
	return pos[4]
end

function resetPos()
	pos = { 0, 0, 0, 1 }
	--[[if advturtle then
		-- f  0  1  2  3  4  5
		-- x             -1  1
		-- y -1  1            
		-- z       -1  1      
		pos[4] = advturtle.facing()-1
	end]]--
end

function moveToY()
	if pos[2] == 0 then
		return true
	end

	while pos[2] ~= 0 do
		if pos[2] < 0 then
			if not up() then return false end
		else
			if not down() then return false end
		end
	end
	return true	
end

function up()
	if not retry(turtle.up) then return false end
	pos[2] = pos[2] + 1
	
	if debug then printPos() end
	return true
end

function down()
	if not retry(turtle.down) then return false end
	pos[2] = pos[2] - 1
	
	if debug then printPos() end
	return true
end

function forward()
	if not retry(turtle.forward) then return false end
	if pos[4] == 1 then
		pos[1] = pos[1] + 1
	elseif pos[4] == 3 then
		pos[1] = pos[1] - 1
	end

	if pos[4] == 2 then
		pos[3] = pos[3] + 1
	elseif pos[4] == 4 then
		pos[3] = pos[3] - 1
	end

	if debug then printPos() end
	return true
end

function back()
	if not retry(turtle.back) then return false end
	if pos[4] == 1 then
		pos[1] = pos[1] - 1
	elseif pos[4] == 3 then
		pos[1] = pos[1] + 1
	end

	if pos[4] == 2 then
		pos[3] = pos[3] - 1
	elseif pos[4] == 4 then
		pos[3] = pos[3] + 1
	end
	
	if debug then printPos() end
	return true
end

function left()
	turtle.turnLeft()
	pos[4] = ((pos[4] - 1) % 4)
	if pos[4] == 0 then pos[4] = 4 end
	
	if debug then printPos() end
end

function right()
	turtle.turnRight()
	pos[4] = ((pos[4] + 1) % 4)
	if pos[4] == 0 then pos[4] = 4 end

	if debug then printPos() end
end

function turnaround()
	right()
	right()
end

resetPos()
