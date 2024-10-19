vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO JimmyShi22/FISCO-BCOS
        REF acdec61fe73b5235406aafc0e52cf3a744c153ec
        SHA512 507e9f87bf6f60a5c59d83d09f3fb4231b306d9fdda93e6b45b18899d6c7ac42f26158104a0e69702a297296bfaa531746f184fb6bbd0f41670f75c1f3072a6c
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