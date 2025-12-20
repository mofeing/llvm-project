//===- LAPACK.cpp - LAPACK dialect implementation -------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/LAPACK/IR/LAPACK.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/DialectImplementation.h"
#include "llvm/ADT/TypeSwitch.h"

using namespace mlir;
using namespace mlir::lapack;

//===----------------------------------------------------------------------===//
/// Tablegen Definitions
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/LAPACK/IR/LAPACK.cpp.inc"

#include "mlir/Dialect/LAPACK/IR/LAPACKDialect.cpp.inc"

void LAPACKDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "mlir/Dialect/LAPACK/IR/LAPACKOps.cpp.inc"
      >();

  addAttributes<
#define GET_ATTRDEF_LIST
#include "mlir/Dialect/LAPACK/IR/LAPACKAttrDefs.cpp.inc"
      >();
}

//===----------------------------------------------------------------------===//
// TableGen'd dialect, type, and op definitions
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/LAPACK/IR/LAPACKEnums.cpp.inc"

#define GET_ATTRDEF_CLASSES
#include "mlir/Dialect/LAPACK/IR/LAPACKAttrDefs.cpp.inc"
