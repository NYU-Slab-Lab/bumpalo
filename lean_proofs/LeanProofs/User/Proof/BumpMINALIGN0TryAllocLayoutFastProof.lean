import LeanProofs.Flux.Prelude
import LeanProofs.Flux.VC.BumpMINALIGN0TryAllocLayoutFast
open Classical
set_option linter.unusedVariables false
set_option maxHeartbeats 4000000

namespace F

/-- A power of two in `1..=16` is one of `1, 2, 4, 8, 16`. -/
theorem pow2_le_16 (x : Int) (h0 : 0 < x) (h16 : x ≤ 16)
    (hp : BitVec.and (BitVec.ofInt 64 x) (BitVec.sub (BitVec.ofInt 64 x) (BitVec.ofInt 64 1))
      = BitVec.ofInt 64 0) :
    x = 1 ∨ x = 2 ∨ x = 4 ∨ x = 8 ∨ x = 16 := by
  have : x = 1 ∨ x = 2 ∨ x = 3 ∨ x = 4 ∨ x = 5 ∨ x = 6 ∨ x = 7 ∨ x = 8 ∨ x = 9 ∨ x = 10 ∨
      x = 11 ∨ x = 12 ∨ x = 13 ∨ x = 14 ∨ x = 15 ∨ x = 16 := by omega
  rcases this with h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h <;> subst h <;>
    first | omega | (revert hp; decide)

theorem sub_emod_zero (x y m : Int) (hx : x % m = 0) (hy : y % m = 0) : (x - y) % m = 0 :=
  Int.emod_eq_zero_of_dvd (Int.dvd_sub (Int.dvd_of_emod_eq_zero hx) (Int.dvd_of_emod_eq_zero hy))

theorem ord_lt {x y o : Int}
    (h : (if x < y then CmpOrdering.mkCmpOrdering₀ (-1) else
      if x = y then CmpOrdering.mkCmpOrdering₀ 0 else CmpOrdering.mkCmpOrdering₀ 1)
      = CmpOrdering.mkCmpOrdering₀ o) :
    (o = -1 ∧ x < y) ∨ (o = 0 ∧ x = y) ∨ (o = 1 ∧ y < x) := by
  by_cases h1 : x < y <;> by_cases h2 : x = y <;> simp [h1, h2] at h <;> omega

/-- The bump pointer after an allocation: it stays in the chunk (between `data` and the old
finger), keeps the chunk's base and end, has room for `size` bytes, and is `align`-aligned. -/
def NewFinger (b a s size align fb fa v1a v1s : Int) : Prop :=
  b = fb ∧ fa ≤ a ∧ a ≤ v1a ∧ a + s = v1a + v1s ∧ 0 ≤ size ∧ size ≤ s ∧ a % align = 0

