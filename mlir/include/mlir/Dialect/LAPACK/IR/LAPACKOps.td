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

#endif // LAPACK_MLIR_IR_LAPACKOPS_TD
