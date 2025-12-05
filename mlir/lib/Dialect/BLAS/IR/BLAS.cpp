//===- BLAS.cpp - BLAS dialect implementation -------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/BLAS/IR/BLAS.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/DialectImplementation.h"
#include "llvm/ADT/TypeSwitch.h"

using namespace mlir;
using namespace mlir::BLAS;

//===----------------------------------------------------------------------===//
/// Tablegen Definitions
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/BLAS/IR/BLAS.cpp.inc"

#include "mlir/Dialect/BLAS/IR/BLASDialect.cpp.inc"

void BLASDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "mlir/Dialect/BLAS/IR/BLASOps.cpp.inc"
      >();

  addAttributes<
#define GET_ATTRDEF_LIST
#include "mlir/Dialect/BLAS/IR/BLASAttrDefs.cpp.inc"
      >();
}

//===----------------------------------------------------------------------===//
// TableGen'd dialect, type, and op definitions
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/BLAS/IR/BLASEnums.cpp.inc"

#define GET_ATTRDEF_CLASSES
#include "mlir/Dialect/BLAS/IR/BLASAttrDefs.cpp.inc"
