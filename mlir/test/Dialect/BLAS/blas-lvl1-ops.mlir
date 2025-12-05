// RUN: mlir-opt %s | mlir-opt | FileCheck %s

// CHECK-LABEL: func.func @blas_lvl1_test(
// CHECK-SAME: [[varg0:%.*]]: f32, [[varg1:%.*]]: memref<100xf32>, [[varg2:%.*]]: memref<100xf32>) {
func.func @blas_lvl1_test(%alpha : f32, %x : memref<100xf32>, %y : memref<100xf32>) -> () {
    blas.axpy(%alpha, %x, %y)
    
    blas.scal(%alpha, %x)

    blas.copy(%x, %y)

    blas.swap(%x, %y)

    %a = blas.dot(%x, %y) : f32

    // TODO dotu, dotc

    %b = blas.nrm2(%x) : f32

    %c = blas.asum(%x) : f32

    %d = blas.iamax(%x) : index<i32>

    // TODO rotg, rot, rotmg, rotm

    func.return
}
