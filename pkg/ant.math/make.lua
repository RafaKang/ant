local lm = require "luamake"

local ROOT <const> = "../../"

local sources = {
    ROOT .. "3rd/math3d/mathid.c",
    ROOT .. "3rd/math3d/math3d.c",
    ROOT .. "3rd/math3d/math3dfunc.cpp",
    ROOT .. "3rd/math3d/mathadapter.c",
}

local defines = {
    "_USE_MATH_DEFINES",
    "GLM_FORCE_QUAT_DATA_XYZW",
}

if lm.mode == "debug" then
    sources[#sources+1] = ROOT .. "3rd/math3d/testadapter.c"
    defines[#defines+1] = "MATH3D_ADAPTER_TEST"
end

lm:lua_source "math" {
    includes = {
        ROOT .. "3rd/glm",
        ROOT .. "3rd/math3d",
    },
    sources = sources,
    defines = defines,
}
