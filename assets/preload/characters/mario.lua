function opponentNoteHit(id, direction, noteType, isSustainNote)
	health = getProperty('health')
	if dadName == 'mario' then
		if getProperty('health') > 0.02 then
			setProperty('health', health- 0.015);
		end
	end
end

function onCreatePost()
	makeAnimatedLuaSprite('mxicon','icons/icon-mx',0,0)
	addAnimationByPrefix('mxicon', 'n', 'n', 24, true)
	addAnimationByPrefix('mxicon', 'w', 'w', 24, true)
	addAnimationByPrefix('mxicon', 'l', 'l', 24, true)
	setObjectCamera('mxicon','hud')
	addLuaSprite('mxicon',true)
end

function onUpdate(elapsed)
	setProperty('mxicon.alpha',getProperty('iconP2.alpha'))

	if getProperty('mxicon.animation.curAnim.name') == 'n' then
		setProperty('iconP2.visible',false)
		setProperty('mxicon.x', getProperty('iconP2.x') + 35)
		setProperty('mxicon.angle', getProperty('iconP2.angle'))
		setProperty('mxicon.y', getProperty('iconP2.y') + 35)
		setProperty('mxicon.scale.x', getProperty('iconP2.scale.x') + 0.3)
		setProperty('mxicon.scale.y', getProperty('iconP2.scale.y') + 0.3)
	elseif getProperty('mxicon.animation.curAnim.name') == 'l' then
		setProperty('iconP2.visible',false)
		setProperty('mxicon.x', getProperty('iconP2.x') + 20)
		setProperty('mxicon.angle', getProperty('iconP2.angle'))
		setProperty('mxicon.y', getProperty('iconP2.y') + 15)
		setProperty('mxicon.scale.x', getProperty('iconP2.scale.x') + 0.4)
		setProperty('mxicon.scale.y', getProperty('iconP2.scale.y') + 0.4)
	elseif getProperty('mxicon.animation.curAnim.name') == 'w' then
		setProperty('iconP2.visible',false)
		setProperty('mxicon.x', getProperty('iconP2.x') + 20)
		setProperty('mxicon.angle', getProperty('iconP2.angle'))
		setProperty('mxicon.y', getProperty('iconP2.y') + 10)
		setProperty('mxicon.scale.x', getProperty('iconP2.scale.x') + 0.3)
		setProperty('mxicon.scale.y', getProperty('iconP2.scale.y') + 0.3)
	end

	if getProperty('healthBar.percent') > -1 and getProperty('healthBar.percent') <= 20 then
		objectPlayAnimation('mxicon','w',false)
	elseif getProperty('healthBar.percent') > 80 and getProperty('healthBar.percent') <= 100 then
		objectPlayAnimation('mxicon','l',false)
	else
		objectPlayAnimation('mxicon','n',false)
	end
end