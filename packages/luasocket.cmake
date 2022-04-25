set(EXPORT
    "PLAT=mingw
    LUAINC_mingw=${MINGW_INSTALL_PREFIX}/include/luajit-2.1
    LUALIB_mingw=${MINGW_INSTALL_PREFIX}/lib/libluajit-5.1.a
    LUAPREFIX_mingw=${MINGW_INSTALL_PREFIX}
    CC_mingw=${TARGET_ARCH}-gcc
    LD_mingw=${TARGET_ARCH}-gcc"
)

ExternalProject_Add(luasocket
    DEPENDS
        luajit
    GIT_REPOSITORY https://github.com/lunarmodules/luasocket.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${MAKE}
        ${EXPORT}
        all
    INSTALL_COMMAND ${MAKE}
        ${EXPORT}
        install
    BUILD_IN_SOURCE 1
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(luasocket)
cleanup(luasocket install)
