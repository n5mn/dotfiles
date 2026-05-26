local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node

math.randomseed(os.time())

local function random_string(length)
  local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  local result = {}

  for idx = 1, length do
    local rand = math.random(#chars)
    result[idx] = chars:sub(rand, rand)
  end

  return table.concat(result)
end

return {
  s("rand", {
    f(function()
      return random_string(26)
    end),
  }),
}
