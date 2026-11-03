import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def alloc_layout_pow2bv (a'₂₆ : BitVec 64) : Prop :=
  ((BitVec.and a'₂₆ (BitVec.sub a'₂₆ (BitVec.ofInt 64 1))) = (BitVec.ofInt 64 0))


end F
