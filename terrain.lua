local Terrain = class("Terrain")


local Terrain.static.N = 1
local Terrain.static.NE = 2
local Terrain.static.E = 3
local Terrain.static.SE = 4
local Terrain.static.S = 5
local Terrain.static.SW = 6
local Terrain.static.W = 7
local Terrain.static.NW = 8
local Terrain.static.LASTDIR = 8

local Terrain:initialize()
  self.kinds = {}
  self.pieces = {}
  for i = 1, 8 do
    self.position_matches[i] = {}
  end
end

local Terrain:addPiece(piece)
  local id = piece.id
  self.pieces[id] = piece
  self.kinds[piece.kind] = piece
  for i = 1, 8 do
    -- add in all reflections etc
  end
end

local Terrian:_findDirecitonalMatches(direction, kind)
  local matches = {}
  for _, m in ipairs(self.position_matches[direction]) do
    if kind == "_" or m.kind == kind then
      matches[m.id] = m
    end
  end
  return matches
end


local Terrain:select(neighbors)
  for _, n in neighbors do
    -- load the matches for North
    local possibles = self:_findDirecitonalMatches(1, n[1])

    -- then continue to prune possible matches for each direction
    for i = 2, self.LASTDIR do
      local matches = self:_findDirecitonalMatches(i, n[1])
      for _, n in possibles do
        if not matches[n.id] then
            possibles[n.id] = nil
        end
      end
    end
  end
  if #possibles > 1 then
    return possibles[math.random(#possibles)]
  return possibles
end

local Terrain:printMissing()
  -- for all combinations of kinds
  -- If there is no match, print this
end

return Terrain
