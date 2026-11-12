import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def ptr_addr_aligned (a'₃₂ : Int) (a'₃₃ : Int) : Prop :=
  ((a'₃₂ % a'₃₃) = 0)


end F
