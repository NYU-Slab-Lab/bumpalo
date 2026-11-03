import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Fun.AllocLayoutPow2bv
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def alloc_layout_pow2 (a'₁₇ : Int) : Prop :=
  (alloc_layout_pow2bv (BitVec.ofInt 64 a'₁₇))


end F
