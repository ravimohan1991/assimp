#[[
    Abstractions and Models are NOT at WAR!
                                            - Cobwoy's Talisman
    But Abstractions don't care and Models can't understand!!
                                            - Lul, Practicality
 ]]

# CAUTION: HIGHLY GENERIC CMAKE BUILD. ALERT ALWAYS!

# Adding multiple source files

# Common code files
file(GLOB COMMONC Common/*.cpp)
file(GLOB PPROCESSC PostProcessing/*.cpp)
list(APPEND LOOSECOMMONC CApi/CInterfaceIOWrapper.cpp
    CApi/AssimpCExport.cpp Material/MaterialSystem.cpp
    ../contrib/unzip/unzip.c ../contrib/unzip/ioapi.c Geometry/GeometryUtils.cpp)

#source_group(ASSIMPBASECODE FILES ${COMMONC} ${PPROCESSC} ${LOOSECOMMONC})
		
# Adding the supported file format code category (.OBJ and .FBX for now)
file(GLOB OBJFFC AssetLib/Obj/*.cpp)
file(GLOB FBXFFC AssetLib/FBX/*.cpp)

#source_group(ASSIMPFFORMATCODE FILES ${OBJFF} ${FBXFF})

# Check the relevance of openddl parser!!!
#file(GLOB OPENDDLC ../contrib/openddlparser/code/*.cpp)
file(GLOB ZLIBC ../contrib/zlib/*.c)

#source_group(ASSIMP3RDPARTYCODE FILES ${OPENDDL} ${ZLIB})

# Shows the headerfile directory in project
# Code headerfiles
file(GLOB COMMONH Common/*.h)
file(GLOB PPROCESSH PostProcessing/*.h)

# Rest of the crap
file(GLOB CAPIH CApi/*.h)

# Supported file format category header category
file(GLOB OBJFFH AssetLib/Obj/*.h)
file(GLOB FBXH AssetLib/FBX/*.h)

# Inclusion of 3rd party codebase
#file(GLOB OPENDDLH ../contrib/openddlparser/include/openddlparser/*.h)
file(GLOB ZLIBH ../contrib/zlib/*.h)

# Loose header file
list(APPEND LOOSECOMMONH CApi/CInterfaceIOWrapper.h Material/MaterialSystem.h
    ../contrib/unzip/unzip.h ../contrib/unzip/ioapi.h ../contrib/unzip/crypt.h Geometry/GeometryUtils.h)

# Suppressing deprications like so
# Not a big fan, but let me see how the things evolve
# C:\Users\the_cowboy\Misc\KarmaEngine\Karma\vendor\assimp\code\PostProcessing\EmbedTexturesProcess.cpp(157,7):
# warning C4996: 'strncpy': This function or variable may be unsafe. Consider using strncpy_s instead. 
# To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.
if(MSVC)
	add_compile_definitions(_CRT_SECURE_NO_WARNINGS _CRT_NONSTDC_NO_DEPRECATE)
endif()

#source_group(HEADERFILESCODE FILES ${COMMONH} ${CApi} ${ASSETSH} ${3RDCONTRIB}
#    CApi/CInterfaceIOWrapper.h Material/MaterialSystem.h)

# Building the project (STATIC or DYNAMIC (SHARED))
if (BUILD_SHARED_LIBS)
    add_library(AssImp SHARED ${COMMONC} ${PPROCESSC} ${LOOSECOMMONC}
        ${OBJFFC} ${FBXFFC} ${OPENDDLC} ${ZLIBC}
        ${COMMONH} ${ASSETSH} ${OBJFFH} ${FBXH}
        ${OPENDDLH} ${ZLIBH} ${LOOSECOMMONH} ${PPROCESSH}
    )
else()
    add_library(AssImp STATIC ${COMMONC} ${PPROCESSC} ${LOOSECOMMONC}
        ${OBJFFC} ${FBXFFC} ${OPENDDLC} ${ZLIBC}
        ${COMMONH} ${ASSETSH} ${OBJFFH} ${FBXH}
        ${OPENDDLH} ${ZLIBH} ${LOOSECOMMONH} ${PPROCESSH}
    )
endif()

#[[
 *                                          /\
 *                                         / /
 *                                      /\| |
 *                                      | | |/\
 *                                      | | / /
 *                                      | `  /
 *                                      `\  (___
 *                                     _.->  ,-.-.
 *                                  _.'      |  \ \
 *                                 /    _____| 0 |0\
 *                                |    /`    `^-.\.-'`-._
 *                                |   |                  `-._
 *                                |   :                      `.
 *                                \    `._     `-.__         O.'
 *         _.--,                   \     `._     __.^--._O_..-'
 *        `---, `.                  `\     /` ` `
 *             `\ `,                  `\   |
 *              |   :                   ;  |
 *              /    `.              ___|__|___
 *             /       `.           (          )
 *            /    `---.:____...---' `--------`.
 *           /        (         `.      __      `.
 *          |          `---------' _   /  \       \
 *          |    .-.      _._     (_)  `--'        \
 *          |   (   )    /   \                       \
 *           \   `-'     \   /                       ;-._
 *            \           `-'           \           .'   `.
 *            /`.                  `\    `\     _.-'`-.    `.___
 *           |   `-._                `\    `\.-'       `-.   ,--`
 *            \      `--.___        ___`\    \           ||^\\
 *             `._        | ``----''     `.   `\         `'  `
 *                `--;     \  jgs          `.   `.
 *                   //^||^\\               //^||^\\
 *                   '  `'  `               '   '  `
 ]]
