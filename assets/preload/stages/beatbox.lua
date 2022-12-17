function onCreate()
	makeLuaSprite("beatbox bg",lmao,-500,-100)
	makeGraphic('beatbox bg', 5000, 5000, '1F1A2A')
	addLuaSprite("beatbox bg",false)

    	setProperty('gfGroup.visible', false)
end

local vals = 0.05

function onUpdate(elapsed)
    setShaderFloat("grapshad", "Pixelly", vals);
end

local shadname = "pixel"
local shadname2 = "dither"

function onCreatePost()
    
    makeLuaSprite("grapshad")
    makeGraphic("grapshad", screenWidth, screenHeight)
        setSpriteShader("grapshad", shadname)

        addHaxeLibrary("ShaderFilter", "openfl.filters")

        runHaxeCode([[
        trace(ShaderFilter);
      game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("grapshad").shader)]);
    ]])

    makeLuaSprite("grapshad2")
    makeGraphic("grapshad2", screenWidth, screenHeight)
    setSpriteShader("grapshad2", shadname2)
    addHaxeLibrary("ShaderFilter", "openfl.filters")
    runHaxeCode([[
		var game = PlayState.instance;
		game.camGame.setFilters([new ShaderFilter(game.getLuaObject("grapshad2").shader)]);
    ]])  
end