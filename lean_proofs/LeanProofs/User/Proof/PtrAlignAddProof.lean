import LeanProofs.Flux.Prelude
import LeanProofs.Flux.VC.PtrAlignAdd
import LeanProofs.User.Lib.Pow2
open Classical
set_option linter.unusedVariables false

namespace F

def PtrAlignAdd_proof : PtrAlignAdd := by
  unfold PtrAlignAdd
  intro p align d ⟨ha, hd, _⟩ _ _ _
  exact Int.emod_eq_zero_of_dvd
    (Int.dvd_add (Int.dvd_of_emod_eq_zero ha) (Int.dvd_of_emod_eq_zero hd))

end F
