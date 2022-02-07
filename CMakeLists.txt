project(nrf5_crypto)

# find sources and headers
RECURSIVE_FIND_DIR(INCLUDE_DIRS "${CMAKE_CURRENT_SOURCE_DIR}" "*.h")
RECURSIVE_FIND_FILE(SOURCE_FILES "${CMAKE_CURRENT_SOURCE_DIR}" "*.c")


# add them
include_directories(${INCLUDE_DIRS})

# create our target
add_library(nrf5_crypto ${SOURCE_FILES})

target_link_libraries(
    nrf5_crypto
    ${LIB_OBJECT_FILES}
    ${LIB_ARCHIVE_FILES}
)

# expose it to parent cmake.
target_include_directories(nrf5_crypto PUBLIC ${INCLUDE_DIRS})
