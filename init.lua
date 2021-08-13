--[[
This fle is a part of digibanner.

Copyright (C) 2021 Cato Yiu and other contributers

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
]]--

digiterms.register_monitor("digibanner:large_street_sign",{
  description = "Digiline Banner",
  paramtype = "light",
  paramtype2 = "facedir",
  drawtype = "nodebox",
  sunlight_propagates = false,
  node_box = {
    type = "fixed",
    fixed = {-(64/16)/2, -(12/16)/2, 0.5,
      (64/16)/2, (12/16)/2, 0.5 - (1/16)},
  },
  groups = {choppy=2, dig_immediate=2, not_blocking_trains=1, display_api=1},
  sounds = default.node_sound_defaults(),
  display_entities = {
    ["digiterms:screen"] = {
      on_display_update = font_api.on_display_update,
      depth = 0.5 - display_api.entity_spacing - (1/16),
      size = { x = 64/16, y = 12/16 },
      lines = 1, columns = 19,
      aspect_ratio = 1/2,
      color = "#000", font_name = "metro",
    },
	},
  tiles = { "signs_road_sides.png", "signs_road_sides.png",
    "signs_road_sides.png", "signs_road_sides.png",
    "signs_road_sides.png", "signs_road_large_white.png" },
  inventory_image = "signs_road_white.png",
})

minetest.register_craft({
  output = "digibanner:large_street_sign",
  type = "shapeless",
  recipe = {
    "signs_road:large_street_sign",
    "digilines:wire_std_00000000",
  },
})
