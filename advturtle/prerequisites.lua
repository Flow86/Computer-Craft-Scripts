if not advturtle or not turtle then
	error( "Cannot find advanced turtle API on this computer" )
end

function checkPrerequisites( ... )
	print("Checking prerequisites:")
	
	success = {}

	for k,v in ipairs( arg ) do
		write("  "..v..": ")
		if advturtle.selectBlock(v) then
			print("found")
			success[v] = true
		else 
			print("not found")
			success[v] = false
			break
		end
	end

	print("")
	return success
end

--checkPrerequisites("Cobblestone", "Rail")
