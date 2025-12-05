//===- BLAS.h - BLAS dialect --------------------------------------*- C++-*-==//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
#ifndef MLIR_DIALECT_BLAS_IR_BLAS_H_
#define MLIR_DIALECT_BLAS_IR_BLAS_H_

#include "mlir/Bytecode/BytecodeOpInterface.h"
#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"
#include "mlir/IR/OpImplementation.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"

//===----------------------------------------------------------------------===//
// BLASDialect
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/BLAS/IR/BLASDialect.h.inc"
#include "mlir/Dialect/BLAS/IR/BLASEnums.h.inc"

#define GET_ATTRDEF_CLASSES
#include "mlir/Dialect/BLAS/IR/BLASAttrDefs.h.inc"

#define GET_OP_CLASSES
#include "mlir/Dialect/BLAS/IR/BLASOps.h.inc"

#endif // MLIR_DIALECT_BLAS_IR_BLAS_H_
