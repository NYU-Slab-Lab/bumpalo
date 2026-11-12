import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Fun.NumIsizeMAX
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def valid_array_layout (a'₂₃ : Int) (a'₂₄ : Int) (a'₂₅ : Int) : Prop :=
  ((a'₂₄ = 0) ∨ ((((a'₂₄ * a'₂₃) + a'₂₅) - 1) ≤ num_isize_MAX))


end F
