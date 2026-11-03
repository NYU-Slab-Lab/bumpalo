import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def rounded_down (a'₅₃ : Int) (a'₅₄ : Int) (a'₅₅ : Int) : Prop :=
  (((a'₅₅ ≤ a'₅₃) ∧ (a'₅₃ ≤ ((a'₅₅ + a'₅₄) - 1))) ∧ ((a'₅₅ % a'₅₄) = 0))


end F
