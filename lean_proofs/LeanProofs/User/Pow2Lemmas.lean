import LeanProofs.Flux.Fun.AllocLayoutPow2
import LeanProofs.Flux.Fun.Pow2
open Classical
set_option linter.unusedVariables false

namespace F

/-- Every `alloc_layout_pow2` value is `2 ^ k`. -/
theorem alp_exp {x : Int} (hx : alloc_layout_pow2 x) : ∃ k : Nat, x = ((2 ^ k : Nat) : Int) := by
  unfold alloc_layout_pow2 at hx
  rcases hx with (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((hx | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx) | hx)
  · exact ⟨0, by subst_vars; rfl⟩
  · exact ⟨1, by subst_vars; rfl⟩
  · exact ⟨2, by subst_vars; rfl⟩
  · exact ⟨3, by subst_vars; rfl⟩
  · exact ⟨4, by subst_vars; rfl⟩
  · exact ⟨5, by subst_vars; rfl⟩
  · exact ⟨6, by subst_vars; rfl⟩
  · exact ⟨7, by subst_vars; rfl⟩
  · exact ⟨8, by subst_vars; rfl⟩
  · exact ⟨9, by subst_vars; rfl⟩
  · exact ⟨10, by subst_vars; rfl⟩
  · exact ⟨11, by subst_vars; rfl⟩
  · exact ⟨12, by subst_vars; rfl⟩
  · exact ⟨13, by subst_vars; rfl⟩
  · exact ⟨14, by subst_vars; rfl⟩
  · exact ⟨15, by subst_vars; rfl⟩
  · exact ⟨16, by subst_vars; rfl⟩
  · exact ⟨17, by subst_vars; rfl⟩
  · exact ⟨18, by subst_vars; rfl⟩
  · exact ⟨19, by subst_vars; rfl⟩
  · exact ⟨20, by subst_vars; rfl⟩
  · exact ⟨21, by subst_vars; rfl⟩
  · exact ⟨22, by subst_vars; rfl⟩
  · exact ⟨23, by subst_vars; rfl⟩
  · exact ⟨24, by subst_vars; rfl⟩
  · exact ⟨25, by subst_vars; rfl⟩
  · exact ⟨26, by subst_vars; rfl⟩
  · exact ⟨27, by subst_vars; rfl⟩
  · exact ⟨28, by subst_vars; rfl⟩
  · exact ⟨29, by subst_vars; rfl⟩
  · exact ⟨30, by subst_vars; rfl⟩
  · exact ⟨31, by subst_vars; rfl⟩
  · exact ⟨32, by subst_vars; rfl⟩
  · exact ⟨33, by subst_vars; rfl⟩
  · exact ⟨34, by subst_vars; rfl⟩
  · exact ⟨35, by subst_vars; rfl⟩
  · exact ⟨36, by subst_vars; rfl⟩
  · exact ⟨37, by subst_vars; rfl⟩
  · exact ⟨38, by subst_vars; rfl⟩
  · exact ⟨39, by subst_vars; rfl⟩
  · exact ⟨40, by subst_vars; rfl⟩
  · exact ⟨41, by subst_vars; rfl⟩
  · exact ⟨42, by subst_vars; rfl⟩
  · exact ⟨43, by subst_vars; rfl⟩
  · exact ⟨44, by subst_vars; rfl⟩
  · exact ⟨45, by subst_vars; rfl⟩
  · exact ⟨46, by subst_vars; rfl⟩
  · exact ⟨47, by subst_vars; rfl⟩
  · exact ⟨48, by subst_vars; rfl⟩
  · exact ⟨49, by subst_vars; rfl⟩
  · exact ⟨50, by subst_vars; rfl⟩
  · exact ⟨51, by subst_vars; rfl⟩
  · exact ⟨52, by subst_vars; rfl⟩
  · exact ⟨53, by subst_vars; rfl⟩
  · exact ⟨54, by subst_vars; rfl⟩
  · exact ⟨55, by subst_vars; rfl⟩
  · exact ⟨56, by subst_vars; rfl⟩
  · exact ⟨57, by subst_vars; rfl⟩
  · exact ⟨58, by subst_vars; rfl⟩
  · exact ⟨59, by subst_vars; rfl⟩
  · exact ⟨60, by subst_vars; rfl⟩
  · exact ⟨61, by subst_vars; rfl⟩
  · exact ⟨62, by subst_vars; rfl⟩
  · exact ⟨63, by subst_vars; rfl⟩

/-- For powers of two, the smaller divides the larger. -/
theorem alp_mod_of_le {x y : Int} (hx : alloc_layout_pow2 x) (hy : alloc_layout_pow2 y)
    (hle : y ≤ x) : x % y = 0 := by
  obtain ⟨i, rfl⟩ := alp_exp hx
  obtain ⟨j, rfl⟩ := alp_exp hy
  have hji : j ≤ i := (Nat.pow_le_pow_iff_right (by decide : 1 < 2)).mp (by omega)
  exact Int.emod_eq_zero_of_dvd (Int.natCast_dvd_natCast.mpr (Nat.pow_dvd_pow 2 hji))

/-- An address aligned to `oa` is aligned to any smaller power of two `na`. -/
theorem aligned_weaken {a oa na : Int} (hoa : alloc_layout_pow2 oa) (hna : alloc_layout_pow2 na)
    (hle : na ≤ oa) (ha : a % oa = 0) : a % na = 0 := by
  have h1 : na ∣ oa := Int.dvd_of_emod_eq_zero (alp_mod_of_le hoa hna hle)
  have h2 : oa ∣ a := Int.dvd_of_emod_eq_zero ha
  exact Int.emod_eq_zero_of_dvd (Int.dvd_trans h1 h2)

/-- `pow2` (from `defs!`) and `alloc_layout_pow2` (flux-core's `Layout` invariant) are the same
predicate. -/
theorem pow2_iff_alp {x : Int} : pow2 x ↔ alloc_layout_pow2 x := by
  unfold pow2 alloc_layout_pow2; exact Iff.rfl

/-- Multiples of `m` are closed under addition. -/
theorem emod_add_eq_zero {x y m : Int} (hx : x % m = 0) (hy : y % m = 0) : (x + y) % m = 0 :=
  Int.emod_eq_zero_of_dvd (Int.dvd_add (Int.dvd_of_emod_eq_zero hx) (Int.dvd_of_emod_eq_zero hy))

end F
