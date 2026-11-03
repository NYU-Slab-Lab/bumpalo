import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Struct.PtrNonNullNonNull
import LeanProofs.Flux.Fun.NumUsizeMAX
open Classical
set_option linter.unusedVariables false


namespace F



def PtrAlignAdd := 
 ∀ (p₀ : PtrNonNullNonNull),
  ∀ (align₀ : Int),
   ∀ (d₀ : Int),
    ((((PtrNonNullNonNull.addr p₀) % align₀) = 0) ∧ ((d₀ % align₀) = 0) ∧ (align₀ > 0)) ->
     (((PtrNonNullNonNull.base p₀) ≥ 0) ∧ ((PtrNonNullNonNull.addr p₀) > 0) ∧ ((PtrNonNullNonNull.addr p₀) ≤ num_usize_MAX) ∧ (((PtrNonNullNonNull.addr p₀) + (PtrNonNullNonNull.size p₀)) ≤ num_usize_MAX) ∧ ((PtrNonNullNonNull.meta_ p₀) ≥ 0)) ->
      ((d₀ ≥ 0)) ->
       ((align₀ ≥ 0)) ->
        ((((PtrNonNullNonNull.addr p₀) + d₀) % align₀) = 0)
end F
