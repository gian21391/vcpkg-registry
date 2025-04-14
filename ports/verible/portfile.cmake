vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO gian21391/verible
  REF 2926f32e2f0f39bffd86d45001a6d451111ee17c
  SHA512 2ad2033dab9db56207cb861e941625b539c01fe9aaf97f305721197a1295b5762cba60974d8ad1bdebf12869d7d70294f393ba5966c2eec0fa0a7809e3ec11a2
  HEAD_REF cmake_build
)

vcpkg_find_acquire_program(BISON)
vcpkg_find_acquire_program(FLEX)
get_filename_component(BISON_EXE_PATH "${BISON}" DIRECTORY)
vcpkg_add_to_path("${BISON_EXE_PATH}")

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS
    -DVERIBLE_TEST=OFF
    -DVERIBLE_COMMIT_TIMESTAMP=1744620867
    -DVERIBLE_GIT_DESCRIBE="v0.0-3958-g7aae5c08-13-g15a49668"
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/common/tools" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/diff" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/formatter" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/kythe/testdata/include_file_test" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/kythe/testdata/include_with_dir_test/include_dir" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/kythe/testdata/multi_file_test" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/lint/testdata" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/ls/vscode/images" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/ls/vscode/src" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/obfuscator" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/preprocessor" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/project" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/syntax/export_json_examples")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/verilog/tools/kythe/testdata/include_with_dir_test" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/lint" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/ls/vscode" "${CURRENT_PACKAGES_DIR}/include/verilog/tools/syntax")
file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
