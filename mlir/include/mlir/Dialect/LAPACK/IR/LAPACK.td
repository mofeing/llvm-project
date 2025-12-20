//===- LAPACK.td - Base defs for lapack dialect ----------------*- tablegen
//-*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_DIALECT_LAPACK_IR_LAPACK_TD
#define MLIR_DIALECT_LAPACK_IR_LAPACK_TD

include "mlir/IR/AttrTypeBase.td"
include "mlir/IR/OpBase.td"
include "mlir/IR/EnumAttr.td"

def LAPACK_Dialect : Dialect {
  let name = "lapack";
  let cppNamespace = "mlir::lapack";
  let description = [{
    This dialect models LAPACK subroutines.

    For an in-depth documentation of the LAPACK library interface, please refer to
    official documentation such as the 
    [Netlib LAPACK documentation](https://www.netlib.org/lapack/).
  }];

  let useDefaultAttributePrinterParser = 1;
  let useDefaultTypePrinterParser = 1;
}

#endif // MLIR_DIALECT_LAPACK_IR_LAPACK_TD
