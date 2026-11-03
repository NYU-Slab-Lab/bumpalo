import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Struct.PtrNonNullNonNull
import LeanProofs.Flux.Fun.Pow2bv
import LeanProofs.Flux.Fun.Pow2
import LeanProofs.Flux.Fun.NumIsizeMAX
import LeanProofs.Flux.Fun.NumUsizeMAX
open Classical
set_option linter.unusedVariables false


namespace F



def PtrAlignWeaken := 
 ∀ (p₀ : PtrNonNullNonNull),
  ∀ (big₀ : Int),
   ∀ (small₀ : Int),
    ((((PtrNonNullNonNull.addr p₀) % big₀) = 0) ∧ (big₀ > 0) ∧ (pow2 big₀) ∧ (small₀ > 0) ∧ (pow2 small₀) ∧ (small₀ ≤ big₀) ∧ (big₀ ≤ (num_isize_MAX + 1))) ->
     (((PtrNonNullNonNull.base p₀) ≥ 0) ∧ ((PtrNonNullNonNull.addr p₀) > 0) ∧ ((PtrNonNullNonNull.addr p₀) ≤ num_usize_MAX) ∧ (((PtrNonNullNonNull.addr p₀) + (PtrNonNullNonNull.size p₀)) ≤ num_usize_MAX) ∧ ((PtrNonNullNonNull.meta_ p₀) ≥ 0)) ->
      ((big₀ ≥ 0)) ->
       ((small₀ ≥ 0)) ->
        (((PtrNonNullNonNull.addr p₀) % small₀) = 0)
end F
