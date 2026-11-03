import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def num_wrap_once (a'₅₆ : Int) (a'₅₇ : Int) (a'₅₈ : Int) : Int :=
  (if (a'₅₆ > a'₅₈) then (a'₅₆ - ((a'₅₈ - a'₅₇) + 1)) else (if (a'₅₆ < a'₅₇) then (a'₅₆ + ((a'₅₈ - a'₅₇) + 1)) else a'₅₆))


end F
