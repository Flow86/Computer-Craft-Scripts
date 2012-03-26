local tArgs = { ... }
if #tArgs < 1 then
	print( "Usage: go <direction> <distance>" )
	return
end

local function left()
	if advturtle then
		advturtle.left()
	else
		turtle.turnLeft()
		turtle.forward()
		turtle.turnRight()
	end
end

local function right()
	if advturtle then
		advturtle.right()
	else
		turtle.turnRight()
		turtle.forward()
		turtle.turnLeft()
	end
end

local tHandlers = {
	["f"] = turtle.forward,
	["fd"] = turtle.forward,
	["forward"] = turtle.forward,
	["forwards"] = turtle.forward,
	["b"] = turtle.back,
	["bk"] = turtle.back,
	["back"] = turtle.back,
	["u"] = turtle.up,
	["up"] = turtle.up,
	["d"] = turtle.down,
	["dn"] = turtle.down,
	["down"] = turtle.down,
	["l"] = left,
	["lt"] = left,
	["left"] = left,
	["r"] = right,
	["rt"] = right,
	["right"] = right,
	["tl"] = turtle.turnLeft,
	["tlt"] = turtle.turnLeft,
	["turnleft"] = turtle.turnLeft,
	["tr"] = turtle.turnRight,
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
			fnHandler()
		end
	else
		print( "No such direction: "..sDirection )
		print( "Try: forward, back, up, down, left, right, turnleft, turnright" )
		return
	end

end