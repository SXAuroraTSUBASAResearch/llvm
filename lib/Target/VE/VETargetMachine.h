//===-- VETargetMachine.h - Define TargetMachine for VE ---------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares the VE specific subclass of TargetMachine.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_VE_VETARGETMACHINE_H
#define LLVM_LIB_TARGET_VE_VETARGETMACHINE_H

#include "VEInstrInfo.h"
#include "VESubtarget.h"
#include "llvm/Target/TargetMachine.h"

namespace llvm {

class VETargetMachine : public LLVMTargetMachine {
  std::unique_ptr<TargetLoweringObjectFile> TLOF;
  VESubtarget Subtarget;

public:
  VETargetMachine(const Target &T, const Triple &TT, StringRef CPU,
                  StringRef FS, const TargetOptions &Options,
                  Optional<Reloc::Model> RM, Optional<CodeModel::Model> CM,
                  CodeGenOpt::Level OL, bool JIT);
  ~VETargetMachine() override;

  const VESubtarget *getSubtargetImpl() const { return &Subtarget; }
  const VESubtarget *getSubtargetImpl(const Function &) const override {
    return &Subtarget;
  }

  // Pass Pipeline Configuration
  TargetPassConfig *createPassConfig(PassManagerBase &PM) override;
  TargetLoweringObjectFile *getObjFileLowering() const override {
    return TLOF.get();
  }

  bool isMachineVerifierClean() const override {
    return false;
  }
};

} // end namespace llvm

#endif
