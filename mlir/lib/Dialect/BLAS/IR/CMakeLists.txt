add_mlir_dialect_library(MLIRBLASDialect
  BLASOps.cpp
  BLAS.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/Dialect/BLAS

  DEPENDS
  MLIRBLASIncGen
  MLIRBLASOpsIncGen
  MLIRBLASAttrsIncGen

  LINK_LIBS PUBLIC
  MLIRDialect
  MLIRIR
  MLIRMemRefDialect
  MLIRInferTypeOpInterface
  )
