//===- LAPACK.h - LAPACK dialect --------------------------------------*- C++-*-==//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
#ifndef MLIR_DIALECT_LAPACK_IR_LAPACK_H_
#define MLIR_DIALECT_LAPACK_IR_LAPACK_H_

#include "mlir/Bytecode/BytecodeOpInterface.h"
#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"
#include "mlir/IR/OpImplementation.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"

//===----------------------------------------------------------------------===//
// LAPACKDialect
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/LAPACK/IR/LAPACKDialect.h.inc"
#include "mlir/Dialect/LAPACK/IR/LAPACKEnums.h.inc"

#define GET_ATTRDEF_CLASSES
#include "mlir/Dialect/LAPACK/IR/LAPACKAttrDefs.h.inc"

#define GET_OP_CLASSES
#include "mlir/Dialect/LAPACK/IR/LAPACKOps.h.inc"

#endif // MLIR_DIALECT_LAPACK_IR_LAPACK_H_
