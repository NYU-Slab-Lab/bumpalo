import LeanProofs.Flux.Prelude
import LeanProofs.Flux.VC.AlignWeaken
import LeanProofs.User.Lib.Pow2
open Classical
set_option linter.unusedVariables false

namespace F

def AlignWeaken_proof : AlignWeaken := by
  unfold AlignWeaken
  intro x big small ⟨hx, hb0, hpb, hs0, hps, hle, hbmax⟩ _ _ _
  have hdiv : big % small = 0 := by
    unfold pow2 pow2bv at hpb hps
    simp only [num_isize_MAX] at hbmax
    exact pow2_int_dvd small big hs0 hle (by omega) hps hpb
  exact Int.emod_eq_zero_of_dvd
    (Int.dvd_trans (Int.dvd_of_emod_eq_zero hdiv) (Int.dvd_of_emod_eq_zero hx))

end F
