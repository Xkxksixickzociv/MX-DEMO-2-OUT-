local shadname = "wavy"

function onCreatePost()
    initLuaShader(shadname)
	initLuaShader('radialBlur')
    
    makeLuaSprite("grapshad")
    makeGraphic("grapshad", screenWidth, screenHeight)
	makeLuaSprite("shadertest")
    makeGraphic("shadertest", screenWidth, screenHeight)
	
    setSpriteShader("grapshad", shadname)

    addHaxeLibrary("ShaderFilter", "openfl.filters")

     runHaxeCode([[
        trace(ShaderFilter);
      game.camGame.setFilters([new ShaderFilter(game.getLuaObject("grapshad").shader)]);
      game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("grapshad").shader)]);
    ]])
	
	setSpriteShader('shadertest','radialBlur')

	setShaderFloat('shadertest','cx',0.5) --center x
	setShaderFloat('shadertest','cy',0.5) --center y
	setShaderFloat('shadertest','blurWidth',0.1)-- blur amount
	runHaxeCode([[
        
       game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shadertest").shader)]);
    ]])
end

function onUpdate(elapsed) ---SET VALUE HERE
 setShaderFloat("grapshad", "frequency",8); 
  setShaderFloat("grapshad", "amplitude", 0.05);
end
function onUpdatePost(elapsed)
    setShaderFloat("grapshad", "iTime", os.clock())
end