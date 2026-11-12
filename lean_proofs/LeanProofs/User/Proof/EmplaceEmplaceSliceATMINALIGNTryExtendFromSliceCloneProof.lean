import LeanProofs.Flux.Prelude
import LeanProofs.Flux.VC.EmplaceEmplaceSliceATMINALIGNTryExtendFromSliceClone
open Classical
set_option linter.unusedVariables false


namespace F

/-
`EmplaceSlice::try_extend_from_slice_clone` (src/emplace.rs).
  `c1` = `size_of::<T>()`, `c2` = `align_of::<T>()`.
  k0 (the `for val in src.iter().cloned()` loop), over the iterator's `idx`/`len = n` and the
  slice's indices: `idx ≤ n`, `len + n - idx ≤ cap` (what was pushed plus what is left fits),
  and the `EmplaceSlice` invariants, which the loop must carry since `self` is rebuilt each step.
  The only nonlinear step: from `len + 1 ≤ cap` and `0 ≤ cap * c1` get `0 ≤ c1`, then
  `len * c1 + c1 ≤ cap * c1 ≤ size`.
-/
def EmplaceEmplaceSliceATMINALIGNTryExtendFromSliceClone_proof : EmplaceEmplaceSliceATMINALIGNTryExtendFromSliceClone := by
  unfold EmplaceEmplaceSliceATMINALIGNTryExtendFromSliceClone
  intro c1 c2
  refine ⟨fun idx n base addr size len cap _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ =>
      idx ≤ n ∧ len + n - idx ≤ cap ∧ valid_array_layout cap c1 c2 ∧
      addr > 0 ∧ allocated base addr size (cap * c1) c2, ?_⟩
  intro M hM a0 hval0 hinv0 hlen0 n hn ok v0 hv hvval hvinv hvle hcf
  obtain ⟨hvlen, hok⟩ := hv
  obtain ⟨hvaddr, hvalloc⟩ := hvinv
  have hok' : ResultResult.is_ok ok := by
    injection hcf with h
    exact of_eq_true h
  refine ⟨?_, ?_⟩
  · -- loop entry: nothing pushed yet, and `try_reserve_exact` gave `cap ≥ len + n`
    have := hok hok'
    exact ⟨by omega, by omega, hvval, hvaddr, hvalloc⟩
  · intro iter a5 hk next hnext hsome a7 hb ha hamax hasz halloc0 hlen hcap
    obtain ⟨hidx, hfit, hval, haddr, halloc⟩ := hk
    obtain ⟨hnlen, hnidx⟩ := hnext
    have hlt : SliceIterIter.idx (IterAdaptersClonedCloned.inner iter) <
        SliceIterIter.len (IterAdaptersClonedCloned.inner iter) := by
      injection hsome with h
      have := of_eq_true h
      omega
    rw [if_pos hlt] at hnidx
    -- unpack `allocated base addr size (cap * c1) c2`
    unfold allocated at halloc
    obtain ⟨⟨⟨hab, hsz⟩, hcapc⟩, hal⟩ := halloc
    have hcap1 : a5.len + 1 ≤ a5.cap := by omega
    -- 0 ≤ c1, since cap ≥ 1 and cap * c1 ≥ 0
    have hc1 : 0 ≤ c1 := by
      apply Classical.byContradiction
      intro hneg
      have : a5.cap * c1 < 0 :=
        Int.mul_neg_of_pos_of_neg (by omega) (by omega)
      omega
    -- len * c1 + c1 ≤ cap * c1
    have hmul : (a5.len + 1) * c1 ≤ a5.cap * c1 :=
      Int.mul_le_mul_of_nonneg_right hcap1 hc1
    have hlc : 0 ≤ a5.len * c1 := Int.mul_nonneg hlen hc1
    rw [Int.add_mul, Int.one_mul] at hmul
    have halloc' : allocated a5.base a5.addr a5.size (a5.cap * c1) c2 := by
      unfold allocated; exact ⟨⟨⟨hab, hsz⟩, hcapc⟩, hal⟩
    refine ⟨?_, ?_⟩
    · -- `base_ptr().add(len)` stays in bounds
      right
      unfold ptr_in_bounds ptr_dereferenceable
      simp only
      omega
    · intro hal' _ _ _
      refine ⟨⟨?_, hal' (by unfold ptr_addr_aligned; exact hal)⟩, hval, ⟨haddr, halloc'⟩, hcap1,
        by omega, by omega, hval, haddr, halloc'⟩
      -- `ptr::write` needs the slot to be valid for `size_of::<T>()` bytes
      unfold ptr_valid ptr_valid_no_zst ptr_dereferenceable
      right
      simp only
      omega

end F
