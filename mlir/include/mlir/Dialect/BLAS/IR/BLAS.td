//===- BLAS.td - Base defs for blas dialect ----------------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_DIALECT_BLAS_IR_BLAS_TD
#define MLIR_DIALECT_BLAS_IR_BLAS_TD

include "mlir/IR/AttrTypeBase.td"
include "mlir/IR/OpBase.td"
include "mlir/IR/EnumAttr.td"

def BLAS_Dialect : Dialect {
  let name = "blas";
  let cppNamespace = "mlir::blas";
  let description = [{
    This dialect models the Basic Linear Algebra Subprograms (BLAS) operations.

    For an in-depth documentation of the BLAS library interface, please refer to
    official documentation such as the 
    [Netlib BLAS documentation](https://www.netlib.org/blas/).
  }];

  let useDefaultAttributePrinterParser = 1;
  let useDefaultTypePrinterParser = 1;
}

def BLAS_LayoutRowMajor
    : I32EnumAttrCase<"BLAS_ROW_MAJOR", 101, "BLAS_ROW_MAJOR">;
def BLAS_LayoutColMajor
    : I32EnumAttrCase<"BLAS_COL_MAJOR", 102, "BLAS_COL_MAJOR">;

def BLAS_LayoutEnum : I32EnumAttr<"BLAS_LayoutEnum", "BLAS memory layout enum",
                                  [BLAS_LayoutRowMajor, BLAS_LayoutColMajor]> {
  let genSpecializedAttr = 0;
  let cppNamespace = "mlir::blas";
}

def BLAS_LayoutAttr : EnumAttr<BLAS_Dialect, BLAS_LayoutEnum, "layout"> {
  let assemblyFormat = "`<` $value `>`";
}

def BLAS_TransposeNoTrans
    : I32EnumAttrCase<"BLAS_NO_TRANS", 111, "BLAS_NO_TRANS">;
def BLAS_TransposeTrans : I32EnumAttrCase<"BLAS_TRANS", 112, "BLAS_TRANS">;
def BLAS_TransposeConjTrans
    : I32EnumAttrCase<"BLAS_CONJ_TRANS", 113, "BLAS_CONJ_TRANS">;

def BLAS_TransposeEnum
    : I32EnumAttr<"BLAS_Transpose_Enum", "BLAS transpose operation enum",
                  [BLAS_TransposeNoTrans, BLAS_TransposeTrans,
                   BLAS_TransposeConjTrans]> {
  let genSpecializedAttr = 0;
  let cppNamespace = "mlir::blas";
}

def BLAS_TransposeAttr
    : EnumAttr<BLAS_Dialect, BLAS_TransposeEnum, "transpose"> {
  let assemblyFormat = "`<` $value `>`";
}

def BLAS_UploUpper : I32EnumAttrCase<"BLAS_UPPER", 121, "BLAS_UPPER">;
def BLAS_UploLower : I32EnumAttrCase<"BLAS_LOWER", 122, "BLAS_LOWER">;

def BLAS_UploEnum
    : I32EnumAttr<
          "BLAS_UploEnum",
          "BLAS matrix triangle enum", [BLAS_UploUpper, BLAS_UploLower]> {
  let genSpecializedAttr = 0;
  let cppNamespace = "mlir::blas";
}

def BLAS_UploAttr : EnumAttr<BLAS_Dialect, BLAS_UploEnum, "uplo"> {
  let assemblyFormat = "`<` $value `>`";
}

def BLAS_DiagNonUnit : I32EnumAttrCase<"BLAS_NON_UNIT", 131, "BLAS_NON_UNIT">;
def BLAS_DiagUnit : I32EnumAttrCase<"BLAS_UNIT", 132, "BLAS_UNIT">;

def BLAS_DiagEnum
    : I32EnumAttr<
          "BLAS_DiagEnum",
          "BLAS matrix diagonal enum", [BLAS_DiagNonUnit, BLAS_DiagUnit]> {
  let genSpecializedAttr = 0;
  let cppNamespace = "mlir::blas";
}

def BLAS_DiagAttr : EnumAttr<BLAS_Dialect, BLAS_DiagEnum, "diag"> {
  let assemblyFormat = "`<` $value `>`";
}

def BLAS_SideLeft : I32EnumAttrCase<"BLAS_LEFT", 141, "BLAS_LEFT">;
def BLAS_SideRight : I32EnumAttrCase<"BLAS_RIGHT", 142, "BLAS_RIGHT">;

def BLAS_SideEnum
    : I32EnumAttr<"BLAS_SideEnum",
                  "BLAS side enum", [BLAS_SideLeft, BLAS_SideRight]> {
  let genSpecializedAttr = 0;
  let cppNamespace = "mlir::blas";
}

def BLAS_SideAttr : EnumAttr<BLAS_Dialect, BLAS_SideEnum, "side"> {
  let assemblyFormat = "`<` $value `>`";
}

#endif // MLIR_DIALECT_BLAS_IR_BLAS_TD
