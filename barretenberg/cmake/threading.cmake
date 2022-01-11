if(APPLE)
    if(CMAKE_C_COMPILER_ID MATCHES "Clang")
        set(OpenMP_C_FLAGS "-fopenmp")
        set(OpenMP_C_FLAGS_WORK "-fopenmp")
        set(OpenMP_C_LIB_NAMES "libomp")
        set(OpenMP_C_LIB_NAMES_WORK "libomp")
        if (${CMAKE_SYSTEM_PROCESSOR} MATCHES "arm64")
            set(OpenMP_libomp_LIBRARY "/opt/homebrew/lib/libomp.a")
        else()
            set(OpenMP_libomp_LIBRARY "/usr/local/lib/libomp.a")
        endif()
    endif()
    if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        set(OpenMP_CXX_FLAGS "-fopenmp")
        set(OpenMP_CXX_FLAGS_WORK "-fopenmp")
        set(OpenMP_CXX_LIB_NAMES "libomp")
        set(OpenMP_CXX_LIB_NAMES_WORK "libomp")
        if (${CMAKE_SYSTEM_PROCESSOR} MATCHES "arm64")
            set(OpenMP_libomp_LIBRARY "/opt/homebrew/lib/libomp.a")
        else()
            set(OpenMP_libomp_LIBRARY "/usr/local/lib/libomp.a")
        endif()
    endif()
endif()

if(MULTITHREADING)
    find_package(OpenMP REQUIRED)
    message(STATUS "Multithreading is enabled.")
    link_libraries(OpenMP::OpenMP_CXX)
else()
    message(STATUS "Multithreading is disabled.")
    add_definitions(-DNO_MULTITHREADING -DBOOST_SP_NO_ATOMIC_ACCESS)
endif()
