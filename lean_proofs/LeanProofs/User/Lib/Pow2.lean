import Std.Tactic.BVDecide

/-!
Facts about powers of two, in flux's sense: `pow2 x` is `x & (x - 1) == 0` on 64-bit values.
The bit-level facts are proved with `bv_decide`; the `Int` versions move them to the integer
arithmetic of flux's verification conditions.
-/

namespace F

/-- On 64-bit values, a power of two that is at least 16 is a multiple of 16. -/
theorem pow2bv_ge16_mod16 (b : BitVec 64) (hp : b &&& (b - 1#64) = 0#64) (h16 : 16#64 ≤ b) :
    b % 16#64 = 0#64 := by
  bv_decide

/-- On 64-bit values, a power of two divides any larger power of two. -/
theorem pow2bv_dvd (s b : BitVec 64) (hs : s &&& (s - 1#64) = 0#64) (hb : b &&& (b - 1#64) = 0#64)
    (h0 : 0#64 < s) (hle : s ≤ b) : b % s = 0#64 := by
  bv_decide

theorem ofInt_natCast (n : Nat) (hn : n < 2 ^ 64) : BitVec.ofInt 64 (n : Int) = BitVec.ofNat 64 n := by
  apply BitVec.eq_of_toNat_eq; simp

theorem pow2_int_ge16_mod16 (x : Int) (h16 : 16 ≤ x) (hx : x < 2 ^ 64)
    (hp : BitVec.and (BitVec.ofInt 64 x) (BitVec.sub (BitVec.ofInt 64 x) (BitVec.ofInt 64 1))
      = BitVec.ofInt 64 0) :
    x % 16 = 0 := by
  obtain ⟨n, rfl⟩ : ∃ n : Nat, x = n := ⟨x.toNat, by omega⟩
  have hn : n < 2 ^ 64 := by omega
  rw [ofInt_natCast n hn] at hp
  have h := pow2bv_ge16_mod16 (BitVec.ofNat 64 n) (by simpa using hp)
    (by rw [BitVec.le_def]; simp; omega)
  have := congrArg BitVec.toNat h
  simp [BitVec.toNat_umod, Nat.mod_eq_of_lt hn] at this
  omega

/-- A power of two `s` divides any power of two `b` with `s ≤ b < 2^64`. -/
theorem pow2_int_dvd (s b : Int) (h0 : 0 < s) (hle : s ≤ b) (hb : b < 2 ^ 64)
    (hs : BitVec.and (BitVec.ofInt 64 s) (BitVec.sub (BitVec.ofInt 64 s) (BitVec.ofInt 64 1))
      = BitVec.ofInt 64 0)
    (hp : BitVec.and (BitVec.ofInt 64 b) (BitVec.sub (BitVec.ofInt 64 b) (BitVec.ofInt 64 1))
      = BitVec.ofInt 64 0) :
    b % s = 0 := by
  obtain ⟨m, rfl⟩ : ∃ m : Nat, s = m := ⟨s.toNat, by omega⟩
  obtain ⟨n, rfl⟩ : ∃ n : Nat, b = n := ⟨b.toNat, by omega⟩
  have hn : n < 2 ^ 64 := by omega
  have hm : m < 2 ^ 64 := by omega
  rw [ofInt_natCast m hm] at hs
  rw [ofInt_natCast n hn] at hp
  have h := pow2bv_dvd (BitVec.ofNat 64 m) (BitVec.ofNat 64 n) (by simpa using hs) (by simpa using hp)
    (by rw [BitVec.lt_def]; simp; omega) (by rw [BitVec.le_def]; simp; omega)
  have := congrArg BitVec.toNat h
  simp [BitVec.toNat_umod, Nat.mod_eq_of_lt hn, Nat.mod_eq_of_lt hm] at this
  omega

end F
