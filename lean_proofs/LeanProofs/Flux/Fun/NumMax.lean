import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def num_max (a'₁₈ : Int) (a'₁₉ : Int) : Int :=
  (if (a'₁₈ > a'₁₉) then a'₁₈ else a'₁₉)


end F
