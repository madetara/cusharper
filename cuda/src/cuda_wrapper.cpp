#include "cuda_wrapper.h"

DLLEXPORT void check_cusolver_sp() {
    cusolverSpHandle_t handle;
    CUSOLVER_CHECK(cusolverSpCreate(&handle));
    CUSOLVER_CHECK(cusolverSpDestroy(handle));
}
