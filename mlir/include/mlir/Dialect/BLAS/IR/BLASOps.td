//===- BLASops.td - Basic Linear Algebra Subroutines Ops ---*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef BLAS_MLIR_IR_BLASOPS_TD
#define BLAS_MLIR_IR_BLASOPS_TD

include "mlir/Dialect/BLAS/IR/BLAS.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

class BLAS_Op<string mnemonic, list<Trait> traits = []>
    : Op<BLAS_Dialect, mnemonic, traits>;

// Level 1 BLAS (vector-vector) Operations

//===----------------------------------------------------------------------===//
// AxpyOp
//===----------------------------------------------------------------------===//

def BLAS_AxpyOp : BLAS_Op<"axpy", []> {
  let summary = "Update vector";
  let description = [{}];

  let arguments = (ins AnyFloat:$alpha, AnyMemRef:$x, AnyMemRef:$y);

  let assemblyFormat = "`(` $alpha `,` $x `,` $y `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// ScalOp
//===----------------------------------------------------------------------===//

def BLAS_ScalOp : BLAS_Op<"scal", []> {
  let summary = "Scale vector";
  let description = [{}];

  let arguments = (ins AnyFloat:$alpha, AnyMemRef:$x);

  let assemblyFormat = "`(` $alpha `,` $x `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// CopyOp
//===----------------------------------------------------------------------===//

def BLAS_CopyOp : BLAS_Op<"copy", []> {
  let summary = "Copy vector";
  let description = [{}];

  let arguments = (ins AnyMemRef:$x, AnyMemRef:$y);

  let assemblyFormat = "`(` $x `,` $y `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// SwapOp
//===----------------------------------------------------------------------===//

def BLAS_SwapOp : BLAS_Op<"swap", []> {
  let summary = "Swap vectors";
  let description = [{}];

  let arguments = (ins AnyMemRef:$x, AnyMemRef:$y);

  let assemblyFormat = "`(` $x `,` $y `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// DotOp
//===----------------------------------------------------------------------===//

// TODO internally double-precision attr
def BLAS_DotOp : BLAS_Op<"dot", [Pure]> {
  let summary = "Dot product";
  let description = [{}];

  let arguments = (ins AnyMemRef:$x, AnyMemRef:$y);

  let results = (outs AnyFloat:$result);

  let assemblyFormat = "`(` $x `,` $y `)` attr-dict `:` type(results)";
}

//===----------------------------------------------------------------------===//
// DotuOp
//===----------------------------------------------------------------------===//

def BLAS_DotuOp : BLAS_Op<"dotu", [Pure]> {
  let summary = "Dot product (complex)";
  let description = [{}];

  let arguments = (ins AnyMemRef:$x, AnyMemRef:$y);

  let results = (outs AnyComplex:$result);

  let assemblyFormat = "`(` $x `,` $y `)` attr-dict `:` type(results)";
}

//===----------------------------------------------------------------------===//
// DotcOp
//===----------------------------------------------------------------------===//

def BLAS_DotcOp : BLAS_Op<"dotc", [Pure]> {
  let summary = "Dot product (complex conjugate)";
  let description = [{}];

  let arguments = (ins AnyMemRef:$x, AnyMemRef:$y);

  let results = (outs AnyComplex:$result);

  let assemblyFormat = "`(` $x `,` $y `)` attr-dict `:` type(results)";
}

//===----------------------------------------------------------------------===//
// Nrm2Op
//===----------------------------------------------------------------------===//

def BLAS_Nrm2Op : BLAS_Op<"nrm2", [Pure]> {
  let summary = "2-norm";
  let description = [{}];

  let arguments = (ins AnyMemRef:$x);

  let results = (outs AnyFloat:$result);

  let assemblyFormat = "`(` $alpha `,` $x `)` attr-dict `:` type(results)";
}

//===----------------------------------------------------------------------===//
// AsumOp
//===----------------------------------------------------------------------===//

def BLAS_AsumOp : BLAS_Op<"asum", [Pure]> {
  let summary = "1-norm";
  let description = [{}];

  let arguments = (ins AnyMemRef:$x);

  let results = (outs AnyFloat:$result);

  let assemblyFormat = "`(` $x `)` attr-dict `:` type(results)";
}

//===----------------------------------------------------------------------===//
// IamaxOp
//===----------------------------------------------------------------------===//

def BLAS_IamaxOp : BLAS_Op<"iamax", [Pure]> {
  let summary = "Infinite-norm index";
  let description = [{}];

  let arguments = (ins AnyMemRef:$x);

  let results = (outs Index:$index);

  let assemblyFormat = "`(` $x `)` attr-dict `:` type(results)";
}

//===----------------------------------------------------------------------===//
// RotgOp
//===----------------------------------------------------------------------===//

// TODO check `c` and `s` types
def BLAS_RotgOp : BLAS_Op<"rotg", []> {
  let summary = "Generate plane (Given's) rotation";
  let description = [{}];

  let arguments = (ins AnyMemRef:$a, AnyMemRef:$b, AnyMemRef:$c, AnyMemRef:$s);

  let assemblyFormat = "`(` $a `,` $b `,` $c `,` $s `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// RotOp
//===----------------------------------------------------------------------===//

// TODO check `c` and `s` types
def BLAS_RotOp : BLAS_Op<"rot", []> {
  let summary = "Apply plane rotation";
  let description = [{}];

  let arguments = (ins AnyMemRef:$x, AnyMemRef:$y, AnyMemRef:$c, AnyMemRef:$s);

  let assemblyFormat = "`(` $a `,` $b `,` $c `,` $s `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// RotmgOp
//===----------------------------------------------------------------------===//

// TODO check `d1`, `d2` and `param` types
def BLAS_RotmgOp : BLAS_Op<"rotmg", []> {
  let summary = "Generate modified plane rotation";
  let description = [{}];

  let arguments = (ins AnyMemRef:$d1, AnyMemRef:$d2, AnyMemRef:$a, AnyMemRef:$b,
      AnyMemRef:$param);

  let assemblyFormat = "`(` $d1 `,` $d2 `,` $a `,` $b `,` $param `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// RotmOp
//===----------------------------------------------------------------------===//

// TODO check `d1`, `d2` and `param` types
def BLAS_RotmOp : BLAS_Op<"rotm", []> {
  let summary = "Apply modified plane rotation";
  let description = [{}];

  let arguments = (ins AnyMemRef:$x, AnyMemRef:$y, AnyMemRef:$param);

  let assemblyFormat = "`(` $x `,` $y `,` $param `)` attr-dict";
}

// Level 2 BLAS (matrix-vector) Operations

//===----------------------------------------------------------------------===//
// GemvOp
//===----------------------------------------------------------------------===//

def BLAS_GemvOp : BLAS_Op<"gemv", []> {
  let summary = "General matrix-vector multiply";
  let description = [{}];

  let arguments = (ins BLAS_TransposeAttr:$trans, AnyFloat:$alpha, AnyMemRef:$A,
      AnyMemRef:$x, AnyFloat:$beta, AnyMemRef:$y);

  let assemblyFormat = "`(` $alpha `,` $A `,` $x `,` $beta `,` $y `)` "
                       "attr-dict";
}

//===----------------------------------------------------------------------===//
// SymvOp
//===----------------------------------------------------------------------===//

def BLAS_SymvOp : BLAS_Op<"semv", []> {
  let summary = "Symmetric matrix-vector multiply";
  let description = [{}];

  let arguments = (ins BLAS_UploAttr:$uplo, AnyFloat:$alpha, AnyMemRef:$A,
      AnyMemRef:$x, AnyFloat:$beta, AnyMemRef:$y);

  let assemblyFormat = "`(` $alpha `,` $A `,` $x `,` $beta `,` $y `)` "
                       "attr-dict";
}

//===----------------------------------------------------------------------===//
// HemvOp
//===----------------------------------------------------------------------===//

def BLAS_HemvOp : BLAS_Op<"hemv", []> {
  let summary = "Hermitian matrix-vector multiply";
  let description = [{}];

  let arguments = (ins BLAS_UploAttr:$uplo, AnyFloat:$alpha, AnyMemRef:$A,
      AnyMemRef:$x, AnyFloat:$beta, AnyMemRef:$y);

  let assemblyFormat = "`(` $alpha `,` $A `,` $x `,` $beta `,` $y `)` "
                       "attr-dict";
}

//===----------------------------------------------------------------------===//
// TrmvOp
//===----------------------------------------------------------------------===//

def BLAS_TrmvOp : BLAS_Op<"trmv", []> {
  let summary = "Triangular matrix-vector multiply";
  let description = [{}];

  let arguments = (ins BLAS_UploAttr:$uplo, BLAS_TransposeAttr:$trans,
      BLAS_DiagAttr:$diag, AnyFloat:$alpha, AnyMemRef:$A, AnyMemRef:$x);

  let assemblyFormat = "`(` $alpha `,` $A `,` $x `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// TrsvOp
//===----------------------------------------------------------------------===//

def BLAS_TrsvOp : BLAS_Op<"trsv", []> {
  let summary = "Triangular solve";
  let description = [{}];

  let arguments = (ins BLAS_UploAttr:$uplo, BLAS_TransposeAttr:$trans,
      BLAS_DiagAttr:$diag, AnyFloat:$alpha, AnyMemRef:$A, AnyMemRef:$x);

  let assemblyFormat = "`(` $alpha `,` $A `,` $x `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// GerOp
//===----------------------------------------------------------------------===//

def BLAS_GerOp : BLAS_Op<"ger", []> {
  let summary = "General rank-1 update";
  let description = [{}];

  let arguments = (ins AnyFloat:$alpha, AnyMemRef:$x, AnyMemRef:$y,
      AnyMemRef:$A);

  let assemblyFormat = "`(` $alpha `,` $x `,` $y `,` $A `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// GeruOp
//===----------------------------------------------------------------------===//

def BLAS_GeruOp : BLAS_Op<"geru", []> {
  let summary = "General rank-1 update (complex)";
  let description = [{}];

  let arguments = (ins AnyFloat:$alpha, AnyMemRef:$x, AnyMemRef:$y,
      AnyMemRef:$A);

  let assemblyFormat = "`(` $alpha `,` $x `,` $y `,` $A `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// GercOp
//===----------------------------------------------------------------------===//

def BLAS_GercOp : BLAS_Op<"gerc", []> {
  let summary = "General rank-1 update (complex conjugate)";
  let description = [{}];

  let arguments = (ins AnyFloat:$alpha, AnyMemRef:$x, AnyMemRef:$y,
      AnyMemRef:$A);

  let assemblyFormat = "`(` $alpha `,` $x `,` $y `,` $A `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// SyrOp
//===----------------------------------------------------------------------===//

def BLAS_SyrOp : BLAS_Op<"syr", []> {
  let summary = "Symmetric rank-1 update";
  let description = [{}];

  let arguments = (ins BLAS_UploAttr:$uplo, AnyFloat:$alpha, AnyMemRef:$x,
      AnyMemRef:$A);

  let assemblyFormat = "`(` $alpha `,` $x `,` $A `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// HerOp
//===----------------------------------------------------------------------===//

def BLAS_HerOp : BLAS_Op<"her", []> {
  let summary = "Hermitian rank-1 update";
  let description = [{}];

  let arguments = (ins BLAS_UploAttr:$uplo, AnyFloat:$alpha, AnyMemRef:$x,
      AnyMemRef:$A);

  let assemblyFormat = "`(` $alpha `,` $x `,` $A `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// Syr2Op
//===----------------------------------------------------------------------===//

def BLAS_Syr2Op : BLAS_Op<"syr2", []> {
  let summary = "Symmetric rank-2 update";
  let description = [{}];

  let arguments = (ins BLAS_UploAttr:$uplo, AnyFloat:$alpha, AnyMemRef:$x,
      AnyMemRef:$y, AnyMemRef:$A);

  let assemblyFormat = "`(` $alpha `,` $x `,` $y `,` $A `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// Her2Op
//===----------------------------------------------------------------------===//

def BLAS_Her2Op : BLAS_Op<"her2", []> {
  let summary = "Hermitian rank-2 update";
  let description = [{}];

  let arguments = (ins BLAS_UploAttr:$uplo, AnyFloat:$alpha, AnyMemRef:$x,
      AnyMemRef:$y, AnyMemRef:$A);

  let assemblyFormat = "`(` $alpha `,` $x `,` $y `,` $A `)` attr-dict";
}

// Level 3 BLAS (matrix-matrix) Operations

//===----------------------------------------------------------------------===//
// GemmOp
//===----------------------------------------------------------------------===//

def BLAS_GemmOp : BLAS_Op<"gemm", []> {
  let summary = "General matrix-matrix multiply";
  let description = [{
    The general matrix-matrix multiplication operation computes the matrix
    product of two input matrices A and B, scales it by a scalar alpha, scales
    an input matrix C by a scalar beta, and adds the two results to produce
    the output matrix C:

    C = alpha * op(A) * op(B) + beta * C

    where op(X) is either X, its transpose, or its conjugate transpose,
    depending on the transpose attributes provided for matrices A and B.
  }];

  let arguments = (ins BLAS_TransposeAttr:$transA, BLAS_TransposeAttr:$transB,
      AnyFloat:$alpha, AnyMemRef:$A, AnyMemRef:$B, AnyFloat:$beta,
      AnyMemRef:$C);

  let assemblyFormat = "`(` $alpha `,` $A `,` $B `,` $beta `,` $C `)` "
                       "attr-dict";
}

//===----------------------------------------------------------------------===//
// GemmtrOp
//===----------------------------------------------------------------------===//

def BLAS_GemmtrOp : BLAS_Op<"gemmtr", []> {
  let summary = "General matrix-matrix multiply on triangular sector";
  let description = [{}];

  let arguments = (ins BLAS_UploAttr:$uplo, BLAS_TransposeAttr:$transA,
      BLAS_TransposeAttr:$transB, AnyFloat:$alpha, AnyMemRef:$A, AnyMemRef:$B,
      AnyFloat:$beta, AnyMemRef:$C);

  let assemblyFormat = "`(` $alpha `,` $A `,` $B `,` $beta `,` $C `)` "
                       "attr-dict";
}

//===----------------------------------------------------------------------===//
// SymmOp
//===----------------------------------------------------------------------===//

def BLAS_SymmOp : BLAS_Op<"symm", []> {
  let summary = "Symmetric matrix-matrix multiply";
  let description = [{}];

  let arguments = (ins BLAS_SideAttr:$side, BLAS_UploAttr:$uplo,
      AnyFloat:$alpha, AnyMemRef:$A, AnyMemRef:$B, AnyFloat:$beta,
      AnyMemRef:$C);

  let assemblyFormat = "`(` $alpha `,` $A `,` $B `,` $beta `,` $C `)` "
                       "attr-dict";
}

//===----------------------------------------------------------------------===//
// HemmOp
//===----------------------------------------------------------------------===//

def BLAS_HemmOp : BLAS_Op<"hemm", []> {
  let summary = "Hermitian matrix-matrix multiply";
  let description = [{}];

  let arguments = (ins BLAS_SideAttr:$side, BLAS_UploAttr:$uplo,
      BLAS_TransposeAttr:$transA, BLAS_TransposeAttr:$transB, AnyFloat:$alpha,
      AnyMemRef:$A, AnyMemRef:$B, AnyFloat:$beta, AnyMemRef:$C);

  let assemblyFormat = "`(` $alpha `,` $A `,` $B `,` $beta `,` $C `)` "
                       "attr-dict";
}

//===----------------------------------------------------------------------===//
// TrmmOp
//===----------------------------------------------------------------------===//

def BLAS_TrmmOp : BLAS_Op<"trmm", []> {
  let summary = "Triangular matrix-matrix multiply";
  let description = [{}];

  let arguments = (ins BLAS_SideAttr:$side, BLAS_UploAttr:$uplo,
      BLAS_TransposeAttr:$transA, BLAS_DiagAttr:$diag, AnyFloat:$alpha,
      AnyMemRef:$A, AnyMemRef:$B);

  let assemblyFormat = "`(` $alpha `,` $A `,` $B `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// TrsmOp
//===----------------------------------------------------------------------===//

def BLAS_TrsmOp : BLAS_Op<"trsm", []> {
  let summary = "Triangular solve matrix";
  let description = [{}];

  let arguments = (ins BLAS_SideAttr:$side, BLAS_UploAttr:$uplo,
      BLAS_TransposeAttr:$transA, BLAS_DiagAttr:$diag, AnyFloat:$alpha,
      AnyMemRef:$A, AnyMemRef:$B);

  let assemblyFormat = "`(` $alpha `,` $A `,` $B `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// SyrkOp
//===----------------------------------------------------------------------===//

def BLAS_SyrkOp : BLAS_Op<"syrk", []> {
  let summary = "Symmetric rank-k update";
  let description = [{}];

  let arguments = (ins BLAS_UploAttr:$uplo, BLAS_TransposeAttr:$trans,
      AnyFloat:$alpha, AnyMemRef:$A, AnyFloat:$beta, AnyMemRef:$C);

  let assemblyFormat = "`(` $alpha `,` $A `,` $beta `,` $C `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// HerkOp
//===----------------------------------------------------------------------===//

def BLAS_HerkOp : BLAS_Op<"herk", []> {
  let summary = "Hermitian rank-k update";
  let description = [{}];

  let arguments = (ins BLAS_UploAttr:$uplo, BLAS_TransposeAttr:$trans,
      AnyFloat:$alpha, AnyMemRef:$A, AnyFloat:$beta, AnyMemRef:$C);

  let assemblyFormat = "`(` $alpha `,` $A `,` $beta `,` $C `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// Syr2kOp
//===----------------------------------------------------------------------===//

def BLAS_Syr2kOp : BLAS_Op<"syr2k", []> {
  let summary = "Symmetric rank-2k update";
  let description = [{}];

  let arguments = (ins BLAS_UploAttr:$uplo, BLAS_TransposeAttr:$trans,
      AnyFloat:$alpha, AnyMemRef:$A, AnyMemRef:$B, AnyFloat:$beta,
      AnyMemRef:$C);

  let assemblyFormat = "`(` $alpha `,` $A `,` $beta `,` $C `)` attr-dict";
}

//===----------------------------------------------------------------------===//
// Her2kOp
//===----------------------------------------------------------------------===//

def BLAS_Her2kOp : BLAS_Op<"her2k", []> {
  let summary = "Hermitian rank-2k update";
  let description = [{}];

  let arguments = (ins BLAS_UploAttr:$uplo, BLAS_TransposeAttr:$trans,
      AnyFloat:$alpha, AnyMemRef:$A, AnyMemRef:$B, AnyFloat:$beta,
      AnyMemRef:$C);

  let assemblyFormat = "`(` $alpha `,` $A `,` $beta `,` $C `)` attr-dict";
}

#endif // BLAS_MLIR_IR_BLASOPS_TD
