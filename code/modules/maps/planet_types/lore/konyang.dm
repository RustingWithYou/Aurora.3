/obj/effect/overmap/visitable/sector/exoplanet/konyang
	name = "Konyang"
	desc = "A Coalition world which was recently Solarian territory, now resting on the fringes of the northern Frontier. It possesses very humid weather and highly developed infrastructure, boasting a population in some billions."
	icon_state = "globe2"
	color = "#68e968"
	planetary_area = /area/exoplanet/grass/konyang
	scanimage = "konyang.png"
	massvolume = "0.89/0.99"
	surfacegravity = "0.93"
	charted = "Charted 2305, Sol Alliance Department of Colonization."
	geology = "Low-energy tectonic heat signature, minimal surface disruption"
	weather = "Global full-atmosphere hydrological weather system. Substantial meteorological activity, violent storms unpredictable"
	surfacewater = "Majority potable, 88% surface water. Significant tidal forces from natural satellite"
	features_budget = 8
	surface_color = null//pre colored
	water_color = null//pre colored
	rock_colors = null//pre colored
	plant_colors = null//pre colored
	generated_name = FALSE
	flora_diversity = 0
	has_trees = FALSE
	ruin_planet_type = PLANET_LORE
	ruin_type_whitelist = list(/datum/map_template/ruin/exoplanet/konyang_landing_zone, /datum/map_template/ruin/exoplanet/konyang_jeweler_nest, /datum/map_template/ruin/exoplanet/konyang_village, /datum/map_template/ruin/exoplanet/konyang_telecomms_outpost, /datum/map_template/ruin/exoplanet/pirate_outpost, /datum/map_template/ruin/exoplanet/pirate_moonshine)
	possible_themes = list(/datum/exoplanet_theme/konyang)
	place_near_main = list(1,0)

/obj/effect/overmap/visitable/sector/exoplanet/konyang/Initialize()
	. = ..()
	var/area/overmap/map = global.map_overmap
	for(var/obj/effect/overmap/visitable/sector/point_verdant/P in map)
		P.x = x
		P.y = y

/obj/effect/overmap/visitable/sector/exoplanet/konyang/generate_habitability()
	return HABITABILITY_IDEAL

/obj/effect/overmap/visitable/sector/exoplanet/konyang/generate_map()
	lightlevel = 50
	..()

/obj/effect/overmap/visitable/sector/exoplanet/konyang/generate_planet_image()
	skybox_image = image('icons/skybox/lore_planets.dmi', "konyang")
	skybox_image.pixel_x = rand(0,64)
	skybox_image.pixel_y = rand(128,256)

/obj/effect/overmap/visitable/sector/exoplanet/konyang/update_icon()
	return

/obj/effect/overmap/visitable/sector/exoplanet/konyang/generate_atmosphere()
	..()
	if(atmosphere)
		atmosphere.remove_ratio(1)
		atmosphere.adjust_gas(GAS_OXYGEN, MOLES_O2STANDARD, 1)
		atmosphere.adjust_gas(GAS_NITROGEN, MOLES_N2STANDARD, 1)
		atmosphere.temperature = T20C
		atmosphere.update_values()

/obj/effect/overmap/visitable/sector/exoplanet/barren/qixi
	name = "Qixi"
	desc = "The small, lifeless, and largely insignificant moon of Konyang."
	icon_state = "globe1"
	color = "#a2b3ad"
	rock_colors = list("#807f7f")
	massvolume = "0.27/0.39"
	surfacegravity = "0.19"
	geology = "No tectonic activity detected."
	charted = "Natural satellite of Konyang. Charted 2305, Sol Alliance Department of Colonization."
	features_budget = 1
	surface_color = "#807f7f"
	generated_name = FALSE
	ring_chance = 0
	ruin_planet_type = PLANET_LORE
	place_near_main = list(1, 1)
	ruin_type_whitelist = list(/datum/map_template/ruin/exoplanet/qixi_mystery, /datum/map_template/ruin/exoplanet/qixi_flag, /datum/map_template/ruin/exoplanet/qixi_mining)

/obj/effect/overmap/visitable/sector/exoplanet/barren/qixi/get_surface_color()
	return "#807f7f"

/obj/effect/overmap/visitable/sector/exoplanet/barren/qixi/update_icon()
	return

/obj/effect/overmap/visitable/sector/exoplanet/barren/asteroid/ice/haneunim
	desc = "An ice-covered rock from the outlying asteroid belt of Haneunim. Largely unexplored and uninhabited."
	ruin_planet_type = PLANET_LORE
	place_near_main = null
	features_budget = 2
	ruin_type_whitelist = list(/datum/map_template/ruin/exoplanet/haneunim_crash, /datum/map_template/ruin/exoplanet/haneunim_refugees)
