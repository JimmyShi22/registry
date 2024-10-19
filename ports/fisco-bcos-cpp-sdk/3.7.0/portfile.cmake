vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO ywy2090/FISCO-BCOS
        REF 9ae7422ded0c3f8ba766c92ac42df38dbfafe336
        SHA512 72cb3ce1e9e011849463afe3ebe7bad927bfa32263c5e552dc0e9bb11012d6e27d227b50d3df4765fb64e19058bcbf7891040e8b276d3cb30647450a370c8594
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