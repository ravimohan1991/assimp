-- premake5.lua
project "assimp"
	kind "StaticLib"
	language "C++"
	staticruntime "on"

	targetdir ("build/" .. outputdir .. "/%{prj.name}")
	objdir ("obj/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/assimp/color4.inl",
		"include/assimp/material.inl",
		"include/assimp/matrix3x3.inl",
		"include/assimp/matrix4x4.inl",
		"include/assimp/quaternion.inl",
		"include/assimp/vector2.inl",
		"include/assimp/vector3.inl",
		"code/Common/Assimp.cpp",
		"code/Common/res/assimp.rc",
		"code/Common/DefaultLogger.cpp",
		"code/Common/Compression.cpp",
		"code/Common/BaseImporter.cpp",
		"code/Common/BaseProcess.cpp",
		"code/Common/PostStepRegistry.cpp",
		"code/Common/ImporterRegistry.cpp",
		"code/Common/DefaultIOStream.cpp",
		"code/Common/IOSystem.cpp",
		"code/Common/DefaultIOSystem.cpp",
		"code/Common/ZipArchiveIOSystem.cpp",
		"code/Common/Importer.cpp",
		"code/Common/SGSpatialSort.cpp",
		"code/Common/VertexTriangleAdjacency.cpp",
		"code/Common/SpatialSort.cpp",
		"code/Common/SceneCombiner.cpp",
		"code/Common/ScenePreprocessor.cpp",
		"code/Common/SkeletonMeshBuilder.cpp",
		"code/Common/StandardShapes.cpp",
		"code/Common/TargetAnimation.cpp",
		"code/Common/RemoveComments.cpp",
		"code/Common/Subdivision.cpp",
		"code/Common/scene.cpp",
		"code/Common/Bitmap.cpp",
		"code/Common/Version.cpp",
		"code/Common/CreateAnimMesh.cpp",
		"code/Common/simd.cpp",
		"code/Common/material.cpp",
		"code/Common/AssertHandler.cpp",
		"code/Common/Exceptional.cpp",
		"code/Common/Base64.cpp",
		"code/CApi/CInterfaceIOWrapper.cpp",
		"code/CApi/CInterfaceIOWrapper.h",
		"code/AssetLib/Obj/*.cpp",
		"code/AssetLib/FBX/*.cpp",
		"code/Material/MaterialSystem.cpp",
		"contrib/openddlparser/code/*.cpp",
		"code/PostProcessing/*.cpp",
		"contrib/zlib/*.c"
	}

	includedirs
	{
		"include",
		"code",
		"contrib/stub",
		"contrib/unzip",
		"contrib",
		"contrib/pugixml/src",
		"contrib/zlib",
		"contrib/openddlparser/include",
		"contrib/rapidjson/include",
		"../assimp"
	}
	
	-- Look into ImporterRegistry.cpp for exhaustive list of should-be defines
	defines
	{
		"RAPIDJSON_HAS_STDSTRING=1",
		"ASSIMP_BUILD_NO_IFC_IMPORTER",
		"_CRT_SECURE_NO_WARNINGS",
		"OPENDDL_STATIC_LIBARY",
		"ASSIMP_BUILD_NO_C4D_IMPORTER",
		"ASSIMP_BUILD_NO_SMD_IMPORTER",
		"ASSIMP_BUILD_NO_MMD_IMPORTER",
		"ASSIMP_BUILD_NO_X_IMPORTER",
		"ASSIMP_BUILD_NO_AMF_IMPORTER",
		"ASSIMP_BUILD_NO_3DS_IMPORTER",
		"ASSIMP_BUILD_NO_M3D_IMPORTER",
		"ASSIMP_BUILD_NO_MD3_IMPORTER",
		"ASSIMP_BUILD_NO_MD2_IMPORTER",
		"ASSIMP_BUILD_NO_PLY_IMPORTER",
		"ASSIMP_BUILD_NO_MDL_IMPORTER",
		"ASSIMP_BUILD_NO_ASE_IMPORTER",
		"ASSIMP_BUILD_NO_3DS_IMPORTER",
		"ASSIMP_BUILD_NO_3DS_IMPORTER",
		"ASSIMP_BUILD_NO_HMP_IMPORTER",
		"ASSIMP_BUILD_NO_MDC_IMPORTER",
		"ASSIMP_BUILD_NO_MD5_IMPORTER",
		"ASSIMP_BUILD_NO_STL_IMPORTER",
		"ASSIMP_BUILD_NO_LWO_IMPORTER",
		"ASSIMP_BUILD_NO_DXF_IMPORTER",
		"ASSIMP_BUILD_NO_NFF_IMPORTER",
		"ASSIMP_BUILD_NO_RAW_IMPORTER",
		"ASSIMP_BUILD_NO_SIB_IMPORTER",
		"ASSIMP_BUILD_NO_OFF_IMPORTER",
		"ASSIMP_BUILD_NO_AC_IMPORTER",
		"ASSIMP_BUILD_NO_BVH_IMPORTER",
		"ASSIMP_BUILD_NO_IRRMESH_IMPORTER",
		"ASSIMP_BUILD_NO_IRR_IMPORTER",
		"ASSIMP_BUILD_NO_Q3D_IMPORTER",
		"ASSIMP_BUILD_NO_B3D_IMPORTER",
		"ASSIMP_BUILD_NO_COLLADA_IMPORTER",
		"ASSIMP_BUILD_NO_TERRAGEN_IMPORTER",
		"ASSIMP_BUILD_NO_CSM_IMPORTER",
		"ASSIMP_BUILD_NO_3D_IMPORTER",
		"ASSIMP_BUILD_NO_LWS_IMPORTER",
		"ASSIMP_BUILD_NO_OGRE_IMPORTER",
		"ASSIMP_BUILD_NO_OPENGEX_IMPORTER",
		"ASSIMP_BUILD_NO_MS3D_IMPORTER",
		"ASSIMP_BUILD_NO_COB_IMPORTER",
		"ASSIMP_BUILD_NO_BLEND_IMPORTER",
		"ASSIMP_BUILD_NO_Q3BSP_IMPORTER",
		"ASSIMP_BUILD_NO_NDO_IMPORTER",
		"ASSIMP_BUILD_NO_XGL_IMPORTER",
		"ASSIMP_BUILD_NO_ASSBIN_IMPORTER",
		"ASSIMP_BUILD_NO_GLTF_IMPORTER",
		"ASSIMP_BUILD_NO_3MF_IMPORTER",
		"ASSIMP_BUILD_NO_X3D_IMPORTER",
		"ASSIMP_BUILD_NO_IQM_IMPORTER"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

		files
		{
		}

	filter "system:linux"
		-- https://github.com/premake/premake-core/wiki/pic
		pic "On"
		buildoptions "-std=c++11"
		systemversion "latest"

		files
		{
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
