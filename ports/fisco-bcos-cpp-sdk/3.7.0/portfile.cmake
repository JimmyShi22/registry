vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO ywy2090/FISCO-BCOS
        REF 9ae7422ded0c3f8ba766c92ac42df38dbfafe336
        SHA512 5c56b29c71223f1332500444b459c1cad9ee2e31417bcc96fa1e0d2fac781a94b51684774cd683b3ae775ee208dd68b9403bb84a07c74d00f8c141514c4ab234
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