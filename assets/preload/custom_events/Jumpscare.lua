function onCreate()
	precacheImage('jumpscares/jumpscare')
	precacheSound('jumpscare')
	precacheImage('jumpscares/jumpscare2')
	precacheSound('jumpscare2')
	precacheImage('jumpscares/jumpscare3')
	precacheSound('jumpscare3')
end

function onEvent(n, v1, v2)
	if n == "Jumpscare" then
		if v1 == "1" then
			makeLuaSprite('boo1', 'jumpscares/jumpscare1', 0, 0);
			scaleObject('boo1', 0.8, 0.8);
			addLuaSprite('boo1', true); -- this way of fun is entertaining
			playSound('jumpscare1',1)
			makeLuaText('loretext1', 'This is not my game.', 2000, -350, 300)
			setTextColor('loretext1', '0xFFFF0000')
			setTextSize('loretext1', 85)
			setTextFont('loretext1', 'nes.otf')
			addLuaText('loretext1',true)
			makeLuaText('loretext2', 'How did you make it?', 2000, -390, 400)
			setTextColor('loretext2', '0xFFA10000')
			setTextSize('loretext2', 55)
			setTextFont('loretext2', 'nes.otf')
			addLuaText('loretext2',true)
			setObjectCamera('boo1', 'other');
			setObjectCamera('loretext1', 'other');
			setObjectCamera('loretext2', 'other');
			setObjectOrder('boo1', 1);
			setObjectOrder('loretext2', 2);
			setObjectOrder('loretext1', 3);
			runTimer('perate qliao', 0.75);
		elseif v1 == "2" then
			makeLuaSprite('boo2', 'jumpscares/jumpscare2', -90, 0); --this is not my game. how did you make it?
			scaleObject('boo2', 0.685, 0.685);
			addLuaSprite('boo2', true); -- this way of fun is entertaining
			playSound('jumpscare2',1)
			makeLuaText('loretext3', 'This way of fun is', 2000, -350, 300)
			setTextColor('loretext3', '0xFFFF0000')
			setTextSize('loretext3', 85)
			setTextFont('loretext3', 'nes.otf')
			addLuaText('loretext3',true)
			makeLuaText('loretext4', 'entertaining.', 2000, -390, 400)
			setTextColor('loretext4', '0xFFA10000')
			setTextSize('loretext4', 55)
			setTextFont('loretext4', 'nes.otf')
			addLuaText('loretext4',true)
			setObjectCamera('boo2', 'other');
			setObjectCamera('loretext3', 'other');
			setObjectCamera('loretext4', 'other');
			setObjectOrder('boo2', 1);
			setObjectOrder('loretext4', 2);
			setObjectOrder('loretext3', 3);
			runTimer('perate qliao2', 0.75);
		elseif v1 == "3" then
			makeLuaSprite('boo3', 'jumpscares/jumpscare3', -90, -30); --this is not my game. how did you make it?
			scaleObject('boo3', 0.7, 0.7);
			addLuaSprite('boo3', true); -- this way of fun is entertaining
			playSound('jumpscare3',1)
			makeLuaText('loretext5', 'THANK YOU', 2000, -350, 300)
			setTextColor('loretext5', '0xFFFF0000')
			setTextSize('loretext5', 100)
			setTextFont('loretext5', 'nes.otf')
			addLuaText('loretext5',true)
			setObjectCamera('boo3', 'other');
			setObjectCamera('loretext5', 'other');
			setObjectOrder('boo3', 1);
			setObjectOrder('loretext5', 5);
			runTimer('perate qliao3', 0.75);
		end
	end
end

function onUpdate()
	if v1 == "1" then
		setProperty('boo1.x',getProperty('boo1.x')-math.random(-20,20))
		setProperty('boo1.y',getProperty('boo1.y')-math.random(-20,20))
		runTimer('back', 0.01);
	elseif v1 == "2" then
		setProperty('boo2.x',getProperty('boo2.x')-math.random(-20,20))
		setProperty('boo2.y',getProperty('boo2.y')-math.random(-20,20))
		runTimer('back2', 0.01);
	elseif v1 == "3" then
		setProperty('boo3.x',getProperty('boo3.x')-math.random(-20,20))
		setProperty('boo3.y',getProperty('boo3.y')-math.random(-20,20))
		runTimer('back3', 0.01);
	end
end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'perate qliao' then
		removeLuaSprite('boo1', false);
		doTweenAlpha('chauchis', 'loretext1', 0, 0.2, 'linear');
		doTweenAlpha('chauchis2', 'loretext2', 0, 0.4, 'linear');
	elseif tag == 'perate qliao2' then
		removeLuaSprite('boo2', false);
		doTweenAlpha('chauchis3', 'loretext3', 0, 0.2, 'linear');
		doTweenAlpha('chauchis4', 'loretext4', 0, 0.4, 'linear');
	elseif tag == 'perate qliao3' then
		removeLuaSprite('boo3', false);
		doTweenAlpha('chauchis5', 'loretext5', 0, 0.2, 'linear');
	elseif tag == 'back' then
		setProperty('boo1.x',0)
		setProperty('boo1.y',0)
	elseif tag == 'back2' then
		setProperty('boo2.x',0)
		setProperty('boo2.y',0)
	elseif tag == 'back3' then
		setProperty('boo3.x',0)
		setProperty('boo3.y',0)
	end
end

function onTweenCompleted(tag)
	if tag == 'chauchis' then
		removeLuaText('loretext1', false);
	elseif tag == 'chauchis2' then
		removeLuaText('loretext2', false)
	elseif tag == 'chauchis3' then
		removeLuaText('loretext3', false);
	elseif tag == 'chauchis4' then
		removeLuaText('loretext4', false)
	elseif tag == 'chauchis5' then
		removeLuaText('loretext5', false)
	end
end