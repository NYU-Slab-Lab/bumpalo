import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Struct.Tupleₓ₃
import LeanProofs.Flux.Fun.PtrAddrAligned
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def ptr_aligned_to (a'₃₆ : (Tupleₓ₃ Int Int Int)) (a'₃₇ : Int) : Prop :=
  (ptr_addr_aligned (Tupleₓ₃.fld₁ a'₃₆) a'₃₇)


end F
