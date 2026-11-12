import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Struct.Tupleₓ₃
import LeanProofs.Flux.Fun.PtrValidNoZst
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def ptr_valid (a'₃₄ : (Tupleₓ₃ Int Int Int)) (a'₃₅ : Int) : Prop :=
  ((a'₃₅ = 0) ∨ (ptr_valid_no_zst a'₃₄ a'₃₅))


end F
