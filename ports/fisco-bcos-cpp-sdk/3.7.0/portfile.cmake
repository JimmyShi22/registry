vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO ywy2090/FISCO-BCOS
        REF fb2382ff3f33b2b1bf3782658dc257fcfc86c0f4
        SHA512 b3361181bd8016718f4f663cfed9f92db269d73807364494ecce2d40a7d673477caaf95492d3137a0345c98b573079a3c3b0b5cf4aa6e6dfd1da7dd67f22241a
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