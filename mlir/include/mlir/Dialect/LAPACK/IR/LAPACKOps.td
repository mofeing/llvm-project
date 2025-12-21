//===- LAPACKops.td - Basic Linear Algebra Subroutines Ops ---*- tablegen
//-*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LAPACK_MLIR_IR_LAPACKOPS_TD
#define LAPACK_MLIR_IR_LAPACKOPS_TD

include "mlir/Dialect/LAPACK/IR/LAPACK.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

class LAPACK_Op<string mnemonic, list<Trait> traits = []>
    : Op<LAPACK_Dialect, mnemonic, traits>;

// TODO Driver routines

// TODO Driver routines - Standard Eigenvalue and Singular Value Problems
// TODO use jobz, uplo attributes? i32/i64 for ret type? matrix_layout attr?

def LAPACK_GesvOp : LAPACK_Op<"gesv", []> {
  let summary = "Solve a system of linear equations A * X = B by factorizing A";
  let description = [{}];

  let arguments = (ins AnyMemRef:$A, AnyMemRef:$B);

  let results = (outs i64:$info);
}

// ...

def LAPACK_GelsOp : LAPACK_Op<"gels", []> {
  let summary = "Solve a linear least squares (LLS) systems using QR or LQ "
                "factorization";
  let description = [{}];

  let arguments = (ins);

  let results = (outs i64:$info);
}

def LAPACK_GelsyOp : LAPACK_Op<"gelsy", []> {
  let summary = "Solve a linear least squares (LLS) systems using complete "
                "orthogonal factorization";
  let description = [{}];

  let arguments = (ins);

  let results = (outs i64:$info);
}

def LAPACK_GelssOp : LAPACK_Op<"gelss", []> {
  let summary = "Solve a linear least squares (LLS) systems using singular "
                "value decomposition (SVD)";
  let description = [{}];

  let arguments = (ins);

  let results = (outs i64:$info);
}

// ...

def LAPACK_SyevOp : LAPACK_Op<"syev", []> {
  let summary = "Compute all eigenvalues and, optionally, eigenvectors of a "
                "real symmetric matrix";
  let description = [{
    This operation computes all eigenvalues and, optionally, eigenvectors of a
    real symmetric matrix A. The operation overwrites the input matrix A with
    the orthonormal eigenvectors if requested.
  }];

  let arguments = (ins AnyMemRef:$A, AnyMemRef:$W, i8:$jobz, i8:$uplo);

  let results = (outs i64:$info);
}

def LAPACK_HeevOp : LAPACK_Op<"heev", []> {
  let summary = "Compute all eigenvalues and, optionally, eigenvectors of a "
                "complex Hermitian matrix";
  let description = [{
    This operation computes all eigenvalues and, optionally, eigenvectors of a
    complex Hermitian matrix A. The operation overwrites the input matrix A with
    the orthonormal eigenvectors if requested.
  }];

  let arguments = (ins AnyMemRef:$A, AnyMemRef:$W, i8:$jobz, i8:$uplo);

  let results = (outs i64:$info);
}

def LAPACK_GeesOp : LAPACK_Op<"gees", []> {
  let summary = "Compute all or part of the Schur factorization of A, with "
                "optional ordering of the eigenvalues";
  let description = [{}];

  let arguments = (ins AnyMemRef:$A, AnyMemRef:$WR, AnyMemRef:$WI, i8:$jobvs);

  let results = (outs i64:$info);
}

def LAPACK_GeevOp : LAPACK_Op<"geev", []> {
  let summary = "Computes all the eigenvalues of A, and (optionally) the left "
                "and right eigenvectors";
  let description = [{}];

  let arguments = (ins AnyMemRef:$A, AnyMemRef:$WR, AnyMemRef:$WI, i8:$jobvs);

  let results = (outs i64:$info);
}

def LAPACK_GesvdOp : LAPACK_Op<"gesvd", [NoSideEffect]> {
  let summary = "Compute the Singular Value Decomposition (SVD) of a general "
                "rectangular matrix";
  let description = [{}];

  let arguments = (ins AnyMemRef:$A, AnyMemRef:$S, i8:$jobu, i8:$jobvt);

  let results = (outs i64:$info);
}

// TODO Computational routines

#endif // LAPACK_MLIR_IR_LAPACKOPS_TD
