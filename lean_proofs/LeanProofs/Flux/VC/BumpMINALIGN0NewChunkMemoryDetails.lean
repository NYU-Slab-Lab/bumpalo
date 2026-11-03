import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Struct.AllocLayoutLayout
import LeanProofs.Flux.Struct.OptionOption
import LeanProofs.Flux.Struct.OpsControlFlowControlFlow
import LeanProofs.Flux.Fun.NumMax
import LeanProofs.Flux.Fun.AllocLayoutPow2bv
import LeanProofs.Flux.Fun.AllocLayoutPow2
import LeanProofs.Flux.Fun.Pow2bv
import LeanProofs.Flux.Fun.CanRoundUp
import LeanProofs.Flux.Fun.RoundedUp
import LeanProofs.Flux.Fun.Pow2
import LeanProofs.Flux.Fun.CHUNKALIGN
import LeanProofs.Flux.Fun.NumIsizeMAX
import LeanProofs.Flux.Fun.NumUsizeMAX
open Classical
set_option linter.unusedVariables false


namespace F



def BumpMINALIGN0NewChunkMemoryDetails := ∃ k3 : Prop, ∃ k4 : (a0 : Int) -> (a1 : Int) -> Prop, ∃ k5 : Prop, ∃ k6 : (a0 : Int) -> (a1 : Int) -> Prop, ∃ k7 : (a0 : Int) -> (a1 : Int) -> (a2 : Prop) -> (a3 : Int) -> (a4 : Int) -> Prop, ∃ k8 : (a0 : Int) -> (a1 : Int) -> (a2 : Prop) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> Prop, ∃ k10 : (a0 : Int) -> (a1 : Int) -> (a2 : Prop) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> Prop, ∃ k0 : (a0 : Int) -> (a1 : Int) -> (a2 : Prop) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> Prop, ∃ k2 : (a0 : Int) -> (a1 : Prop) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> Prop, ∃ k1 : (a0 : Int) -> (a1 : Prop) -> (a2 : Int) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> Prop, ∃ k18 : (a0 : Int) -> (a1 : Int) -> (a2 : Prop) -> (a3 : Int) -> (a4 : Int) -> (a5 : Int) -> (a6 : Int) -> (a7 : Int) -> Prop, 
 ∀ (constgen_MIN_ALIGN_0 : Int),
  ((constgen_MIN_ALIGN_0 ≥ 0)) ->
   ((k3)) ∧
   ((k4 0 constgen_MIN_ALIGN_0)) ∧
   ((k5)) ∧
   ((k6 0 constgen_MIN_ALIGN_0)) ∧
   (((constgen_MIN_ALIGN_0 > 0) ∧ (pow2 constgen_MIN_ALIGN_0) ∧ (constgen_MIN_ALIGN_0 ≤ CHUNK_ALIGN)) ->
    ∀ (new_size_without_footer₀ : OptionOption),
     ∀ (requested_layout₀ : AllocLayoutLayout),
      (((AllocLayoutLayout.size requested_layout₀) ≥ 0)) ->
       (((AllocLayoutLayout.align requested_layout₀) > 0) ∧ (alloc_layout_pow2 (AllocLayoutLayout.align requested_layout₀))) ->
        (((((AllocLayoutLayout.size requested_layout₀) + (AllocLayoutLayout.align requested_layout₀)) - 1) ≤ num_isize_MAX)) ->
         (((num_max 16 constgen_MIN_ALIGN_0) ≥ 0)) ->
          (((AllocLayoutLayout.align requested_layout₀) ≥ 0)) ->
           (((num_max (num_max 16 constgen_MIN_ALIGN_0) (AllocLayoutLayout.align requested_layout₀)) ≥ 0)) ->
            (∀ (a'₂ : Int),
             (k7 a'₂ constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀))) ∧
            ((k7 448 constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀))) ∧
            (∀ (new_size_without_footer₁ : Int),
             ((k7 new_size_without_footer₁ constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀))) ->
              ((new_size_without_footer₁ ≥ 0)) ->
               ((((num_max (num_max 16 constgen_MIN_ALIGN_0) (AllocLayoutLayout.align requested_layout₀)) > 0)) ∧
               ((pow2 (num_max (num_max 16 constgen_MIN_ALIGN_0) (AllocLayoutLayout.align requested_layout₀))))
               ) ∧
               (∀ (result₀ : Int),
                ((rounded_up (AllocLayoutLayout.size requested_layout₀) (num_max (num_max 16 constgen_MIN_ALIGN_0) (AllocLayoutLayout.align requested_layout₀)) result₀)) ->
                 (k8 result₀ constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀) new_size_without_footer₁)) ∧
               (∀ (requested_size₀ : Int),
                ((k8 requested_size₀ constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀) new_size_without_footer₁)) ->
                 ((requested_size₀ ≥ 0)) ->
                  (((num_max new_size_without_footer₁ requested_size₀) ≥ 0)) ->
                   (((¬((num_max new_size_without_footer₁ requested_size₀) < 4096))) ->
                    ((pow2 4096)) ∧
                    (∀ (result₁ : Int),
                     ((rounded_up ((num_max new_size_without_footer₁ requested_size₀) + 64) 4096 result₁)) ->
                      (k10 result₁ constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀) new_size_without_footer₁ requested_size₀)) ∧
                    ((((OpsControlFlowControlFlow.mkOpsControlFlowControlFlow₀ (can_round_up ((num_max new_size_without_footer₁ requested_size₀) + 64) 4096)) = (OpsControlFlowControlFlow.mkOpsControlFlowControlFlow₀ True))) ->
                     ∀ (a'₇ : Int),
                      ((k10 a'₇ constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀) new_size_without_footer₁ requested_size₀)) ->
                       ((a'₇ ≥ 0)) ->
                        (((a'₇ - 64) ≥ 0)) ∧
                        ((k0 (a'₇ - 64) constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀) new_size_without_footer₁ requested_size₀))
                        )
                    ) ∧
                   ((((num_max new_size_without_footer₁ requested_size₀) < 4096)) ->
                    ((((num_max new_size_without_footer₁ requested_size₀) + 64) ≤ 9223372036854775808)) ∧
                    (∀ (r₀ : Int),
                     ((r₀ ≥ ((num_max new_size_without_footer₁ requested_size₀) + 64)) ∧ (pow2 r₀) ∧ ((((num_max new_size_without_footer₁ requested_size₀) + 64) ≤ 1) ∨ (r₀ < (2 * ((num_max new_size_without_footer₁ requested_size₀) + 64))))) ->
                      ((r₀ ≥ 0)) ->
                       (((r₀ - 64) ≥ 0)) ∧
                       ((k0 (r₀ - 64) constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀) new_size_without_footer₁ requested_size₀))
                       )
                    ) ∧
                   (∀ (new_size_without_footer₂ : Int),
                    ((k0 new_size_without_footer₂ constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀) new_size_without_footer₁ requested_size₀)) ->
                     (((k5)) ->
                      ∀ (a'₁₀ : Int),
                       ((a'₁₀ ≥ 0)) ->
                        ((k6 a'₁₀ constgen_MIN_ALIGN_0)) ->
                         ((¬(((num_max (num_max 16 constgen_MIN_ALIGN_0) (AllocLayoutLayout.align requested_layout₀)) % 16) ≠ a'₁₀))) ->
                          (k2 constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀) new_size_without_footer₁ requested_size₀ new_size_without_footer₂)) ∧
                     (((k2 constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀) new_size_without_footer₁ requested_size₀ new_size_without_footer₂)) ->
                      (((k3)) ->
                       ∀ (a'₁₁ : Int),
                        ((a'₁₁ ≥ 0)) ->
                         ((k4 a'₁₁ constgen_MIN_ALIGN_0)) ->
                          ((¬((new_size_without_footer₂ % 16) ≠ a'₁₁))) ->
                           (k1 constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀) new_size_without_footer₁ requested_size₀ new_size_without_footer₂)) ∧
                      (((k1 constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀) new_size_without_footer₁ requested_size₀ new_size_without_footer₂)) ->
                       (∀ (a'₁₂ : Int),
                        ((a'₁₂ = (new_size_without_footer₂ + 48))) ->
                         (k18 a'₁₂ constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀) new_size_without_footer₁ requested_size₀ new_size_without_footer₂)) ∧
                       (∀ (size₀ : Int),
                        ((k18 size₀ constgen_MIN_ALIGN_0 (OptionOption.is_some new_size_without_footer₀) (AllocLayoutLayout.size requested_layout₀) (AllocLayoutLayout.align requested_layout₀) new_size_without_footer₁ requested_size₀ new_size_without_footer₂)) ->
                         ((size₀ ≥ 0)) ->
                          ((size₀ = (new_size_without_footer₂ + 48))) ∧
                          (((num_max (num_max 16 constgen_MIN_ALIGN_0) (AllocLayoutLayout.align requested_layout₀)) > 0)) ∧
                          ((((num_max (num_max 16 constgen_MIN_ALIGN_0) (AllocLayoutLayout.align requested_layout₀)) % 16) = 0)) ∧
                          (((new_size_without_footer₂ % 16) = 0)) ∧
                          ((new_size_without_footer₂ ≥ 0))
                          )
                       )
                      )
                     )
                   )
               )
            )
   
end F
