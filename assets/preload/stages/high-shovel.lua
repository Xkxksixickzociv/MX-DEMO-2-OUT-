local allowCountdown = false
local finish = 0

function onCreate()
	setProperty('dadGroup.visible',false)
	setProperty('camHUD.alpha',0)
	makeAnimatedLuaSprite('crack','highshovel/crack',getCharacterX('dad') - 100,getCharacterY('dad'))
	scaleObject('crack',2.5,2.5)
	addAnimationByIndices('crack', 'stop', 'crack idle', 1, 30)
	addAnimationByPrefix('crack', 'shesh', 'crack idle', 30, false)
	addLuaSprite('crack',true)
	objectPlayAnimation('crack', 'stop', true)
	runTimer('crack',1)

	makeLuaSprite('sky','highshovel/sky',-900,-500)
	setScrollFactor('sky',1.2,1.2)
	addLuaSprite('sky')

	makeLuaSprite('gil','highshovel/hills',-600,-250)
	setScrollFactor('gil',1.1,1.1)
	addLuaSprite('gil')

	makeLuaSprite('floor','highshovel/the grass you should touch',-1500,400)
	addLuaSprite('floor')

	setProperty('gfGroup.visible',false)
end

function onSongStart()
	setPropertyFromClass('Conductor', 'songPosition',6478)
	setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
	setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
	doTweenAlpha('appear','camHUD',100,4,'circInOut')
end

function onStartCountdown()
	if not allowCountdown then
		return Function_Stop
	end

	if allowCountdown then
		return Function_Continue
	end
end


function onTimerCompleted(tag)
	if tag == 'crack' then
		playSound('crack', 1, 'crack')
		objectPlayAnimation('crack', 'shesh', true)
		runTimer('go',2)
	elseif tag == 'go' then
		setProperty('skipCountdown',true)
		allowCountdown = true
		startCountdown()
		allowCountdown = true
		finish = 1
		setProperty('crack.visible',false)
		setProperty('dadGroup.visible',true)
		
		setPropertyFromGroup('strumLineNotes',0,'x', 9000) -- i know i can just make them invisible but uhhh im lazy enough
		setPropertyFromGroup('strumLineNotes',1,'x', 9000)
		setPropertyFromGroup('strumLineNotes',2,'x', 9000)
		setPropertyFromGroup('strumLineNotes',3,'x', 9000)

		setPropertyFromGroup('strumLineNotes',4,'x',412)
		setPropertyFromGroup('strumLineNotes',5,'x',524)
		setPropertyFromGroup('strumLineNotes',6,'x',636)
		setPropertyFromGroup('strumLineNotes',7,'x',748)
	end
end