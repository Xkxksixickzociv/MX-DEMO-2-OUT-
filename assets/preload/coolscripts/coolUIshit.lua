local accuracy = '?'

function onCreate()
	setProperty('scoreTxt.visible',false)
	setProperty('timeTxt.visible',false)
	setProperty('timeBar.visible',false)
	setProperty('timeBarBG.visible',false)

	makeLuaText('name', 'idk', 0, 50, 30)
	setTextSize('name', 64)
	setTextFont('name', 'nes.otf')
	addLuaText('name')

	makeLuaText('score', '000000', 0, 50, 90)
	setTextSize('score', 64)
	setTextFont('score', 'nes.otf')
	addLuaText('score')

	makeLuaText('timename', 'time', 0, 1050, 30)
	setTextSize('timename', 64)
	setTextFont('timename', 'nes.otf')
	addLuaText('timename')

	makeLuaText('time', 0, 0, 1050, 90)
	setTextSize('time', 64)
	setTextFont('time', 'nes.otf')
	addLuaText('time')

	makeLuaSprite('rating', 'hud/rating', 975, 625)
	setObjectCamera('rating','hud')
	setProperty('rating.antialiasing',false)
	addLuaSprite('rating')

	makeLuaText('accuracy', ": ?", 0, 1050, 625)
	setTextSize('accuracy', 48)
	setTextFont('accuracy', 'nes.otf')
	addLuaText('accuracy')

	makeLuaSprite('miss', 'hud/miss', 975, 525)
	setObjectCamera('miss','hud')
	setProperty('miss.antialiasing',false)
	addLuaSprite('miss')

	makeLuaText('misses', ":0", 0, 1050, 525)
	setTextSize('misses', 48)
	setTextFont('misses', 'nes.otf')
	addLuaText('misses')

	setProperty('healthBar.x',100)
end

function onCreatePost()
	setPropertyFromGroup('strumLineNotes',0,'x', 9000) -- i know i can just make them invisible but uhhh im lazy enough
	setPropertyFromGroup('strumLineNotes',1,'x', 9000)
	setPropertyFromGroup('strumLineNotes',2,'x', 9000)
	setPropertyFromGroup('strumLineNotes',3,'x', 9000)

	setPropertyFromGroup('strumLineNotes',4,'x',412)
	setPropertyFromGroup('strumLineNotes',5,'x',524)
	setPropertyFromGroup('strumLineNotes',6,'x',636)
	setPropertyFromGroup('strumLineNotes',7,'x',748)
end

function onRecalculateRating()
	setTextString('score', score)

	if score > 99999 then
		setProperty("score.text", score)
	elseif score > 9999 then
		setProperty("score.text", '0' .. score)
	elseif score > 999 then
		setProperty("score.text", '00' .. score)
	elseif score > 99 then
		setProperty("score.text", '000' .. score)
	elseif score > 9 then
		setProperty("score.text", '0000' .. score)
	else
		setProperty("score.text",'000000')
	end
end

function onUpdatePost()
	if boyfriendName == 'pico-player' then
		setTextString('name', 'PICO')
	elseif boyfriendName == 'bf' or boyfriendName == 'somari-bf' then
		setTextString('name', 'BF')
	elseif boyfriendName == 'bf-beatbox' then
		setTextString('name', 'FOREGROUND')
	elseif boyfriendName == 'mx-high' then
		setTextString('name', 'MX')
	elseif boyfriendName == 'tgt-mario' then
		setTextString('name', 'MARIO')
	end

	if (getPropertyFromClass("Conductor", "songPosition") / 1000) < 0 then
		setTextString('time',"?")
	else
		setTextString('time',math.floor((songLength / 1000) - (getPropertyFromClass("Conductor", "songPosition") / 1000)))
	end

	setTextString('misses',":" .. misses)
	setTextString('accuracy', ':' .. math.floor(getProperty('ratingPercent') * 100) .. "%")
end