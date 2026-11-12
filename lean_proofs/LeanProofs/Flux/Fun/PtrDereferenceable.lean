import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Struct.Tupleₓ₃
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def ptr_dereferenceable (a'₃₉ : (Tupleₓ₃ Int Int Int)) (a'₄₀ : Int) : Prop :=
  ((((Tupleₓ₃.fld₁ a'₃₉) ≥ (Tupleₓ₃.fld₀ a'₃₉)) ∧ (a'₄₀ ≤ (Tupleₓ₃.fld₂ a'₃₉))) ∧ ((Tupleₓ₃.fld₂ a'₃₉) ≥ 0))


end F
