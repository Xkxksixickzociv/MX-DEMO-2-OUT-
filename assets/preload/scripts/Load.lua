local camlock = 0

function onCreatePost()
	if camlock == 0 then
		addLuaScript('coolscripts/smoothCam')
		addLuaScript('coolscripts/perlinCam')
	end
	
	addLuaScript('coolscripts/coolUIshit')
	addLuaScript('coolscripts/missShit')
	addLuaScript('coolscripts/coolZoom')
end