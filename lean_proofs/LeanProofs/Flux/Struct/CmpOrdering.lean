import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

@[ext]
structure CmpOrdering  where
  mkCmpOrdering₀ ::
    ord : Int 
  deriving Inhabited


end F
