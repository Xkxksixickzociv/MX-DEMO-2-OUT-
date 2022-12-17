function onCreate()
	makeLuaSprite("cool","it would be so awesome",0,0)
	screenCenter('cool','xy')
	setObjectCamera('cool','hud')
	addLuaSprite('cool')
	setProperty('boyfriendGroup.visible',false)
	setProperty('dadGroup.visible',false)
	setProperty('cool.alpha',0)
end

function onEvent(n,v1,v2)
	if n == 'Kill Henchmen' then
		doTweenAlpha('br','cool',1,1,'linear')
	end
end