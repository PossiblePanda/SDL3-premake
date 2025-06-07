local outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "SDL3"
	kind "StaticLib"
	language "C++"
    staticruntime "off"

	-- You may want to configure this for your own project structure
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-obj/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h";
		"src/**.c";
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"