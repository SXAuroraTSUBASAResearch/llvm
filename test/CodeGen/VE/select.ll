; RUN: llc < %s -mtriple=ve-unknown-unknown | FileCheck %s

define double @selectf64(i1 zeroext, double, double) #0 {
; CHECK-LABEL: selectf64:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    cmov.w.ne %s2, %s1, %s0
; CHECK-NEXT:    or %s0, 0, %s2
  %4 = select i1 %0, double %1, double %2
  ret double %4
}

define float @selectf32(i1 zeroext, float, float) #0 {
; CHECK-LABEL: selectf32:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    cmov.w.ne %s2, %s1, %s0
; CHECK-NEXT:    or %s0, 0, %s2
  %4 = select i1 %0, float %1, float %2
  ret float %4
}

define i64 @selecti64(i1 zeroext, i64, i64) #0 {
; CHECK-LABEL: selecti64:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    cmov.w.ne %s2, %s1, %s0
; CHECK-NEXT:    or %s0, 0, %s2
  %4 = select i1 %0, i64 %1, i64 %2
  ret i64 %4
}

define i32 @selecti32(i1 zeroext, i32, i32) #0 {
; CHECK-LABEL: selecti32:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    cmov.w.ne %s2, %s1, %s0
; CHECK-NEXT:    or %s0, 0, %s2
  %4 = select i1 %0, i32 %1, i32 %2
  ret i32 %4
}

define zeroext i1 @selecti1(i1 zeroext, i1 zeroext, i1 zeroext) #0 {
; CHECK-LABEL: selecti1:
; CHECK:       .LBB{{[0-9]+}}_2:
; CHECK-NEXT:    cmov.w.ne %s2, %s1, %s0
; CHECK-NEXT:    or %s0, 0, %s2
  %4 = select i1 %0, i1 %1, i1 %2
  ret i1 %4
}
