import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Struct.PtrNonNullNonNull
import LeanProofs.Flux.Struct.ChunkFooter
import LeanProofs.Flux.Struct.CmpOrdering
import LeanProofs.Flux.Struct.OpsControlFlowControlFlow
import LeanProofs.Flux.Struct.Tupleₓ₃
import LeanProofs.Flux.Fun.NumWrapOnce
import LeanProofs.Flux.Fun.PtrIsWrappingOffset
import LeanProofs.Flux.Fun.PtrNonNullNnDereferenceable
import LeanProofs.Flux.Fun.PtrNonNullNnAlignedTo
import LeanProofs.Flux.Fun.AllocLayoutPow2bv
import LeanProofs.Flux.Fun.PtrNonNullNnValid
import LeanProofs.Flux.Fun.AllocLayoutPow2
import LeanProofs.Flux.Fun.Pow2bv
import LeanProofs.Flux.Fun.CanRoundUp
import LeanProofs.Flux.Fun.RoundedUp
import LeanProofs.Flux.Fun.RoundedDown
import LeanProofs.Flux.Fun.Allocated
import LeanProofs.Flux.Fun.BumpFinger
import LeanProofs.Flux.Fun.Pow2
import LeanProofs.Flux.Fun.FooterPtr
import LeanProofs.Flux.Fun.CHUNKALIGN
import LeanProofs.Flux.Fun.NumIsizeMAX
import LeanProofs.Flux.Fun.NumUsizeMAX
open Classical
set_option linter.unusedVariables false


namespace F



