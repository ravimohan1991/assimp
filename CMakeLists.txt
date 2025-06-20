# Set the project name and version
project(Assimp VERSION 1.0)

# Defines
add_compile_definitions(ASSIMP_BUILD_NO_X_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_AMF_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_3DS_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_MD3_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_MDL_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_MD2_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_PLY_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_ASE_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_HMP_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_SMD_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_MDC_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_MD5_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_STL_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_LWO_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_DXF_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_NFF_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_RAW_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_SIB_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_OFF_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_AC_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_BVH_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_IRRMESH_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_IRR_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_Q3D_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_B3D_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_COLLADA_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_TERRAGEN_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_CSM_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_LWS_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_OGRE_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_OPENGEX_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_MS3D_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_COB_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_BLEND_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_Q3BSP_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_NDO_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_IFC_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_XGL_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_ASSBIN_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_GLTF_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_C4D_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_3MF_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_X3D_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_MMD_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_M3D_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_IQM_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_3D_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_USD_IMPORTER)
add_compile_definitions(ASSIMP_BUILD_NO_EXPORT)
add_compile_definitions(ASSIMP_BUILD_NO_TRIANGULATE_PROCESS)


# Then compile the library under work
add_subdirectory(code)

# INTERFACE (Something that Consumers require but Producers don't)
# Since I am a library coder here, I am the Producer
# Rest of the Engine is Consumer here

target_include_directories(AssImp
    PRIVATE
        # where the library itself will look for its internal headers
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        ${CMAKE_CURRENT_SOURCE_DIR}/contrib/openddlparser/include
        ${CMAKE_CURRENT_SOURCE_DIR}/code
        ${CMAKE_CURRENT_SOURCE_DIR}/contrib/
        ${CMAKE_CURRENT_SOURCE_DIR}/contrib/unzip
		${CMAKE_CURRENT_SOURCE_DIR}/contrib/zlib
    PUBLIC
        # where top-level project will look for the library's public headers
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/contrib>
        # where external projects will look for the library's public headers
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/include>
)

target_compile_definitions(AssImp PUBLIC AssImp)
