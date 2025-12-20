// RUN: mlir-opt %s | mlir-opt | FileCheck %s

// CHECK-LABEL: func.func @blas_lvl3_real_test(
func.func @blas_lvl3_real_test(%alpha : f32, %x : memref<100xf32>, %y : memref<100xf32>) -> () {
    blas.gemm(%alpha, %a, %b, %beta, %c)
    blas.gemm(%alpha, %a, %b, %beta, %c) {transA = #blas.transpose<BLAS_NO_TRANS>}
    blas.gemm(%alpha, %a, %b, %beta, %c) {transB = #blas.transpose<BLAS_NO_TRANS>}
    blas.gemm(%alpha, %a, %b, %beta, %c) {transA = #blas.transpose<BLAS_NO_TRANS>, transB = #blas.transpose<BLAS_NO_TRANS>}
    blas.gemm(%alpha, %a, %b, %beta, %c) {transA = #blas.transpose<BLAS_NO_TRANS>, transB = #blas.transpose<BLAS_TRANS>}
    blas.gemm(%alpha, %a, %b, %beta, %c) {transA = #blas.transpose<BLAS_TRANS>, transB = #blas.transpose<BLAS_NO_TRANS>}
    blas.gemm(%alpha, %a, %b, %beta, %c) {transA = #blas.transpose<BLAS_TRANS>, transB = #blas.transpose<BLAS_TRANS>}

    blas.gemmtr(%alpha, %a, %b, %beta, %c) {uplo = #blas.uplo<BLAS_UPPER>}
    blas.gemmtr(%alpha, %a, %b, %beta, %c) {uplo = #blas.uplo<BLAS_LOWER>}
    blas.gemmtr(%alpha, %a, %b, %beta, %c) {uplo = #blas.uplo<BLAS_UPPER>, transA = #blas.transpose<BLAS_NO_TRANS>}
    blas.gemmtr(%alpha, %a, %b, %beta, %c) {uplo = #blas.uplo<BLAS_UPPER>, transB = #blas.transpose<BLAS_NO_TRANS>}
    blas.gemmtr(%alpha, %a, %b, %beta, %c) {uplo = #blas.uplo<BLAS_UPPER>, transA = #blas.transpose<BLAS_NO_TRANS>, transB = #blas.transpose<BLAS_NO_TRANS>}
    blas.gemmtr(%alpha, %a, %b, %beta, %c) {uplo = #blas.uplo<BLAS_UPPER>, transA = #blas.transpose<BLAS_NO_TRANS>, transB = #blas.transpose<BLAS_TRANS>}
    blas.gemmtr(%alpha, %a, %b, %beta, %c) {uplo = #blas.uplo<BLAS_UPPER>, transA = #blas.transpose<BLAS_TRANS>, transB = #blas.transpose<BLAS_NO_TRANS>}
    blas.gemmtr(%alpha, %a, %b, %beta, %c) {uplo = #blas.uplo<BLAS_UPPER>, transA = #blas.transpose<BLAS_TRANS>, transB = #blas.transpose<BLAS_TRANS>}

}
