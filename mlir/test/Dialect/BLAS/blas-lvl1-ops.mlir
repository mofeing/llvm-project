// RUN: mlir-opt %s | mlir-opt | FileCheck %s

// CHECK-LABEL: func.func @blas_lvl1_real_test(
// CHECK-SAME: [[varg0:%.*]]: f32, [[varg1:%.*]]: memref<100xf32>, [[varg2:%.*]]: memref<100xf32>) {
func.func @blas_lvl1_real_test(%alpha : f32, %x : memref<100xf32>, %y : memref<100xf32>) -> () {
    blas.axpy(%alpha, %x, %y)
    blas.scal(%alpha, %x)
    blas.copy(%x, %y)
    blas.swap(%x, %y)

    %a = blas.dot(%x, %y) : f32

    %b = blas.nrm2(%x) : f32
    %c = blas.asum(%x) : f32
    %d = blas.iamax(%x) : index

    func.return
}

// CHECK-LABEL: func.func @blas_lvl1_complex_test(
// CHECK-SAME: [[varg0:%.*]]: complex<f32>, [[varg1:%.*]]: memref<100xcomplex<f32>>, [[varg2:%.*]]: memref<100xcomplex<f32>>) {>
func.func @blas_lvl1_complex_test(%alpha : complex<f32>, %x : memref<100xcomplex<f32>>, %y : memref<100xcomplex<f32>>) -> () {>
    blas.axpy(%alpha, %x, %y)
    blas.scal(%alpha, %x)
    blas.copy(%x, %y)
    blas.swap(%x, %y)

    %a = blas.dotu(%x, %y) : complex<f32>
    %b = blas.dotc(%x, %y) : complex<f32>

    %c = blas.nrm2(%x) : complex<f32>
    %d = blas.asum(%x) : complex<f32>
    %e = blas.iamax(%x) : index

    // TODO rotg, rot, rotmg, rotm

    func.return
}
