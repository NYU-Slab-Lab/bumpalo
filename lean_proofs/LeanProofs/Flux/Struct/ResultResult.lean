import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

@[ext]
structure ResultResult  where
  mkResultResult₀ ::
    is_ok : Prop 
  deriving Inhabited


end F
