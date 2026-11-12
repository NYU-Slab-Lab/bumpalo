import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Struct.Tupleₓ₃
import LeanProofs.Flux.Fun.PtrDereferenceable
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def ptr_valid_no_zst (a'₄₁ : (Tupleₓ₃ Int Int Int)) (a'₄₂ : Int) : Prop :=
  (((Tupleₓ₃.fld₁ a'₄₁) ≠ 0) ∧ (ptr_dereferenceable a'₄₁ a'₄₂))


end F
