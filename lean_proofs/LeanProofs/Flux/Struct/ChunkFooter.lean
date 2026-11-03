import LeanProofs.Flux.Prelude
open Classical
set_option linter.unusedVariables false


namespace F

@[ext]
structure ChunkFooter  where
  mkChunkFooter₀ ::
    base : Int 
    addr : Int 
    size : Int 
    align : Int 
    meta_ : Int 
  deriving Inhabited


end F
