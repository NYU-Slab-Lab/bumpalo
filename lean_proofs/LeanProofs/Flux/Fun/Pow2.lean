import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Fun.Pow2bv
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def pow2 (a'₅ : Int) : Prop :=
  (pow2bv (BitVec.ofInt 64 a'₅))


end F
