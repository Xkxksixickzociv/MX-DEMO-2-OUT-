local MX = 0
local red = 0
local hide = 0

function onCreate()
	if songName == 'Jumpman' then
		precacheImage('characters/dead')
		setPropertyFromClass('GameOverSubstate', 'gameover', 'gameOver');
	
		if lowQuality then
			red = -999
		end
	end

	makeLuaSprite("fakefloor","jumpman/floorfake",-600,-125)
	setLuaSpriteScrollFactor("fakefloor",1,1)

	makeLuaSprite("floor","jumpman/floor",-600,-125)
	setLuaSpriteScrollFactor("floor",1,1)

	if not lowQuality then
		makeLuaSprite("sky","jumpman/sky",-1250,-500)
		scaleObject("sky",3,3)
		setLuaSpriteScrollFactor("sky",0.4,0.4)

		makeAnimatedLuaSprite("cloud","jumpman/cloud",2000,math.random(-300,300))
		addAnimationByPrefix("cloud","cloudlaugh","nobe",24,true)
		addLuaSprite("cloud",false)
		scaleObject('cloud', math.random(0.6,0.8))
		setLuaSpriteScrollFactor("cloud",math.random(0.4,0.8),math.random(0.5,0.8))
		objectPlayAnimation("cloud","cloudlaugh",true)

		makeAnimatedLuaSprite("mountain","jumpman/spoopy",-200,250)
		setLuaSpriteScrollFactor("mountain",0.9,0.9)
		addAnimationByPrefix("mountain","o","spoopy",24,true)
	end

	addLuaSprite("sky",false)
	addLuaSprite("mountain",false)
	addLuaSprite("floor",false)
	addLuaSprite("fakefloor",false)
	addLuaSprite("cloud",false)

	setProperty('fakefloor.visible',true)
	setProperty('floor.visible',false)
	setProperty('sky.visible',false)
end

function onUpdate()	
	setProperty('cloud.x',getProperty('cloud.x')-3)

	if getProperty('cloud.x') == -900 then
		removeLuaSprite('cloud', false)
		makeAnimatedLuaSprite("cloud","cloud",2000,math.random(-300,300))
		addAnimationByPrefix("cloud","cloudlaugh","nobe",24,true)
		addLuaSprite("cloud",false)
		setLuaSpriteScrollFactor("cloud",0.7,0.7)
		setObjectOrder('sky', 1);
		setObjectOrder('cloud', 2);
		setObjectOrder('floor', 3);
	end

	if songName == 'Jumpman' then
		if red == 1 then
			setProperty('sky.color', getColorFromHex('FF0000'));
			red = 2
			runTimer('nvm go back',0.5)
		end
	end
end


function onBeatHit()
	if songName == 'Jumpman' then
		if curBeat == 96 then
			runTimer("bgmarioDies", 5)
			doTweenAlpha("skyscene", "sky", 0, 1,"quartInOut")
			doTweenAlpha("floorscene", "floor", 0, 1, "quartInOut")
			doTweenAlpha("cloudscene", "cloud", 0, 1, "quartInOut")
			doTweenAlpha("spoopyscene", "mountain", 0, 1, "quartInOut")
		end
	end

	if songName == 'Jumpman' then
		if curBeat == 644 then
			red = 1
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'bgmarioDies' then
		doTweenAlpha("skyend", "sky", 1, 1, "quartInOut")
		doTweenAlpha("floorend", "floor", 1, 1, "quartInOut")
		doTweenAlpha("spoopyend", "mountain", 1, 1, "quartInOut")
		doTweenAlpha("cloudend", "cloud", 1, 1, "quartInOut")

		setProperty('fakefloor.visible',false)
		setProperty('floor.visible',true)
		setProperty('sky.visible',true)

		setProperty('songSpeed', 2.85)
		cameraFlash('game', '000000',1,true)
		MX = 1
	elseif tag == 'nvm go back' then
		setProperty('sky.color', getColorFromHex('FFFFFF'));
		runTimer('oh nvm',0.5)
	elseif tag == 'oh nvm' then
		setProperty('sky.color', getColorFromHex('FF0000'));
		runTimer('nvm go back',0.5)
	end
end