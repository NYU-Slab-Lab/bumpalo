import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Fun.NumUsizeMAX
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def can_round_up (a'₂₃ : Int) (a'₂₄ : Int) : Prop :=
  (((a'₂₃ + a'₂₄) - 1) ≤ num_usize_MAX)


end F
