import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def allocated (a'₅₉ : Int) (a'₆₀ : Int) (a'₆₁ : Int) (a'₆₂ : Int) (a'₆₃ : Int) : Prop :=
  ((((a'₆₀ ≥ a'₅₉) ∧ (a'₆₁ ≥ a'₆₂)) ∧ (a'₆₂ ≥ 0)) ∧ ((a'₆₀ % a'₆₃) = 0))


end F
