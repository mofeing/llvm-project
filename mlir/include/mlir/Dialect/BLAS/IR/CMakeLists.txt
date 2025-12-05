add_mlir_dialect(BLAS blas)
add_mlir_doc(BLASOps BLAS Dialects/ -gen-dialect-doc)

# Add BLAS operations
set(LLVM_TARGET_DEFINITIONS BLASOps.td)
mlir_tablegen(BLASOps.h.inc -gen-op-decls)
mlir_tablegen(BLASOps.cpp.inc -gen-op-defs)
add_mlir_dialect_tablegen_target(MLIRBLASOpsIncGen)

# Add BLAS types
# set(LLVM_TARGET_DEFINITIONS BLASTypes.td)
# mlir_tablegen(BLASTypesGen.h.inc -gen-typedef-decls)
# mlir_tablegen(BLASTypesGen.cpp.inc -gen-typedef-defs)
# add_mlir_dialect_tablegen_target(MLIRBLASTypesIncGen)

# Add BLAS attributes
set(LLVM_TARGET_DEFINITIONS BLAS.td)
mlir_tablegen(BLASEnums.h.inc -gen-enum-decls)
mlir_tablegen(BLASEnums.cpp.inc -gen-enum-defs)
mlir_tablegen(BLASAttrDefs.h.inc -gen-attrdef-decls)
mlir_tablegen(BLASAttrDefs.cpp.inc -gen-attrdef-defs)
add_mlir_dialect_tablegen_target(MLIRBLASAttrsIncGen)
