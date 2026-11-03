import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def bump_finger (a'₃₈ : Int) (a'₃₉ : Int) (a'₄₀ : Int) (a'₄₁ : Int) (a'₄₂ : Int) (a'₄₃ : Int) : Prop :=
  ((((a'₄₁ = a'₃₈) ∧ (a'₃₉ ≤ a'₄₂)) ∧ (a'₄₂ ≤ ((a'₃₉ + a'₄₀) - 48))) ∧ ((a'₄₂ + a'₄₃) = (a'₃₉ + a'₄₀)))


end F
