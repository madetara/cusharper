#ifndef CUDA_CUDA_WRAPPER_H
#define CUDA_CUDA_WRAPPER_H

#include <cstdlib>
#include <cstdio>

#include <cusolverSp.h>

#if defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__)
#define DLLEXPORT __declspec(dllexport)
#else
#define DLLEXPORT
#endif

// TODO rewrite into something more meaningful for error handling
#define CUSOLVER_CHECK(expr)                                                           \
    do {                                                                               \
        cusolverStatus_t err = (expr);                                                 \
        if (err != CUSOLVER_STATUS_SUCCESS) {                                          \
            fprintf(stderr, "CUSOLVER Error: %d at %s:%d\n", err, __FILE__, __LINE__); \
            exit(err);                                                                 \
        }                                                                              \
    } while (0)


// Creates and destroys CUDA handler. Performs a simple check if CUDA is available in your system
extern "C" DLLEXPORT void check_cusolver_sp();

#endif //CUDA_CUDA_WRAPPER_H
