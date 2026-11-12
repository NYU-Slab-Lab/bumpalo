import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

@[ext]
structure IterAdaptersClonedCloned (t0 : Type) [Inhabited t0] where
  mkIterAdaptersClonedCloned₀ ::
    inner : t0 
  deriving Inhabited


end F
