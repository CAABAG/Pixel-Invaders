workspace "Pixel-Invaders"
	architecture "x86"
	configurations { "Debug", "Release"	}
	output_dir = "%{cfg.system}_%{cfg.buildcfg}_%{cfg.architecture}"
	location "../../"
	
project "Pixel-Invaders"
	language "C++"
	location "../../Pixel-Invaders/"
	
	targetdir("../../Pixel-Invaders/" ..output_dir.. "/")
	objdir("../../Pixel-Invaders/" ..output_dir.. "/data/obj/")
	
	files {
		"../../src/*.cpp",
		"../../src/*.h"
	}
	
	includedirs {"../SFML/include"}
	
	libdirs {"../SFML/lib"}
	
	links {"opengl32.lib", "freetype.lib", "winmm.lib", "gdi32.lib", "flac.lib", "vorbisenc.lib",
	"vorbisfile.lib", "ogg.lib", "ws2_32.lib"}
	
	filter "system:windows"
		systemversion "latest"
	
		defines {"SFML_STATIC"}
	
	filter "configurations:Debug"
		kind "ConsoleApp"
		runtime "Debug"
		symbols "On"
		
		links {"sfml-graphics-s-d.lib", "sfml-window-s-d.lib", "sfml-system-s-d.lib"}
	
	filter "configurations:Release"
		kind "WindowedApp"
		entrypoint "mainCRTStartup"
		runtime "Release"
		optimize "On"
		
		links {"sfml-graphics-s.lib", "sfml-window-s.lib", "sfml-system-s.lib"}