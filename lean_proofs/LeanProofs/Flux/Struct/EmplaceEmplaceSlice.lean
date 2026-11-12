import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

@[ext]
structure EmplaceEmplaceSlice  where
  mkEmplaceEmplaceSlice₀ ::
    base : Int 
    addr : Int 
    size : Int 
    len : Int 
    cap : Int 
    meta_ : Int 
  deriving Inhabited


end F
