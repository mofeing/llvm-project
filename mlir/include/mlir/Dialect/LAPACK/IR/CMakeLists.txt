add_mlir_dialect(LAPACK lapack)
add_mlir_doc(LAPACKOps LAPACK Dialects/ -gen-dialect-doc)

# Add LAPACK operations
set(LLVM_TARGET_DEFINITIONS LAPACKOps.td)
mlir_tablegen(LAPACKOps.h.inc -gen-op-decls)
mlir_tablegen(LAPACKOps.cpp.inc -gen-op-defs)
add_mlir_dialect_tablegen_target(MLIRLAPACKOpsIncGen)

# Add LAPACK types
# set(LLVM_TARGET_DEFINITIONS LAPACKTypes.td)
# mlir_tablegen(LAPACKTypesGen.h.inc -gen-typedef-decls)
# mlir_tablegen(LAPACKTypesGen.cpp.inc -gen-typedef-defs)
# add_mlir_dialect_tablegen_target(MLIRLAPACKTypesIncGen)

# Add LAPACK attributes
set(LLVM_TARGET_DEFINITIONS LAPACK.td)
mlir_tablegen(LAPACKEnums.h.inc -gen-enum-decls)
mlir_tablegen(LAPACKEnums.cpp.inc -gen-enum-defs)
mlir_tablegen(LAPACKAttrDefs.h.inc -gen-attrdef-decls)
mlir_tablegen(LAPACKAttrDefs.cpp.inc -gen-attrdef-defs)
add_mlir_dialect_tablegen_target(MLIRLAPACKAttrsIncGen)
