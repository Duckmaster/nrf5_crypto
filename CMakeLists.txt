project(nrf5_crypto)

# find sources and headers
RECURSIVE_FIND_DIR(INCLUDE_DIRS "${CMAKE_CURRENT_SOURCE_DIR}" "*.h")
RECURSIVE_FIND_FILE(SOURCE_FILES "${CMAKE_CURRENT_SOURCE_DIR}" "*.c")

list (APPEND INCLUDE_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/external/mbedtls/include/")

RECURSIVE_FIND_FILE (SOURCE_FILES_MBEDTLS "${CMAKE_CURRENT_SOURCE_DIR}/external/mbedtls/library"  "*.c")

list(APPEND INCLUDE_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/../codal-nrf52/nrfx/drivers/include")
list(APPEND SOURCE_FILES "${CMAKE_CURRENT_SOURCE_DIR}/../codal-nrf52/nrfx/drivers/src/nrfx_rng.c")

list (APPEND SOURCE_FILES "${SOURCE_FILES_MBEDTLS}")

set(CMAKE_LINKER_FLAGS "${CMAKE_LINKER_FLAGS} -T\"${CMAKE_CURRENT_LIST_DIR}/ld/nrf52833.ld\"" PARENT_SCOPE)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T\"${CMAKE_CURRENT_LIST_DIR}/ld/nrf52833.ld\"" PARENT_SCOPE)
 
# add them
include_directories(${INCLUDE_DIRS})

# create our target
add_library(nrf5_crypto ${SOURCE_FILES})

target_link_libraries(
    nrf5_crypto
    codal-microbit-nrf5sdk
    codal-nrf52
)

# expose it to parent cmake.
target_include_directories(nrf5_crypto PUBLIC ${INCLUDE_DIRS})
