vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO ywy2090/FISCO-BCOS
        REF 84cbd2058676f23625d95c9fda6d4de307644c23
        SHA512 ea5aad9ff8a8b09570b8f104577be31942c44f03267155718e20cc4245399f8b90001c3c358e61cfc3fe69e2b0b32e2f8d4cab7a945a7ce81a0b78386cea4f77
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