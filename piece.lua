local Piece = class("Piece")

local Piece:initialize(kind, name, drawables, neighbors)
  assert(kind, "Must include a kind")
  assert(name, "Must include a name")
  assert(drawables, "Must include one or more drawables")
  assert(neighbors, "Must provide one or more neighbors")

  self.kind = kind
  self.name = name
  self.drawables = drawables
  self.neighbors = neighbors
  return self
end

return Piece
