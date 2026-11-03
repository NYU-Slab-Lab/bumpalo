import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Fun.Pow2bv
import LeanProofs.Flux.Fun.Pow2
import LeanProofs.Flux.Fun.NumIsizeMAX
open Classical
set_option linter.unusedVariables false


namespace F



def AlignWeaken := 
 ∀ (x₀ : Int),
  ∀ (big₀ : Int),
   ∀ (small₀ : Int),
    (((x₀ % big₀) = 0) ∧ (big₀ > 0) ∧ (pow2 big₀) ∧ (small₀ > 0) ∧ (pow2 small₀) ∧ (small₀ ≤ big₀) ∧ (big₀ ≤ (num_isize_MAX + 1))) ->
     ((x₀ ≥ 0)) ->
      ((big₀ ≥ 0)) ->
       ((small₀ ≥ 0)) ->
        ((x₀ % small₀) = 0)
end F
