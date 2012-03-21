local tArgs = { ... }
if #tArgs < 1 then
	print( "Usage: go <direction> <distance>" )
	return
end

local function left(nArg)
	turtle.turnLeft()
	turtle.forward(nArg)
	turtle.turnRight()
end

local function right(nArg)
	turtle.turnRight()
	turtle.forward()
	turtle.turnLeft()
end

local tHandlers = {
	["fd"] = turtle.forward,
	["forward"] = turtle.forward,
	["forwards"] = turtle.forward,
	["bk"] = turtle.back,
	["back"] = turtle.back,
	["up"] = turtle.up,
	["dn"] = turtle.down,
	["down"] = turtle.down,
	["lt"] = left,
	["left"] = left,
	["rt"] = right,
	["right"] = right,
	["tlt"] = turtle.turnLeft,
	["turnleft"] = turtle.turnLeft,
	["trt"] = turtle.turnRight,
	["turnright"] = turtle.turnRight,
}

local nArg = 1
while nArg <= #tArgs do
	local sDirection = tArgs[nArg]
	local nDistance = 1
	if nArg < #tArgs then
		local num = tonumber( tArgs[nArg + 1] )
		if num then
			nDistance = num
			nArg = nArg + 1
		end
	end
	nArg = nArg + 1

	local fnHandler = tHandlers[string.lower(sDirection)]
	if fnHandler then
		for n=1,nDistance do
			fnHandler( nArg )
		end
	else
		print( "No such direction: "..sDirection )
		print( "Try: forward, back, up, down" )
		return
	end

end