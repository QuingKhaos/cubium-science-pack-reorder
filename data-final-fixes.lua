local khaoslib_recipe = require("__khaoslib__.recipe")

if mods["science-tab"] then
  data:extend({
    {
      type = "item-subgroup",
      name = "cubic-basic-science-pack",
      group = "science",
      order = "p[cubic-science]",
    },
  })

  local nauvis_science_packs = {
    "automation",
    "logistic",
    "military",
    "chemical",
    "production",
    "utility",
    "space",
  }

  for _, pack in pairs(nauvis_science_packs) do
    local recipe = pack .. "-science-pack-cubic"

    if khaoslib_recipe.exists(recipe) then
      khaoslib_recipe:load(recipe)
        :set {subgroup = "cubic-basic-science-pack"}
        :commit()
    end
  end
end
