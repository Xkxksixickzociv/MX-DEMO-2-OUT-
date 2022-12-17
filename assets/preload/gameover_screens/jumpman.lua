local gameovershit = 0

function onCreate()
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'loss'); -- sound to play when the death screen is triggered
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'loss'); -- song that will play during the death screen
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'retry'); --sound to play when you press the confirm button to retry
end

function onUpdate()
	if gameovershit == 1 then
		makeLuaSprite('black','idk',0,0)
		makeGraphic('black', 3000, 3000, '000000')
		setObjectCamera('black', 'other')
		makeAnimatedLuaSprite('dead','characters/dead',200,-100)
		addAnimationByPrefix('dead','1','1',24,false)
		addAnimationByPrefix('dead','2','2',24,false)
		setObjectCamera('dead', 'other')
		scaleObject('dead', 0.9, 0.9)
		addLuaSprite('black',true)
		addLuaSprite('dead',true)
		gameovershit = 2
	elseif gameovershit == 2 then
		if keyJustPressed('accept') then
			gameovershit = 3
			setProperty('dead.x',-300)
			setProperty('dead.y',-350)
			objectPlayAnimation('dead','2',false)
			doTweenAlpha('chau','dead',0,2,linear)
		end
	end
end

function onGameOver()
	gameovershit = 1
	return Function_Continue;
end