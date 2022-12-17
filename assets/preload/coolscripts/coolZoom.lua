local stop = 0
local lock = 0

function onUpdate(elapsed)
	if lock == 0 then
	if mustHitSection == false then
		if dadName == 'smokes-x' then
			if stop == 0 then
				setProperty('defaultCamZoom',1)
			end
		elseif dadName == 'normal-mario' then
			setProperty('defaultCamZoom',1)
		elseif dadName == 'mario' then
			setProperty('defaultCamZoom',0.6)
		elseif dadName == 'mario-win' then
			setProperty('defaultCamZoom',0.6)
		end
	else
		if boyfriendName == 'mx-high' then
			if stop == 0 then
				setProperty('defaultCamZoom',0.8)
			end
		elseif boyfriendName == 'pico-player' then
			setProperty('defaultCamZoom',0.8)
		elseif boyfriendName == 'bf' then
			setProperty('defaultCamZoom',0.8)
		elseif songName == 'Tutorial' then
			setProperty('defaultCamZoom',0.2)
		end
	end
	end
	
	if stop == 1 then
		setProperty('defaultCamZoom',0.6)
	end

	if songName == 'Mario que te cojo en el armario' then
		lock = 1
	end
end

function onBeatHit()
	if songName == 'High-Shovel' then
		if curBeat == 287 then
			stop = 1
		elseif curBeat == 320 then
			stop = 0
		end
	end
end