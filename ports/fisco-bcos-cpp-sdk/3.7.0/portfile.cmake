vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO ywy2090/FISCO-BCOS
        REF 6b51af485c3ea19402f2e76a6c90b15d187ba528
        SHA512 d04b26865a122426272fbde949adf22ddede880628e5ddd308ee2737aea70ed3dcc0bd629351dbbf02740632e983f62b3afa73778e9057207f9052017ce2a835
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