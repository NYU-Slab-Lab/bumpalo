import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def rounded_up (a'₂₀ : Int) (a'₂₁ : Int) (a'₂₂ : Int) : Prop :=
  (((a'₂₀ ≤ a'₂₂) ∧ (a'₂₂ ≤ ((a'₂₀ + a'₂₁) - 1))) ∧ ((a'₂₂ % a'₂₁) = 0))


end F
