local timeclock = 35
local clock = 0

function onCreate()
	precacheImage('clock')
end

function onBeatHit()
	if curBeat == 644 then -- 644
		clock = 1
		if not downscroll then
			makeLuaSprite('clocky','clock',0,950)
			scaleObject('clocky', 7, 7)
			setObjectCamera('clocky', 'hud')
			setProperty('clocky.antialiasing',false)
			makeLuaText('timeclock', timeclock, 0, 135, 985)
			setTextSize('timeclock', 80)
			setTextFont('timeclock', 'nes.otf')
			addLuaSprite('clocky')
			addLuaText('timeclock')
			doTweenY('balls1', 'clocky', 550 - 75, 1, 'circInOut')
			doTweenY('balls2', 'timeclock', 585 - 75, 1, 'circInOut')
			runtimeclockr('shesh',1)
		elseif downscroll then
			makeLuaSprite('clocky','clock',0,-250)
			scaleObject('clocky', 7, 7)
			setProperty('clocky.antialiasing',false)
			setObjectCamera('clocky', 'hud')
			makeLuaText('timeclock', timeclock, 0, 135, -285)
			setTextSize('timeclock', 80)
			setTextFont('timeclock', 'nes.otf')
			addLuaSprite('clocky')
			addLuaText('timeclock')
			doTweenY('balls1', 'clocky', 35, 1, 'circInOut')
			doTweenY('balls2', 'timeclock', 65, 1, 'circInOut')
		end
	end
end

function onUpdate()
	setTextString('timeclock',timeclock)

	if timeclock == 0 then
		setProperty('health',0)
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if clock == 1 then
		if not isSustainNote then
			setProperty('clocky.color','FF0000')
			setProperty('timeclock.color','FF0000')
			timeclock = timeclock + 1
			doTweenColor('wov', 'clocky', 'FFFFFF', 0.1, linear)
			doTweenColor('wov2', 'timeclock', 'FFFFFF', 0.1, linear)
		end
	end
end

function onStepHit()
	if curStep == 3134 then
		clock = 0
		doTweenY('balls1', 'clocky', -200, 1, 'circInOut')
		doTweenY('balls2', 'timeclock', 135 - 300, 1, 'circInOut')
	end

	if clock == 1 then
		if curStep % 3 == 0 then
			timeclock = timeclock - 1
		end
	end
end