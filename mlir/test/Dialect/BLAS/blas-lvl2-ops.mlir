// RUN: mlir-opt %s | mlir-opt | FileCheck %s

// CHECK-LABEL: func.func @blas_lvl2_test(
// CHECK-SAME: [[varg0:%.*]]: f32, [[varg1:%.*]]: f32, [[varg1:%.*]]: memref<100x100xf32>, [[varg2:%.*]]: memref<100xf32>, [[varg3:%.*]]: memref<100xf32>) {
func.func @blas_lvl2_test(%alpha : f32, %beta : f32, %A : memref<100x100xf32>, %x : memref<100xf32>, %y : memref<100xf32>) -> () {
    blas.gemv(%alpha, %A, %x, %beta, %y)
    blas.gemv(%alpha, %A, %x, %beta, %y) {trans = #blas.transpose<BLAS_TRANS>}
    blas.gemv(%alpha, %A, %x, %beta, %y) {trans = #blas.transpose<BLAS_NO_TRANS>}

    blas.symv(%alpha, %A, %x, %beta, %y) {uplo = #blas.uplo<BLAS_UPPER>}
    blas.symv(%alpha, %A, %x, %beta, %y) {uplo = #blas.uplo<BLAS_LOWER>}

    // TODO test on complex
    // blas.hemv(%alpha, %A, %x, %beta, %y) {uplo = #blas.uplo<BLAS_UPPER>}
    // blas.hemv(%alpha, %A, %x, %beta, %y) {uplo = #blas.uplo<BLAS_LOWER>}

    // TODO test more cases
    blas.trmv(%alpha, %A, %x) {uplo = #blas.uplo<BLAS_UPPER>, trans = #blas.transpose<BLAS_TRANS>, diag = #blas.diag<BLAS_NON_UNIT>}

    // TODO test more cases
    blas.trsv(%alpha, %A, %x) {uplo = #blas.uplo<BLAS_UPPER>, trans = #blas.transpose<BLAS_TRANS>, diag = #blas.diag<BLAS_NON_UNIT>}

    blas.ger(%alpha, %x, %y, %A)

    // TODO test on complex
    // blas.geru(%alpha, %x, %y, %A)
    // blas.gerc(%alpha, %x, %y, %A)

    blas.syr(%alpha, %x, %A) {uplo = #blas.uplo<BLAS_UPPER>}
    blas.syr(%alpha, %x, %A) {uplo = #blas.uplo<BLAS_LOWER>}

    // TODO test on complex
    // blas.her(%alpha, %x, %A) {uplo = #blas.uplo<BLAS_UPPER>}
    // blas.her(%alpha, %x, %A) {uplo = #blas.uplo<BLAS_LOWER>}

    blas.syr2(%alpha, %x, %y, %A) {uplo = #blas.uplo<BLAS_UPPER>}
    blas.syr2(%alpha, %x, %y, %A) {uplo = #blas.uplo<BLAS_LOWER>}

    // TODO test on complex
    // blas.her2(%alpha, %x, %y, %A) {uplo = #blas.uplo<BLAS_UPPER>}
    // blas.her2(%alpha, %x, %y, %A) {uplo = #blas.uplo<BLAS_LOWER>}

    func.return
}