def BumpMINALIGN0TryAllocLayoutFast := ∃ k62 : Prop, ∃ k63 : (a0 : Int) -> (a1 : Int) -> Prop, ∃ k67 : (a0 : Int) -> (a1 : Int) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> Prop, ∃ k66 : (a0 : Int) -> (a1 : Int) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> (a7 : Int) -> (a8 : Int) -> (a9 : Int) -> (a10 : Int) -> (a11 : Int) -> Prop, ∃ k68 : (a0 : Int) -> (a1 : Int) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> (a7 : Int) -> (a8 : Int) -> (a9 : Int) -> (a10 : Int) -> (a11 : Int) -> Prop, ∃ k19 : (a0 : Int) -> (a1 : Int) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> (a7 : Int) -> (a8 : Int) -> (a9 : Int) -> (a10 : Int) -> (a11 : Int) -> (a12 : Int) -> (a13 : Int) -> (a14 : Int) -> (a15 : Int) -> (a16 : Int) -> Prop, ∃ k39 : (a0 : Int) -> (a1 : Int) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> (a7 : Int) -> (a8 : Int) -> (a9 : Int) -> (a10 : Int) -> (a11 : Int) -> (a12 : Int) -> (a13 : Int) -> (a14 : Int) -> (a15 : Int) -> (a16 : Int) -> Prop, ∃ k10 : (a0 : Int) -> (a1 : Int) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> (a7 : Int) -> (a8 : Int) -> (a9 : Int) -> (a10 : Int) -> (a11 : Int) -> (a12 : Int) -> (a13 : Int) -> (a14 : Int) -> (a15 : Int) -> (a16 : Int) -> Prop, ∃ k78 : (a0 : Int) -> (a1 : Int) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> (a7 : Int) -> (a8 : Int) -> (a9 : Int) -> (a10 : Int) -> (a11 : Int) -> (a12 : Int) -> (a13 : Int) -> (a14 : Int) -> (a15 : Int) -> (a16 : Int) -> (a17 : Int) -> (a18 : Int) -> Prop, ∃ k0 : (a0 : Int) -> (a1 : Int) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> (a7 : Int) -> (a8 : Int) -> (a9 : Int) -> (a10 : Int) -> (a11 : Int) -> (a12 : Int) -> (a13 : Int) -> (a14 : Int) -> (a15 : Int) -> (a16 : Int) -> (a17 : Int) -> (a18 : Int) -> (a19 : Int) -> (a20 : Int) -> (a21 : Int) -> Prop, ∃ k5 : (a0 : Int) -> (a1 : Int) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> (a7 : Int) -> (a8 : Int) -> (a9 : Int) -> (a10 : Int) -> (a11 : Int) -> (a12 : Int) -> (a13 : Int) -> (a14 : Int) -> (a15 : Int) -> (a16 : Int) -> (a17 : Int) -> (a18 : Int) -> (a19 : Int) -> (a20 : Int) -> (a21 : Int) -> Prop, ∃ k29 : (a0 : Int) -> (a1 : Int) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> (a7 : Int) -> (a8 : Int) -> (a9 : Int) -> (a10 : Int) -> (a11 : Int) -> (a12 : Int) -> (a13 : Int) -> (a14 : Int) -> (a15 : Int) -> (a16 : Int) -> (a17 : Int) -> (a18 : Int) -> (a19 : Int) -> (a20 : Int) -> (a21 : Int) -> Prop, ∃ k14 : (a0 : Int) -> (a1 : Int) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> (a7 : Int) -> (a8 : Int) -> (a9 : Int) -> (a10 : Int) -> (a11 : Int) -> (a12 : Int) -> (a13 : Int) -> (a14 : Int) -> (a15 : Int) -> (a16 : Int) -> (a17 : Int) -> (a18 : Int) -> (a19 : Int) -> (a20 : Int) -> (a21 : Int) -> Prop, ∃ k34 : (a0 : Int) -> (a1 : Int) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> (a7 : Int) -> (a8 : Int) -> (a9 : Int) -> (a10 : Int) -> (a11 : Int) -> (a12 : Int) -> (a13 : Int) -> (a14 : Int) -> (a15 : Int) -> (a16 : Int) -> (a17 : Int) -> (a18 : Int) -> (a19 : Int) -> (a20 : Int) -> (a21 : Int) -> Prop, ∃ k104 : (a0 : Int) -> (a1 : Int) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> (a7 : Int) -> (a8 : Int) -> (a9 : Int) -> (a10 : Int) -> (a11 : Int) -> (a12 : Int) -> (a13 : Int) -> (a14 : Int) -> (a15 : Int) -> (a16 : Int) -> (a17 : Int) -> (a18 : Int) -> (a19 : Int) -> (a20 : Int) -> (a21 : Int) -> (a22 : Int) -> (a23 : Int) -> (a24 : Int) -> (a25 : Int) -> (a26 : Int) -> (a27 : Int) -> (a28 : Int) -> (a29 : Int) -> Prop, ∃ k106 : (a0 : Int) -> (a1 : Int) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> (a7 : Int) -> (a8 : Int) -> (a9 : Int) -> (a10 : Int) -> (a11 : Int) -> (a12 : Int) -> (a13 : Int) -> (a14 : Int) -> (a15 : Int) -> (a16 : Int) -> (a17 : Int) -> (a18 : Int) -> (a19 : Int) -> (a20 : Int) -> (a21 : Int) -> (a22 : Int) -> (a23 : Int) -> (a24 : Int) -> (a25 : Int) -> (a26 : Int) -> (a27 : Int) -> (a28 : Int) -> (a29 : Int) -> Prop, 
 ∀ (constgen_MIN_ALIGN_0 : Int),
  ((constgen_MIN_ALIGN_0 ≥ 0)) ->
   ((k62)) ∧
   ((k63 constgen_MIN_ALIGN_0 constgen_MIN_ALIGN_0)) ∧
   (∀ (size₀ : Int),
    ∀ (align₀ : Int),
     ((constgen_MIN_ALIGN_0 > 0) ∧ (pow2 constgen_MIN_ALIGN_0) ∧ (constgen_MIN_ALIGN_0 ≤ CHUNK_ALIGN)) ->
      ((align₀ > 0) ∧ (alloc_layout_pow2 align₀)) ->
       ((((size₀ + align₀) - 1) ≤ num_isize_MAX)) ->
        (∀ (v₀ : PtrNonNullNonNull),
         ((footer_ptr (PtrNonNullNonNull.base v₀) (PtrNonNullNonNull.addr v₀) (PtrNonNullNonNull.size v₀))) ->
          ((k67 (PtrNonNullNonNull.base v₀) (PtrNonNullNonNull.addr v₀) (PtrNonNullNonNull.size v₀) (PtrNonNullNonNull.meta_ v₀) constgen_MIN_ALIGN_0 size₀ align₀)) ∧
          (∀ (a'₃ : ChunkFooter),
           (k66 (ChunkFooter.base a'₃) (ChunkFooter.addr a'₃) (ChunkFooter.size a'₃) (ChunkFooter.align a'₃) (ChunkFooter.meta_ a'₃) (PtrNonNullNonNull.base v₀) (PtrNonNullNonNull.addr v₀) (PtrNonNullNonNull.size v₀) (PtrNonNullNonNull.meta_ v₀) constgen_MIN_ALIGN_0 size₀ align₀))
          ) ∧
        (∀ (a'₄ : PtrNonNullNonNull),
         ((k67 (PtrNonNullNonNull.base a'₄) (PtrNonNullNonNull.addr a'₄) (PtrNonNullNonNull.size a'₄) (PtrNonNullNonNull.meta_ a'₄) constgen_MIN_ALIGN_0 size₀ align₀)) ->
          (footer_ptr (PtrNonNullNonNull.base a'₄) (PtrNonNullNonNull.addr a'₄) (PtrNonNullNonNull.size a'₄))) ∧
        (∀ (footer_ptr₀ : PtrNonNullNonNull),
         ((k67 (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) constgen_MIN_ALIGN_0 size₀ align₀)) ->
          (((PtrNonNullNonNull.base footer_ptr₀) ≥ 0) ∧ ((PtrNonNullNonNull.addr footer_ptr₀) > 0) ∧ ((PtrNonNullNonNull.addr footer_ptr₀) ≤ num_usize_MAX) ∧ (((PtrNonNullNonNull.addr footer_ptr₀) + (PtrNonNullNonNull.size footer_ptr₀)) ≤ num_usize_MAX) ∧ ((PtrNonNullNonNull.meta_ footer_ptr₀) ≥ 0)) ->
           (((ptr_non_null_nn_valid (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) 48)) ∧
           ((ptr_non_null_nn_aligned_to (PtrNonNullNonNull.addr footer_ptr₀) 16))
           ) ∧
           (∀ (a'₆ : ChunkFooter),
            ((k66 (ChunkFooter.base a'₆) (ChunkFooter.addr a'₆) (ChunkFooter.size a'₆) (ChunkFooter.align a'₆) (ChunkFooter.meta_ a'₆) (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) constgen_MIN_ALIGN_0 size₀ align₀)) ->
             (k68 (ChunkFooter.base a'₆) (ChunkFooter.addr a'₆) (ChunkFooter.size a'₆) (ChunkFooter.align a'₆) (ChunkFooter.meta_ a'₆) constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀))) ∧
           (∀ (footer₀ : ChunkFooter),
            ((k68 (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀))) ->
             (((ChunkFooter.size footer₀) ≥ 48)) ->
              ((((ChunkFooter.addr footer₀) % (ChunkFooter.align footer₀)) = 0)) ->
               (((ChunkFooter.addr footer₀) = (ChunkFooter.base footer₀))) ->
                (((ChunkFooter.size footer₀) > 0)) ->
                 ∀ (v₁ : PtrNonNullNonNull),
                  ((bump_finger (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁)) ∧ (((PtrNonNullNonNull.addr v₁) % constgen_MIN_ALIGN_0) = 0)) ->
                   (((PtrNonNullNonNull.base v₁) ≥ 0) ∧ ((PtrNonNullNonNull.addr v₁) > 0) ∧ ((PtrNonNullNonNull.addr v₁) ≤ num_usize_MAX) ∧ (((PtrNonNullNonNull.addr v₁) + (PtrNonNullNonNull.size v₁)) ≤ num_usize_MAX) ∧ ((PtrNonNullNonNull.meta_ v₁) ≥ 0)) ->
                    (((PtrNonNullNonNull.addr v₁) ≥ 0)) ->
                     (((PtrNonNullNonNull.addr v₁) ≤ 18446744073709551615)) ->
                      ((((PtrNonNullNonNull.addr v₁) + (PtrNonNullNonNull.size v₁)) ≤ 18446744073709551615)) ->
                       (((ChunkFooter.base footer₀) ≥ 0) ∧ ((ChunkFooter.addr footer₀) > 0) ∧ ((ChunkFooter.addr footer₀) ≤ num_usize_MAX) ∧ (((ChunkFooter.addr footer₀) + (ChunkFooter.size footer₀)) ≤ num_usize_MAX) ∧ ((ChunkFooter.meta_ footer₀) ≥ 0)) ->
                        (((ChunkFooter.align footer₀) > 0) ∧ (alloc_layout_pow2 (ChunkFooter.align footer₀))) ->
                         (((((ChunkFooter.size footer₀) + (ChunkFooter.align footer₀)) - 1) ≤ num_isize_MAX)) ->
                          ∀ (a'₉ : Int),
                           ((a'₉ ≥ 0)) ->
                            (((ChunkFooter.addr footer₀) ≥ 0)) ->
                             (((ChunkFooter.addr footer₀) ≤ 18446744073709551615)) ->
                              ((((ChunkFooter.addr footer₀) + (ChunkFooter.size footer₀)) ≤ 18446744073709551615)) ->
                               ((((ChunkFooter.addr footer₀) ≤ (PtrNonNullNonNull.addr v₁))) ->
                                (k19 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉)) ∧
                               (((k19 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉)) ->
                                ((((PtrNonNullNonNull.addr footer_ptr₀) ≥ 0)) ->
                                 (((PtrNonNullNonNull.addr footer_ptr₀) ≤ 18446744073709551615)) ->
                                  ((((PtrNonNullNonNull.addr footer_ptr₀) + (PtrNonNullNonNull.size footer_ptr₀)) ≤ 18446744073709551615)) ->
                                   (((PtrNonNullNonNull.addr v₁) ≤ (PtrNonNullNonNull.addr footer_ptr₀))) ->
                                    (k39 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉)) ∧
                                (((k39 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉)) ->
                                 ((k10 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉)) ∧
                                 (((k10 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉)) ->
                                  ((align₀ ≥ 0)) ->
                                   ((k62)) ->
                                    ∀ (a'₁₀ : Int),
                                     ((a'₁₀ ≥ 0)) ->
                                      ((k63 a'₁₀ constgen_MIN_ALIGN_0)) ->
                                       ((((if (align₀ < a'₁₀) then (CmpOrdering.mkCmpOrdering₀ (-1)) else (if (align₀ = a'₁₀) then (CmpOrdering.mkCmpOrdering₀ 0) else (CmpOrdering.mkCmpOrdering₀ 1))) = (CmpOrdering.mkCmpOrdering₀ (-1)))) ->
                                        ((size₀ ≥ 0)) ->
                                         (∀ (result₀ : Int),
                                          ((rounded_up size₀ constgen_MIN_ALIGN_0 result₀)) ->
                                           (k78 result₀ constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀)) ∧
                                         ((((OpsControlFlowControlFlow.mkOpsControlFlowControlFlow₀ (can_round_up size₀ constgen_MIN_ALIGN_0)) = (OpsControlFlowControlFlow.mkOpsControlFlowControlFlow₀ True))) ->
                                          ∀ (a'₁₂ : Int),
                                           ((k78 a'₁₂ constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀)) ->
                                            ((a'₁₂ ≥ 0)) ->
                                             ((((PtrNonNullNonNull.addr v₁) - (ChunkFooter.addr footer₀)) ≥ 0)) ∧
                                             (((¬(a'₁₂ > ((PtrNonNullNonNull.addr v₁) - (ChunkFooter.addr footer₀))))) ->
                                              ∀ (aligned_ptr₀ : (Tupleₓ₃ Int Int Int)),
                                               ((ptr_is_wrapping_offset (Tupleₓ₃.mk (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁)) (-a'₁₂) 1 aligned_ptr₀)) ->
                                                (((Tupleₓ₃.fld₀ aligned_ptr₀) ≥ 0)) ->
                                                 (((Tupleₓ₃.fld₁ aligned_ptr₀) ≥ 0)) ->
                                                  (((Tupleₓ₃.fld₁ aligned_ptr₀) ≤ 18446744073709551615)) ->
                                                   ((((Tupleₓ₃.fld₁ aligned_ptr₀) + (Tupleₓ₃.fld₂ aligned_ptr₀)) ≤ 18446744073709551615)) ->
                                                    (k0 (Tupleₓ₃.fld₀ aligned_ptr₀) (Tupleₓ₃.fld₁ aligned_ptr₀) (Tupleₓ₃.fld₂ aligned_ptr₀) (-1) constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀))
                                             )
                                         ) ∧
                                       ((((if (align₀ < a'₁₀) then (CmpOrdering.mkCmpOrdering₀ (-1)) else (if (align₀ = a'₁₀) then (CmpOrdering.mkCmpOrdering₀ 0) else (CmpOrdering.mkCmpOrdering₀ 1))) = (CmpOrdering.mkCmpOrdering₀ 0))) ->
                                        ((size₀ ≥ 0)) ->
                                         (((pow2 align₀)) ∧
                                         ((can_round_up size₀ align₀))
                                         ) ∧
                                         (∀ (aligned_size₀ : Int),
                                          ((rounded_up size₀ align₀ aligned_size₀)) ->
                                           ((aligned_size₀ ≥ 0)) ->
                                            ((((PtrNonNullNonNull.addr v₁) - (ChunkFooter.addr footer₀)) ≥ 0)) ∧
                                            (((¬(aligned_size₀ > ((PtrNonNullNonNull.addr v₁) - (ChunkFooter.addr footer₀))))) ->
                                             ∀ (aligned_ptr₁ : (Tupleₓ₃ Int Int Int)),
                                              ((ptr_is_wrapping_offset (Tupleₓ₃.mk (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁)) (-aligned_size₀) 1 aligned_ptr₁)) ->
                                               (((Tupleₓ₃.fld₀ aligned_ptr₁) ≥ 0)) ->
                                                (((Tupleₓ₃.fld₁ aligned_ptr₁) ≥ 0)) ->
                                                 (((Tupleₓ₃.fld₁ aligned_ptr₁) ≤ 18446744073709551615)) ->
                                                  ((((Tupleₓ₃.fld₁ aligned_ptr₁) + (Tupleₓ₃.fld₂ aligned_ptr₁)) ≤ 18446744073709551615)) ->
                                                   (k0 (Tupleₓ₃.fld₀ aligned_ptr₁) (Tupleₓ₃.fld₁ aligned_ptr₁) (Tupleₓ₃.fld₂ aligned_ptr₁) 0 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀))
                                            )
                                         ) ∧
                                       ((((if (align₀ < a'₁₀) then (CmpOrdering.mkCmpOrdering₀ (-1)) else (if (align₀ = a'₁₀) then (CmpOrdering.mkCmpOrdering₀ 0) else (CmpOrdering.mkCmpOrdering₀ 1))) = (CmpOrdering.mkCmpOrdering₀ 1))) ->
                                        ((size₀ ≥ 0)) ->
                                         (((pow2 align₀)) ∧
                                         ((can_round_up size₀ align₀))
                                         ) ∧
                                         (∀ (aligned_size₁ : Int),
                                          ((rounded_up size₀ align₀ aligned_size₁)) ->
                                           ((aligned_size₁ ≥ 0)) ->
                                            ((pow2 align₀)) ∧
                                            (∀ (aligned_ptr₂ : (Tupleₓ₃ Int Int Int)),
                                             (((Tupleₓ₃.fld₀ aligned_ptr₂) = (PtrNonNullNonNull.base v₁)) ∧ (rounded_down (PtrNonNullNonNull.addr v₁) align₀ (Tupleₓ₃.fld₁ aligned_ptr₂)) ∧ (((Tupleₓ₃.fld₁ aligned_ptr₂) + (Tupleₓ₃.fld₂ aligned_ptr₂)) = ((PtrNonNullNonNull.addr v₁) + (PtrNonNullNonNull.size v₁)))) ->
                                              (((Tupleₓ₃.fld₀ aligned_ptr₂) ≥ 0)) ->
                                               (((Tupleₓ₃.fld₁ aligned_ptr₂) ≥ 0)) ->
                                                (((Tupleₓ₃.fld₁ aligned_ptr₂) ≤ 18446744073709551615)) ->
                                                 ((((Tupleₓ₃.fld₁ aligned_ptr₂) + (Tupleₓ₃.fld₂ aligned_ptr₂)) ≤ 18446744073709551615)) ->
                                                  (((num_wrap_once ((Tupleₓ₃.fld₁ aligned_ptr₂) - (ChunkFooter.addr footer₀)) 0 num_usize_MAX) ≥ 0)) ->
                                                   ((¬((Tupleₓ₃.fld₁ aligned_ptr₂) < (ChunkFooter.addr footer₀)))) ->
                                                    ((¬(aligned_size₁ > (num_wrap_once ((Tupleₓ₃.fld₁ aligned_ptr₂) - (ChunkFooter.addr footer₀)) 0 num_usize_MAX)))) ->
                                                     ∀ (aligned_ptr₃ : (Tupleₓ₃ Int Int Int)),
                                                      ((ptr_is_wrapping_offset aligned_ptr₂ (-aligned_size₁) 1 aligned_ptr₃)) ->
                                                       (((Tupleₓ₃.fld₀ aligned_ptr₃) ≥ 0)) ->
                                                        (((Tupleₓ₃.fld₁ aligned_ptr₃) ≥ 0)) ->
                                                         (((Tupleₓ₃.fld₁ aligned_ptr₃) ≤ 18446744073709551615)) ->
                                                          ((((Tupleₓ₃.fld₁ aligned_ptr₃) + (Tupleₓ₃.fld₂ aligned_ptr₃)) ≤ 18446744073709551615)) ->
                                                           (k0 (Tupleₓ₃.fld₀ aligned_ptr₃) (Tupleₓ₃.fld₁ aligned_ptr₃) (Tupleₓ₃.fld₂ aligned_ptr₃) 1 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀))
                                            )
                                         ) ∧
                                       (∀ (aligned_ptr₄ : (Tupleₓ₃ Int Int Int)),
                                        ∀ (a'₂₀ : Int),
                                         ((k0 (Tupleₓ₃.fld₀ aligned_ptr₄) (Tupleₓ₃.fld₁ aligned_ptr₄) (Tupleₓ₃.fld₂ aligned_ptr₄) a'₂₀ constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀)) ->
                                          (((pow2 align₀)) ∧
                                          (((¬(((Tupleₓ₃.fld₁ aligned_ptr₄) % align₀) ≠ 0))) ->
                                           (k5 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀ (Tupleₓ₃.fld₀ aligned_ptr₄) (Tupleₓ₃.fld₁ aligned_ptr₄) (Tupleₓ₃.fld₂ aligned_ptr₄) a'₂₀))
                                          ) ∧
                                          (((k5 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀ (Tupleₓ₃.fld₀ aligned_ptr₄) (Tupleₓ₃.fld₁ aligned_ptr₄) (Tupleₓ₃.fld₂ aligned_ptr₄) a'₂₀)) ->
                                           (((¬(((Tupleₓ₃.fld₁ aligned_ptr₄) % constgen_MIN_ALIGN_0) ≠ 0))) ->
                                            (k29 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀ (Tupleₓ₃.fld₀ aligned_ptr₄) (Tupleₓ₃.fld₁ aligned_ptr₄) (Tupleₓ₃.fld₂ aligned_ptr₄) a'₂₀)) ∧
                                           (((k29 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀ (Tupleₓ₃.fld₀ aligned_ptr₄) (Tupleₓ₃.fld₁ aligned_ptr₄) (Tupleₓ₃.fld₂ aligned_ptr₄) a'₂₀)) ->
                                            ((((ChunkFooter.addr footer₀) ≤ (Tupleₓ₃.fld₁ aligned_ptr₄))) ->
                                             (((Tupleₓ₃.fld₁ aligned_ptr₄) ≤ (PtrNonNullNonNull.addr v₁))) ->
                                              (k14 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀ (Tupleₓ₃.fld₀ aligned_ptr₄) (Tupleₓ₃.fld₁ aligned_ptr₄) (Tupleₓ₃.fld₂ aligned_ptr₄) a'₂₀)) ∧
                                            (((k14 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀ (Tupleₓ₃.fld₀ aligned_ptr₄) (Tupleₓ₃.fld₁ aligned_ptr₄) (Tupleₓ₃.fld₂ aligned_ptr₄) a'₂₀)) ->
                                             ((((Tupleₓ₃.fld₁ aligned_ptr₄) ≠ 0)) ->
                                              (k34 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀ (Tupleₓ₃.fld₀ aligned_ptr₄) (Tupleₓ₃.fld₁ aligned_ptr₄) (Tupleₓ₃.fld₂ aligned_ptr₄) a'₂₀)) ∧
                                             (((k34 constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀ (Tupleₓ₃.fld₀ aligned_ptr₄) (Tupleₓ₃.fld₁ aligned_ptr₄) (Tupleₓ₃.fld₂ aligned_ptr₄) a'₂₀)) ->
                                              (((Tupleₓ₃.fld₁ aligned_ptr₄) ≠ 0)) ∧
                                              (∀ (aligned_ptr₅ : PtrNonNullNonNull),
                                               (((PtrNonNullNonNull.base aligned_ptr₅) = (Tupleₓ₃.fld₀ aligned_ptr₄)) ∧ ((PtrNonNullNonNull.addr aligned_ptr₅) = (Tupleₓ₃.fld₁ aligned_ptr₄)) ∧ ((PtrNonNullNonNull.size aligned_ptr₅) = (Tupleₓ₃.fld₂ aligned_ptr₄))) ->
                                                (((PtrNonNullNonNull.base aligned_ptr₅) ≥ 0) ∧ ((PtrNonNullNonNull.addr aligned_ptr₅) > 0) ∧ ((PtrNonNullNonNull.addr aligned_ptr₅) ≤ num_usize_MAX) ∧ (((PtrNonNullNonNull.addr aligned_ptr₅) + (PtrNonNullNonNull.size aligned_ptr₅)) ≤ num_usize_MAX) ∧ ((PtrNonNullNonNull.meta_ aligned_ptr₅) ≥ 0)) ->
                                                 (∀ (a'₂₂ : PtrNonNullNonNull),
                                                  ((bump_finger (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (PtrNonNullNonNull.base a'₂₂) (PtrNonNullNonNull.addr a'₂₂) (PtrNonNullNonNull.size a'₂₂))) ->
                                                   (k104 (PtrNonNullNonNull.base a'₂₂) (PtrNonNullNonNull.addr a'₂₂) (PtrNonNullNonNull.size a'₂₂) (PtrNonNullNonNull.meta_ a'₂₂) constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀ (Tupleₓ₃.fld₀ aligned_ptr₄) (Tupleₓ₃.fld₁ aligned_ptr₄) (Tupleₓ₃.fld₂ aligned_ptr₄) a'₂₀ (PtrNonNullNonNull.base aligned_ptr₅) (PtrNonNullNonNull.addr aligned_ptr₅) (PtrNonNullNonNull.size aligned_ptr₅) (PtrNonNullNonNull.meta_ aligned_ptr₅))) ∧
                                                 (∀ (a'₂₃ : PtrNonNullNonNull),
                                                  ((k104 (PtrNonNullNonNull.base a'₂₃) (PtrNonNullNonNull.addr a'₂₃) (PtrNonNullNonNull.size a'₂₃) (PtrNonNullNonNull.meta_ a'₂₃) constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀ (Tupleₓ₃.fld₀ aligned_ptr₄) (Tupleₓ₃.fld₁ aligned_ptr₄) (Tupleₓ₃.fld₂ aligned_ptr₄) a'₂₀ (PtrNonNullNonNull.base aligned_ptr₅) (PtrNonNullNonNull.addr aligned_ptr₅) (PtrNonNullNonNull.size aligned_ptr₅) (PtrNonNullNonNull.meta_ aligned_ptr₅))) ->
                                                   (bump_finger (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (PtrNonNullNonNull.base a'₂₃) (PtrNonNullNonNull.addr a'₂₃) (PtrNonNullNonNull.size a'₂₃))) ∧
                                                 ((k104 (PtrNonNullNonNull.base aligned_ptr₅) (PtrNonNullNonNull.addr aligned_ptr₅) (PtrNonNullNonNull.size aligned_ptr₅) (PtrNonNullNonNull.meta_ aligned_ptr₅) constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀ (Tupleₓ₃.fld₀ aligned_ptr₄) (Tupleₓ₃.fld₁ aligned_ptr₄) (Tupleₓ₃.fld₂ aligned_ptr₄) a'₂₀ (PtrNonNullNonNull.base aligned_ptr₅) (PtrNonNullNonNull.addr aligned_ptr₅) (PtrNonNullNonNull.size aligned_ptr₅) (PtrNonNullNonNull.meta_ aligned_ptr₅))) ∧
                                                 ((k106 (PtrNonNullNonNull.base aligned_ptr₅) (PtrNonNullNonNull.addr aligned_ptr₅) (PtrNonNullNonNull.size aligned_ptr₅) (PtrNonNullNonNull.meta_ aligned_ptr₅) constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀ (Tupleₓ₃.fld₀ aligned_ptr₄) (Tupleₓ₃.fld₁ aligned_ptr₄) (Tupleₓ₃.fld₂ aligned_ptr₄) a'₂₀ (PtrNonNullNonNull.base aligned_ptr₅) (PtrNonNullNonNull.addr aligned_ptr₅) (PtrNonNullNonNull.size aligned_ptr₅) (PtrNonNullNonNull.meta_ aligned_ptr₅))) ∧
                                                 (∀ (a'₂₄ : PtrNonNullNonNull),
                                                  ((k106 (PtrNonNullNonNull.base a'₂₄) (PtrNonNullNonNull.addr a'₂₄) (PtrNonNullNonNull.size a'₂₄) (PtrNonNullNonNull.meta_ a'₂₄) constgen_MIN_ALIGN_0 size₀ align₀ (PtrNonNullNonNull.base footer_ptr₀) (PtrNonNullNonNull.addr footer_ptr₀) (PtrNonNullNonNull.size footer_ptr₀) (PtrNonNullNonNull.meta_ footer_ptr₀) (ChunkFooter.base footer₀) (ChunkFooter.addr footer₀) (ChunkFooter.size footer₀) (ChunkFooter.align footer₀) (ChunkFooter.meta_ footer₀) (PtrNonNullNonNull.base v₁) (PtrNonNullNonNull.addr v₁) (PtrNonNullNonNull.size v₁) (PtrNonNullNonNull.meta_ v₁) a'₉ a'₁₀ (Tupleₓ₃.fld₀ aligned_ptr₄) (Tupleₓ₃.fld₁ aligned_ptr₄) (Tupleₓ₃.fld₂ aligned_ptr₄) a'₂₀ (PtrNonNullNonNull.base aligned_ptr₅) (PtrNonNullNonNull.addr aligned_ptr₅) (PtrNonNullNonNull.size aligned_ptr₅) (PtrNonNullNonNull.meta_ aligned_ptr₅))) ->
                                                   (allocated (PtrNonNullNonNull.base a'₂₄) (PtrNonNullNonNull.addr a'₂₄) (PtrNonNullNonNull.size a'₂₄) size₀ align₀))
                                                 )
                                              )
                                             )
                                            )
                                           )
                                          )
                                       )
                                 )
                                )
                               )
           )
        )
   
end F
