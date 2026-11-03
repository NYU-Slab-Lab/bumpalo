import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Struct.Tupleₓ₃
import LeanProofs.Flux.Struct.Tupleₓ₃
import LeanProofs.Flux.Fun.NumUsizeMAX
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def ptr_is_wrapping_offset (a'₄₉ : (Tupleₓ₃ Int Int Int)) (a'₅₀ : Int) (a'₅₁ : Int) (a'₅₂ : (Tupleₓ₃ Int Int Int)) : Prop :=
  ((((Tupleₓ₃.fld₀ a'₅₂) = (Tupleₓ₃.fld₀ a'₄₉)) ∧ (((Tupleₓ₃.fld₁ a'₅₂) + (Tupleₓ₃.fld₂ a'₅₂)) = ((Tupleₓ₃.fld₁ a'₄₉) + (Tupleₓ₃.fld₂ a'₄₉)))) ∧ ((Tupleₓ₃.fld₁ a'₅₂) = (((Tupleₓ₃.fld₁ a'₄₉) + (a'₅₀ * a'₅₁)) % (num_usize_MAX + 1))))


end F
