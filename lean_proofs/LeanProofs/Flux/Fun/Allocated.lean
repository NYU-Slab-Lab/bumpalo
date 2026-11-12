import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def allocated (a'₂₆ : Int) (a'₂₇ : Int) (a'₂₈ : Int) (a'₂₉ : Int) (a'₃₀ : Int) : Prop :=
  ((((a'₂₇ ≥ a'₂₆) ∧ (a'₂₈ ≥ a'₂₉)) ∧ (a'₂₉ ≥ 0)) ∧ ((a'₂₇ % a'₃₀) = 0))


end F
