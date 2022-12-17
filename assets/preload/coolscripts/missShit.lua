local anims = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
local use = 0

function noteMissPress(direction)
	if not ghostTapping then
		if use == 0 then
			characterPlayAnim('boyfriend', anims[direction + 1], true)
			setProperty('boyfriend.color', getColorFromHex('B013D4'));
		end
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if use == 0 then
		characterPlayAnim('boyfriend', anims[direction + 1], true)
		setProperty('boyfriend.color', getColorFromHex('B013D4'));
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if use == 0 then
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
	end
end

function onUpdate()
	if use == 0 then
		if getProperty('boyfriend.animation.curAnim.name') == 'idle' or getProperty('boyfriend.animation.curAnim.name') == 'danceLeft' or getProperty	('boyfriend.animation.curAnim.name') == 'danceRight' then
			setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		end
	end
end

function onUpdatePost()
	if getProperty('boyfriend.curCharacter') == 'bf-beatbox' then
		use = 1
	elseif getProperty('boyfriend.curCharacter') == 'mx-high' then
		use = 1
	elseif songName == 'Madness' then
		use = 1
	end
end