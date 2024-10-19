vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO JimmyShi22/FISCO-BCOS
        REF 29b07373984e2841b1d4dc0b1bd525456f5f9a9d
        SHA512 eb40a3e874fdb6e5366f9a2b18907d7bd448400afe6c4c88046ebbb18fe08d9dc61a972c8681ff2997d468c29173cd5cca1b629db61d78fc1ff5d3b57db0996c
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