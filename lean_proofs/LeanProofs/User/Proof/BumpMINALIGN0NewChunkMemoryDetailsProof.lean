import LeanProofs.Flux.Prelude
import LeanProofs.Flux.VC.BumpMINALIGN0NewChunkMemoryDetails
import LeanProofs.User.Lib.Pow2
open Classical
set_option linter.unusedVariables false

namespace F

/-- The chunk alignment `max(max(16, MIN_ALIGN), align)` is one of the three, and at least `16`
and `align`. -/
theorem chunk_align_cases (ma al : Int) :
    (num_max (num_max 16 ma) al = 16 ∨ num_max (num_max 16 ma) al = ma ∨
      num_max (num_max 16 ma) al = al) ∧
    16 ≤ num_max (num_max 16 ma) al ∧ al ≤ num_max (num_max 16 ma) al := by
  unfold num_max
  by_cases h1 : (16 : Int) > ma
  · rw [if_pos h1]
    by_cases h2 : (16 : Int) > al
    · rw [if_pos h2]; omega
    · rw [if_neg h2]; omega
  · rw [if_neg h1]
    by_cases h2 : ma > al
    · rw [if_pos h2]; omega
    · rw [if_neg h2]; omega

def BumpMINALIGN0NewChunkMemoryDetails_proof : BumpMINALIGN0NewChunkMemoryDetails := by
  unfold BumpMINALIGN0NewChunkMemoryDetails
  refine ⟨True, fun a _ => a = 0, True, fun a _ => a = 0,
    fun _ _ _ _ _ => True,
    fun _ _ _ _ _ _ => True,
    fun r _ _ _ _ ns1 rs => rounded_up (num_max ns1 rs + 64) 4096 r,
    fun p _ _ _ _ _ _ => p % 16 = 0 ∧ p ≥ 0,
    -- After each `debug_assert_eq!`: the same facts about the payload, unchanged.
    fun _ _ _ _ _ _ p => p % 16 = 0 ∧ p ≥ 0,
    fun _ _ _ _ _ _ p => p % 16 = 0 ∧ p ≥ 0,
    fun s _ _ _ _ _ _ p => s = p + 48, ?_⟩
  dsimp only
  intro MA _
  refine ⟨trivial, rfl, trivial, rfl, ?_⟩
  intro ⟨hMA, hMApow, hMA16⟩ ns0 lay ⟨hal, halpow⟩ hlay _ _ _
  simp only [CHUNK_ALIGN] at hMA16
  obtain ⟨hA, hA16, hAal⟩ := chunk_align_cases MA lay.align
  have hApow : pow2 (num_max (num_max 16 MA) lay.align) := by
    rcases hA with h|h|h <;> rw [h]
    · unfold pow2 pow2bv; decide
    · exact hMApow
    · exact halpow
  refine ⟨fun _ => trivial, trivial, ?_⟩
  intro ns1 _ hns1 hsize
  refine ⟨⟨by omega, hApow⟩, fun _ _ => trivial, ?_⟩
  intro rs _ hrs hmax
  have hmax1 : ns1 ≤ num_max ns1 rs ∧ rs ≤ num_max ns1 rs := by
    unfold num_max; split <;> omega
  refine ⟨?_, ?_, ?_⟩
  -- Large chunks: round `size + OVERHEAD` up to a page.
  · intro hge
    refine ⟨by unfold pow2 pow2bv; decide, fun r h => h, ?_⟩
    intro _ a7 hk4 _
    simp only [rounded_up] at hk4
    exact ⟨by omega, by omega, by omega⟩
  -- Small chunks: round `size + OVERHEAD` up to a power of two.
  · intro hlt
    refine ⟨by omega, ?_⟩
    intro r0 ⟨hge, hp, hlt2⟩ _
    unfold pow2 pow2bv at hp
    have := pow2_int_ge16_mod16 r0 (by omega) (by omega) hp
    exact ⟨by omega, by omega, by omega⟩
  -- Build the result.
  · intro ns2 hk0
    -- The `debug_assert_eq!`s: their facts (`_`) are never used.
    refine ⟨fun _ _ _ _ _ => hk0, fun hk2 => ⟨fun _ _ _ _ _ => hk2, fun hk1 => ?_⟩⟩
    obtain ⟨hmod, hnn⟩ := hk1
    refine ⟨fun _ h => h, ?_⟩
    intro size hk10 _
    have hAmod : num_max (num_max 16 MA) lay.align % 16 = 0 := by
      have hp := hApow
      unfold pow2 pow2bv at hp
      exact pow2_int_ge16_mod16 _ hA16
        (by rcases hA with h|h|h <;> rw [h] <;> simp only [num_isize_MAX] at hlay <;> omega) hp
    exact ⟨hk10, by omega, hAmod, hmod, hnn⟩

end F
