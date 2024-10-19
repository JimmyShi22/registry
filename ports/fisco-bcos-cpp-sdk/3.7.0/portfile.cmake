vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO JimmyShi22/FISCO-BCOS
        REF ff7b44a4d820086de77dd4095006554b288dee66
        SHA512 82f2ff3a65947958825c6f69b6ea16ff08d4716c420f658ec189ca4e6089c1de4efa14a5abd315d714bd8125448ed13d99213838fb4eccb9c8b2e86db348943e
        HEAD_REF v3.7.0
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
        -DALLOCATOR=default
        -DTESTS=OFF
        -DWITH_TIKV=OFF
        -DWITH_TARS_SERVICES=OFF
        -DWITH_LIGHTNODE=OFF
        -DWITH_CPPSDK=ON
        -DBUILD_STATIC=OFF
        -DTOOLS=OFF
        -DFULLNODE=OFF
        -DWITH_WASM=OFF
)

vcpkg_cmake_build()
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"  RENAME copyright)