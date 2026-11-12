import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Struct.Tupleₓ₃
import LeanProofs.Flux.Fun.PtrDereferenceable
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def ptr_in_bounds (a'₃₁ : (Tupleₓ₃ Int Int Int)) : Prop :=
  (ptr_dereferenceable a'₃₁ 0)


end F