def BumpMINALIGN0TryAllocLayoutFast_proof : BumpMINALIGN0TryAllocLayoutFast := by
  unfold BumpMINALIGN0TryAllocLayoutFast
  refine ⟨True,
    fun a b => a = b,
    fun b a s _ _ _ _ => footer_ptr b a s,
    fun _ _ _ _ _ _ _ _ _ _ _ _ => True,
    fun _ _ _ _ _ _ _ _ _ _ _ _ => True,
    fun _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ => True,
    fun _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ => True,
    fun _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ => True,
    fun r ma size _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ => rounded_up size ma r,
    fun b a s _ _ size align _ _ _ _ fb fa _ _ _ _ v1a v1s _ _ _ =>
      NewFinger b a s size align fb fa v1a v1s,
    -- After each `debug_assert!` in the fast path: the same invariant, unchanged.
    fun _ size align _ _ _ _ fb fa _ _ _ _ v1a v1s _ _ _ b a s _ => NewFinger b a s size align fb fa v1a v1s,
    fun _ size align _ _ _ _ fb fa _ _ _ _ v1a v1s _ _ _ b a s _ => NewFinger b a s size align fb fa v1a v1s,
    fun _ size align _ _ _ _ fb fa _ _ _ _ v1a v1s _ _ _ b a s _ => NewFinger b a s size align fb fa v1a v1s,
    fun _ size align _ _ _ _ fb fa _ _ _ _ v1a v1s _ _ _ b a s _ => NewFinger b a s size align fb fa v1a v1s,
    fun b a s _ _ _ _ _ _ _ _ fb fa fs _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ =>
      bump_finger fb fa fs b a s,
    fun b a s _ _ size align _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ =>
      allocated b a s size align, ?_⟩
  dsimp only
  intro MA hMA0
  refine ⟨trivial, rfl, ?_⟩
  intro size align ⟨hMA, hMApow, hMA16⟩ hsize0 ⟨halign, halignpow⟩ hlay
  refine ⟨?_, ?_, ?_⟩
  · intro v0 hv0; exact ⟨hv0, fun _ => trivial⟩
  · intro a4 h; exact h
  intro fp hfp hfpi
  refine ⟨?_, fun _ _ => trivial, ?_⟩
  · simp only [footer_ptr, allocated, ptr_non_null_nn_valid, ptr_non_null_nn_dereferenceable,
      ptr_non_null_nn_aligned_to] at *
    omega
  intro f _ hfs48 _ _ _ v1 ⟨hbf, hv1MA⟩ hv1i _ _ _ hfi _ _ _ a9 _ _ _ _
  -- The `debug_assert!`s on the finger: nothing to carry.
  refine ⟨fun _ => trivial, fun _ => ⟨fun _ _ _ _ => trivial, fun _ => ⟨trivial, fun _ => ?_⟩⟩⟩
  intro _ _ a10 _ ha10
  simp only [CHUNK_ALIGN] at hMA16
  subst ha10
  simp only [bump_finger] at hbf
  refine ⟨?_, ?_, ?_, ?_⟩
  -- `align < MIN_ALIGN`: bump down by `size` rounded up to `MIN_ALIGN`.
  · intro hord
    have hlt : align < a10 := by rcases ord_lt hord with h|h|h <;> omega
    refine ⟨fun r hr => hr, ?_⟩
    intro _ a12 ha12r _
    refine ⟨by omega, ?_⟩
    intro hcap ap0 hwrap _ _ _ _
    simp only [ptr_is_wrapping_offset, num_usize_MAX, rounded_up] at hwrap ha12r
    obtain ⟨⟨hb0, hend0⟩, ha0⟩ := hwrap
    have hsub : ap0.fld₁ = v1.addr - a12 := by omega
    refine ⟨by omega, by omega, by omega, by omega, by omega, by omega, ?_⟩
    rw [hsub]
    have hMAc := pow2_le_16 a10 hMA hMA16 hMApow
    have halc := pow2_le_16 align halign (by omega) halignpow
    obtain ⟨_, hr⟩ := ha12r
    rcases hMAc with h|h|h|h|h <;> rcases halc with h'|h'|h'|h'|h' <;> subst h h' <;> omega
  -- `align == MIN_ALIGN`: bump down by `size` rounded up to `align`.
  · intro hord
    have heq : align = a10 := by rcases ord_lt hord with h|h|h <;> omega
    subst heq
    refine ⟨⟨halignpow, by simp only [can_round_up, num_usize_MAX, num_isize_MAX] at *; omega⟩, ?_⟩
    intro as0 has0 _
    refine ⟨by omega, ?_⟩
    intro hcap ap1 hwrap _ _ _ _
    simp only [ptr_is_wrapping_offset, num_usize_MAX, rounded_up] at hwrap has0
    obtain ⟨⟨hb1, hend1⟩, ha1⟩ := hwrap
    have hsub : ap1.fld₁ = v1.addr - as0 := by omega
    refine ⟨by omega, by omega, by omega, by omega, by omega, by omega, ?_⟩
    rw [hsub]
    exact sub_emod_zero _ _ _ hv1MA has0.2
  -- `align > MIN_ALIGN`: round the finger down to `align`, then bump down.
  · intro hord
    have hgt : a10 < align := by rcases ord_lt hord with h|h|h <;> omega
    refine ⟨⟨halignpow, by simp only [can_round_up, num_usize_MAX, num_isize_MAX] at *; omega⟩, ?_⟩
    intro as1 has1 _
    refine ⟨halignpow, ?_⟩
    intro ap2 ⟨hb2, hrd, hend2⟩ _ _ _ _ _ hge hcap ap3 hwrap _ _ _ _
    simp only [ptr_is_wrapping_offset, num_usize_MAX, rounded_up, rounded_down,
      num_wrap_once] at hwrap has1 hrd hcap
    obtain ⟨⟨hb3, hend3⟩, ha3⟩ := hwrap
    have hsub : ap3.fld₁ = ap2.fld₁ - as1 := by
      split at hcap <;> (try split at hcap) <;> omega
    refine ⟨by omega, by omega, by omega, by omega, by omega, ?_, ?_⟩
    · split at hcap <;> (try split at hcap) <;> omega
    rw [hsub]
    exact sub_emod_zero _ _ _ hrd.2 has1.2
  -- After the `match`: store the new finger and return it.
  · intro ap4 a20 hk0
    -- The `debug_assert!`s after the `match`: their facts (`fun _ =>`) are never used.
    refine ⟨⟨halignpow, fun _ => hk0⟩, fun hk5 => ⟨fun _ => hk5, fun hk29 =>
      ⟨fun _ _ => hk29, fun hk14 => ⟨fun _ => hk14, fun hk34 => ?_⟩⟩⟩⟩
    obtain ⟨hb, hlo, hhi, hend, hsz0, hsz, hal⟩ := hk34
    refine ⟨by omega, ?_⟩
    intro ap5 ⟨e0, e1, e2⟩ _
    refine ⟨fun _ h => h, fun _ h => h, ?_, ?_, fun _ h => h⟩
    · simp only [bump_finger]; omega
    · simp only [allocated]
      refine ⟨⟨⟨by omega, by omega⟩, by omega⟩, by rw [e1]; exact hal⟩

end F
