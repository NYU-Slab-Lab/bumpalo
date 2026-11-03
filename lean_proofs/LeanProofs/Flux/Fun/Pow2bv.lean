import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def pow2bv (a'₂₅ : BitVec 64) : Prop :=
  ((BitVec.and a'₂₅ (BitVec.sub a'₂₅ (BitVec.ofInt 64 1))) = (BitVec.ofInt 64 0))


end F
