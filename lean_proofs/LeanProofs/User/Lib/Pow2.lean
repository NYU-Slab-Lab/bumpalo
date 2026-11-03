import Std.Tactic.BVDecide

namespace F

/-- On 64-bit values, a power of two (in the `x & (x - 1) == 0` sense) that is at least 16 is a
multiple of 16. -/
theorem pow2bv_ge16_mod16 (b : BitVec 64) (hp : b &&& (b - 1#64) = 0#64) (h16 : 16#64 ≤ b) :
    b % 16#64 = 0#64 := by
  bv_decide

theorem pow2_int_ge16_mod16 (x : Int) (h16 : 16 ≤ x) (hx : x < 2 ^ 64)
    (hp : BitVec.and (BitVec.ofInt 64 x) (BitVec.sub (BitVec.ofInt 64 x) (BitVec.ofInt 64 1))
      = BitVec.ofInt 64 0) :
    x % 16 = 0 := by
  obtain ⟨n, rfl⟩ : ∃ n : Nat, x = n := ⟨x.toNat, by omega⟩
  have hn : n < 2 ^ 64 := by omega
  have hb : BitVec.ofInt 64 (n : Int) = BitVec.ofNat 64 n := by
    apply BitVec.eq_of_toNat_eq; simp
  rw [hb] at hp
  have h := pow2bv_ge16_mod16 (BitVec.ofNat 64 n) (by simpa using hp)
    (by rw [BitVec.le_def]; simp; omega)
  have := congrArg BitVec.toNat h
  simp [BitVec.toNat_umod, Nat.mod_eq_of_lt hn] at this
  omega

end F
