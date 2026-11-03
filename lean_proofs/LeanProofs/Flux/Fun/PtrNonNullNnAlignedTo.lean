import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def ptr_non_null_nn_aligned_to (a'₃₆ : Int) (a'₃₇ : Int) : Prop :=
  ((a'₃₆ % a'₃₇) = 0)


end F
