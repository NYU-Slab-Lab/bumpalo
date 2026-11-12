import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Struct.EmplaceEmplaceSlice
import LeanProofs.Flux.Struct.ResultResult
import LeanProofs.Flux.Struct.OpsControlFlowControlFlow
import LeanProofs.Flux.Struct.SliceIterIter
import LeanProofs.Flux.Struct.IterAdaptersClonedCloned
import LeanProofs.Flux.Struct.OptionOption
import LeanProofs.Flux.Struct.Tupleₓ₃
import LeanProofs.Flux.Fun.PtrDereferenceable
import LeanProofs.Flux.Fun.PtrAddrAligned
import LeanProofs.Flux.Fun.PtrValidNoZst
import LeanProofs.Flux.Fun.PtrInBounds
import LeanProofs.Flux.Fun.PtrAlignedTo
import LeanProofs.Flux.Fun.PtrValid
import LeanProofs.Flux.Fun.Pow2
import LeanProofs.Flux.Fun.Allocated
import LeanProofs.Flux.Fun.ValidArrayLayout
import LeanProofs.Flux.Fun.NumIsizeMAX
open Classical
set_option linter.unusedVariables false


namespace F



def EmplaceEmplaceSliceATMINALIGNTryExtendFromSliceClone := ∀ (c1 : Int), ∀ (c2 : Int), ∃ k0 : (a0 : Int) -> (a1 : Int) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> (a7 : Int) -> (a8 : Int) -> (a9 : Int) -> (a10 : Int) -> (a11 : Int) -> (a12 : Int) -> (a13 : Int) -> (a14 : Int) -> (a15 : Int) -> (a16 : Prop) -> (a17 : Int) -> (a18 : Int) -> (a19 : Int) -> (a20 : Int) -> (a21 : Int) -> (a22 : Int) -> Prop, 
 ∀ (constgen_MIN_ALIGN_2 : Int),
  ((constgen_MIN_ALIGN_2 ≥ 0)) ->
   ∀ (a'₀ : EmplaceEmplaceSlice),
    ((valid_array_layout (EmplaceEmplaceSlice.cap a'₀) (c1) (c2))) ->
     (((EmplaceEmplaceSlice.addr a'₀) > 0) ∧ (allocated (EmplaceEmplaceSlice.base a'₀) (EmplaceEmplaceSlice.addr a'₀) (EmplaceEmplaceSlice.size a'₀) ((EmplaceEmplaceSlice.cap a'₀) * (c1)) (c2))) ->
      (((EmplaceEmplaceSlice.len a'₀) ≤ (EmplaceEmplaceSlice.cap a'₀))) ->
       ∀ (a'₁ : Int),
        ((a'₁ ≥ 0)) ->
         ∀ (ok₀ : ResultResult),
          ∀ (v₀ : EmplaceEmplaceSlice),
           (((EmplaceEmplaceSlice.len v₀) = (EmplaceEmplaceSlice.len a'₀)) ∧ ((ResultResult.is_ok ok₀) -> ((EmplaceEmplaceSlice.cap v₀) ≥ ((EmplaceEmplaceSlice.len a'₀) + a'₁)))) ->
            ((valid_array_layout (EmplaceEmplaceSlice.cap v₀) (c1) (c2))) ->
             (((EmplaceEmplaceSlice.addr v₀) > 0) ∧ (allocated (EmplaceEmplaceSlice.base v₀) (EmplaceEmplaceSlice.addr v₀) (EmplaceEmplaceSlice.size v₀) ((EmplaceEmplaceSlice.cap v₀) * (c1)) (c2))) ->
              (((EmplaceEmplaceSlice.len v₀) ≤ (EmplaceEmplaceSlice.cap v₀))) ->
               (((OpsControlFlowControlFlow.mkOpsControlFlowControlFlow₀ (ResultResult.is_ok ok₀)) = (OpsControlFlowControlFlow.mkOpsControlFlowControlFlow₀ True))) ->
                ((k0 0 a'₁ (EmplaceEmplaceSlice.base v₀) (EmplaceEmplaceSlice.addr v₀) (EmplaceEmplaceSlice.size v₀) (EmplaceEmplaceSlice.len v₀) (EmplaceEmplaceSlice.cap v₀) (EmplaceEmplaceSlice.meta_ v₀) constgen_MIN_ALIGN_2 (EmplaceEmplaceSlice.base a'₀) (EmplaceEmplaceSlice.addr a'₀) (EmplaceEmplaceSlice.size a'₀) (EmplaceEmplaceSlice.len a'₀) (EmplaceEmplaceSlice.cap a'₀) (EmplaceEmplaceSlice.meta_ a'₀) a'₁ (ResultResult.is_ok ok₀) (EmplaceEmplaceSlice.base v₀) (EmplaceEmplaceSlice.addr v₀) (EmplaceEmplaceSlice.size v₀) (EmplaceEmplaceSlice.len v₀) (EmplaceEmplaceSlice.cap v₀) (EmplaceEmplaceSlice.meta_ v₀))) ∧
                (∀ (iter₀ : (IterAdaptersClonedCloned SliceIterIter)),
                 ∀ (a'₅ : EmplaceEmplaceSlice),
                  ((k0 (SliceIterIter.idx (IterAdaptersClonedCloned.inner iter₀)) (SliceIterIter.len (IterAdaptersClonedCloned.inner iter₀)) (EmplaceEmplaceSlice.base a'₅) (EmplaceEmplaceSlice.addr a'₅) (EmplaceEmplaceSlice.size a'₅) (EmplaceEmplaceSlice.len a'₅) (EmplaceEmplaceSlice.cap a'₅) (EmplaceEmplaceSlice.meta_ a'₅) constgen_MIN_ALIGN_2 (EmplaceEmplaceSlice.base a'₀) (EmplaceEmplaceSlice.addr a'₀) (EmplaceEmplaceSlice.size a'₀) (EmplaceEmplaceSlice.len a'₀) (EmplaceEmplaceSlice.cap a'₀) (EmplaceEmplaceSlice.meta_ a'₀) a'₁ (ResultResult.is_ok ok₀) (EmplaceEmplaceSlice.base v₀) (EmplaceEmplaceSlice.addr v₀) (EmplaceEmplaceSlice.size v₀) (EmplaceEmplaceSlice.len v₀) (EmplaceEmplaceSlice.cap v₀) (EmplaceEmplaceSlice.meta_ v₀))) ->
                   ∀ (next_s₀ : (IterAdaptersClonedCloned SliceIterIter)),
                    (((SliceIterIter.len (IterAdaptersClonedCloned.inner iter₀)) = (SliceIterIter.len (IterAdaptersClonedCloned.inner next_s₀))) ∧ (if ((SliceIterIter.idx (IterAdaptersClonedCloned.inner iter₀)) < (SliceIterIter.len (IterAdaptersClonedCloned.inner iter₀))) then ((SliceIterIter.idx (IterAdaptersClonedCloned.inner next_s₀)) = ((SliceIterIter.idx (IterAdaptersClonedCloned.inner iter₀)) + 1)) else ((SliceIterIter.idx (IterAdaptersClonedCloned.inner next_s₀)) = (SliceIterIter.idx (IterAdaptersClonedCloned.inner iter₀))))) ->
                     (((OptionOption.mkOptionOption₀ (¬((SliceIterIter.idx (IterAdaptersClonedCloned.inner iter₀)) ≥ (SliceIterIter.len (IterAdaptersClonedCloned.inner iter₀))))) = (OptionOption.mkOptionOption₀ True))) ->
                      ∀ (a'₇ : Int),
                       (((EmplaceEmplaceSlice.base a'₅) ≥ 0)) ->
                        (((EmplaceEmplaceSlice.addr a'₅) ≥ 0)) ->
                         (((EmplaceEmplaceSlice.addr a'₅) ≤ 18446744073709551615)) ->
                          ((((EmplaceEmplaceSlice.addr a'₅) + (EmplaceEmplaceSlice.size a'₅)) ≤ 18446744073709551615)) ->
                           ((allocated (EmplaceEmplaceSlice.base a'₅) (EmplaceEmplaceSlice.addr a'₅) (EmplaceEmplaceSlice.size a'₅) 0 (c2))) ->
                            (((EmplaceEmplaceSlice.len a'₅) ≥ 0)) ->
                             (((EmplaceEmplaceSlice.cap a'₅) ≥ 0)) ->
                              (((((EmplaceEmplaceSlice.len a'₅) * (c1)) = 0) ∨ ((ptr_in_bounds (Tupleₓ₃.mk (EmplaceEmplaceSlice.base a'₅) (EmplaceEmplaceSlice.addr a'₅) (EmplaceEmplaceSlice.size a'₅))) ∧ (((EmplaceEmplaceSlice.len a'₅) * (c1)) ≤ (EmplaceEmplaceSlice.size a'₅))))) ∧
                              ((((ptr_addr_aligned (EmplaceEmplaceSlice.addr a'₅) (c2)) -> (ptr_addr_aligned ((EmplaceEmplaceSlice.addr a'₅) + ((EmplaceEmplaceSlice.len a'₅) * (c1))) (c2)))) ->
                               ((((EmplaceEmplaceSlice.addr a'₅) + ((EmplaceEmplaceSlice.len a'₅) * (c1))) ≥ 0)) ->
                                ((((EmplaceEmplaceSlice.addr a'₅) + ((EmplaceEmplaceSlice.len a'₅) * (c1))) ≤ 18446744073709551615)) ->
                                 (((((EmplaceEmplaceSlice.addr a'₅) + ((EmplaceEmplaceSlice.len a'₅) * (c1))) + ((EmplaceEmplaceSlice.size a'₅) - ((EmplaceEmplaceSlice.len a'₅) * (c1)))) ≤ 18446744073709551615)) ->
                                  (((ptr_valid (Tupleₓ₃.mk (EmplaceEmplaceSlice.base a'₅) ((EmplaceEmplaceSlice.addr a'₅) + ((EmplaceEmplaceSlice.len a'₅) * (c1))) ((EmplaceEmplaceSlice.size a'₅) - ((EmplaceEmplaceSlice.len a'₅) * (c1)))) (c1))) ∧
                                  ((ptr_aligned_to (Tupleₓ₃.mk (EmplaceEmplaceSlice.base a'₅) ((EmplaceEmplaceSlice.addr a'₅) + ((EmplaceEmplaceSlice.len a'₅) * (c1))) ((EmplaceEmplaceSlice.size a'₅) - ((EmplaceEmplaceSlice.len a'₅) * (c1)))) (c2)))
                                  ) ∧
                                  ((valid_array_layout (EmplaceEmplaceSlice.cap a'₅) (c1) (c2))) ∧
                                  ((((EmplaceEmplaceSlice.addr a'₅) > 0)) ∧
                                  ((allocated (EmplaceEmplaceSlice.base a'₅) (EmplaceEmplaceSlice.addr a'₅) (EmplaceEmplaceSlice.size a'₅) ((EmplaceEmplaceSlice.cap a'₅) * (c1)) (c2)))
                                  ) ∧
                                  ((((EmplaceEmplaceSlice.len a'₅) + 1) ≤ (EmplaceEmplaceSlice.cap a'₅))) ∧
                                  ((k0 (SliceIterIter.idx (IterAdaptersClonedCloned.inner next_s₀)) (SliceIterIter.len (IterAdaptersClonedCloned.inner next_s₀)) (EmplaceEmplaceSlice.base a'₅) (EmplaceEmplaceSlice.addr a'₅) (EmplaceEmplaceSlice.size a'₅) ((EmplaceEmplaceSlice.len a'₅) + 1) (EmplaceEmplaceSlice.cap a'₅) (EmplaceEmplaceSlice.meta_ a'₅) constgen_MIN_ALIGN_2 (EmplaceEmplaceSlice.base a'₀) (EmplaceEmplaceSlice.addr a'₀) (EmplaceEmplaceSlice.size a'₀) (EmplaceEmplaceSlice.len a'₀) (EmplaceEmplaceSlice.cap a'₀) (EmplaceEmplaceSlice.meta_ a'₀) a'₁ (ResultResult.is_ok ok₀) (EmplaceEmplaceSlice.base v₀) (EmplaceEmplaceSlice.addr v₀) (EmplaceEmplaceSlice.size v₀) (EmplaceEmplaceSlice.len v₀) (EmplaceEmplaceSlice.cap v₀) (EmplaceEmplaceSlice.meta_ v₀)))
                                  )
                              )
                
end F
