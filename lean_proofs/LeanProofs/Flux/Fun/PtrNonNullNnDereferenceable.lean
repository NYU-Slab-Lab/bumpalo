import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def ptr_non_null_nn_dereferenceable (a'₆₆ : Int) (a'₆₇ : Int) (a'₆₈ : Int) (a'₆₉ : Int) : Prop :=
  (((a'₆₇ ≥ a'₆₆) ∧ (a'₆₉ ≤ a'₆₈)) ∧ (a'₆₈ ≥ 0))


end F
