import LeanProofs.Flux.Prelude
import LeanProofs.Flux.Fun.Allocated
open Classical
set_option linter.unusedVariables false


namespace F

noncomputable def footer_ptr (a'₂₉ : Int) (a'₃₀ : Int) (a'₃₁ : Int) : Prop :=
  (allocated a'₂₉ a'₃₀ a'₃₁ 48 16)


end F
