add_mlir_dialect_library(MLIRLAPACKDialect
  LAPACKOps.cpp
  LAPACK.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/Dialect/LAPACK

  DEPENDS
  MLIRLAPACKIncGen
  MLIRLAPACKOpsIncGen
  MLIRLAPACKAttrsIncGen

  LINK_LIBS PUBLIC
  MLIRDialect
  MLIRIR
  MLIRMemRefDialect
  MLIRInferTypeOpInterface
  )
