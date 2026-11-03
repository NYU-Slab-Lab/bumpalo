import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Fun.PtrNonNullNnDereferenceable
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def ptr_non_null_nn_valid (a'₃₂ : Int) (a'₃₃ : Int) (a'₃₄ : Int) (a'₃₅ : Int) : Prop :=
  ((a'₃₅ = 0) ∨ (ptr_non_null_nn_dereferenceable a'₃₂ a'₃₃ a'₃₄ a'₃₅))


end F
