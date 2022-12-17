local mov = 0

function onCreate()
	-- triggered when the lua file is started
	setProperty('songSpeed', 2.5)
	setProperty('timeTxt.visible',false)
	doTweenAlpha("start", "boyfriend", 1, 1, "quartInOut")
	addCharacterToList('mario', 'dad');
	addCharacterToList('normal-mario', 'dad');
	addCharacterToList('mario-win', 'dad');
end

local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		setProperty('camGame.visible',false)
		setProperty('camHUD.visible',false)
		runTimer('lowEnd',1,1)
		allowCountdown = true;
		return Function_Stop;
	end
	setProperty('camGame.visible',true)
	setProperty('camHUD.visible',true)
	return Function_Continue;
end


local allowEnd = false
function onEndSong()
	if not allowEnd and isStoryMode and not seenCutscene then --Block the first countdown
		setProperty('camGame.visible',false)
		setProperty('camHUD.visible',false)
		runTimer('lowEndB',1,1)

		allowEnd = true;
		return Function_Stop;
	end
	setProperty('camGame.visible',true)
	setProperty('camHUD.visible',true)

	return Function_Continue;
end

function onBeatHit()
	if curBeat == 96 then
		runTimer("marioDies", 5)
		doTweenAlpha("picoscene", "boyfriend", 0, 1,"quartInOut")
		doTweenAlpha("hudscene", "camHUD", 0, 1, "quartInOut")
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'marioDies' then
		doTweenAlpha("hudend", "camHUD", 1, 1, "quartInOut")
		doTweenAlpha("picoend", "boyfriend", 1, 1, "quartInOut")
		isMarioDead = 1
		mov = 1
	elseif tag == 'lowEnd' then
		startVideo('cut1');
	elseif tag == 'lowEndB' then
		startVideo('cut2');
	end
end

function onUpdatePost()
	setProperty('timeBar.angle', math.random(-30,30))
	angle = math.random(-20,20)
	local currBeat = (getSongPosition()/1000) * (bpm/60)
	if mov == 1 then
		if not lowQuality then
			if inGameOver == false then
				if not downscroll then
					for i=0,7 do
						setPropertyFromGroup('strumLineNotes',i,'y', 45 + (math.sin(currBeat + (0.5*i)) * 15))
						setPropertyFromGroup('strumLineNotes',i,'angle', math.sin(currBeat + (0.5*i)) * 5)
					end
				elseif downscroll then
					for i=0,7 do
						setPropertyFromGroup('strumLineNotes',i,'y', 560 + (math.sin(currBeat + (0.5*i)) * 15))
						setPropertyFromGroup('strumLineNotes',i,'angle', math.sin(currBeat + (0.5*i)) * 5)
					end
				end
			end
		end
	else
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

function onCreatePost()
	addLuaScript('gameover_screens/jumpman')
end