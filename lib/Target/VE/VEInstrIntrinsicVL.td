// Pattern Matchings for VEL Intrinsics

def : Pat<(int_ve_vl_svob), (SVOB)>;
def : Pat<(i64 (int_ve_vl_pack_f32p ADDRri:$addr0, ADDRri:$addr1)),
          (ORrr (INSERT_SUBREG (i64 (IMPLICIT_DEF)),
                               (LDUri MEMri:$addr0), sub_f32),
                (INSERT_SUBREG (i64 (IMPLICIT_DEF)),
                               (LDLUri MEMri:$addr1), sub_i32))>;

def : Pat<(i64 (int_ve_vl_pack_f32a ADDRri:$addr)),
          (i64 (MPYrr
            (INSERT_SUBREG (i64 (IMPLICIT_DEF)), (LDLUri MEMri:$addr), sub_i32),
            (LEASLrzi (ANDrm0 (LEAzzi (LO32 (i64 0x0000000100000001))), 32),
                      (HI32 (i64 0x0000000100000001)))))>;

def : Pat<(v4i64 (int_ve_vl_extract_vm512u v8i64:$vm)),
          (v4i64 (EXTRACT_SUBREG v8i64:$vm, sub_vm_even))>;

def : Pat<(v4i64 (int_ve_vl_extract_vm512l v8i64:$vm)),
          (v4i64 (EXTRACT_SUBREG v8i64:$vm, sub_vm_odd))>;

def : Pat<(v8i64 (int_ve_vl_insert_vm512u v8i64:$vmx, v4i64:$vmy)),
          (v8i64 (INSERT_SUBREG v8i64:$vmx, v4i64:$vmy, sub_vm_even))>;

def : Pat<(v8i64 (int_ve_vl_insert_vm512l v8i64:$vmx, v4i64:$vmy)),
          (v8i64 (INSERT_SUBREG v8i64:$vmx, v4i64:$vmy, sub_vm_odd))>;


include "VEInstrIntrinsicVL.gen.td"
