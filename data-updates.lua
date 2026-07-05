local khaoslib_recipe = require("__khaoslib__.recipe")

data:extend({
  {
    type = "item-subgroup",
    name = "cubic-science",
    group = "cubic",
    order = "z",
  },
})

local cubic_science_packs = khaoslib_recipe.find(function(recipe)
  return recipe.name:match("science%-pack%-cubic") ~= nil
end)

for _, recipe in pairs(cubic_science_packs) do
  local orig_science_pack = recipe:gsub("%-cubic", "")

  khaoslib_recipe:load(recipe)
    :set {subgroup = "cubic-science"}
    :set {order = data.raw["tool"][orig_science_pack].order}
    :commit()
end
