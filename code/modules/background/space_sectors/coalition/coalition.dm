//Coalition-aligned regions and sectors
/datum/space_sector/coalition
	name = SECTOR_COALITION
	description = "The Coalition of Colonies is an independent, space-faring nation formed of once-Solarian colonies residing in the frontier. Population estimates range from 85 to 110 billion, with an accurate census being nearly impossible due to the decentralized government of the Coalition. Founded in a revolt against the governance of the Association of Sovereign Solarian Nations, or the Sol Alliance, it won its independence in the prolonged Interstellar War. The Coalition is one of the most diverse entities in known space culturally, socially, and politically."
	skybox_icon = "weeping_stars"//the region that covers most of the coalition, presumably
	possible_exoplanets = list(/obj/effect/overmap/visitable/sector/exoplanet/barren/asteroid, /obj/effect/overmap/visitable/sector/exoplanet/grass/grove, /obj/effect/overmap/visitable/sector/exoplanet/barren, /obj/effect/overmap/visitable/sector/exoplanet/lava, /obj/effect/overmap/visitable/sector/exoplanet/desert, /obj/effect/overmap/visitable/sector/exoplanet/snow)
//	cargo_price_coef = TBD
	starlight_color = "#615bff"
	starlight_power = 2
	starlight_range = 4
	sector_welcome_message = 'sound/AI/welcome_coalition.ogg'
	sector_hud_menu = 'icons/misc/hudmenu/coalition_hud.dmi'
	sector_hud_arrow = "menu_arrow"

/datum/space_sector/weeping_stars
	name = SECTOR_WEEPING_STARS
	description = "The region most devastated by the Interstellar War, the majority of the Weeping Stars has yet to recover from the damage it suffered during the War and much of it remains underdeveloped and sparsely inhabited. During the hegemonic era of the Solarian Alliance, when the Alliance stretched from Sol to the edge of known space, this region was known as the Inner Solarian Frontier and was intended to serve as a highly-developed region for humanity to thrive in. Massive amounts of funds were used to build an infrastructure which was still incomplete when war broke out in 2277, and the shattered ruins of long-lost Solarian hegemonic era structures and projects are present throughout the region."
	skybox_icon = "weeping_stars"
	possible_exoplanets = list(/obj/effect/overmap/visitable/sector/exoplanet/barren/asteroid, /obj/effect/overmap/visitable/sector/exoplanet/grass/grove, /obj/effect/overmap/visitable/sector/exoplanet/barren, /obj/effect/overmap/visitable/sector/exoplanet/lava, /obj/effect/overmap/visitable/sector/exoplanet/desert, /obj/effect/overmap/visitable/sector/exoplanet/snow)
	cargo_price_coef = list("nt" = 1.2, "hpi" = 0.8, "zhu" = 0.8, "een" = 1.2, "get" = 1.2, "arz" = 1.2, "blm" = 1.2, "iac" = 1.2, "zsc" = 0.8, "vfc" = 1.2, "bis" = 0.8, "xmg" = 0.8, "npi" = 0.8)
	starlight_color = "#615bff"
	starlight_power = 2
	starlight_range = 4
	sector_welcome_message = 'sound/AI/welcome_weeping.ogg'
	sector_hud_menu = 'icons/misc/hudmenu/coalition_hud.dmi'
	sector_hud_arrow = "menu_arrow"

/datum/space_sector/arusha
	name = SECTOR_ARUSHA
	description = "Arusha is a truly alien sector within the Orion Spur, known for its great many barely-habitable planets populated by xenoflora that is like nothing ever seen elsewhere in charted space. Presumably anomalous in nature or spread by a now long-gone civilization, these Arushan plant species are widely famous for their odd appearance, high luminescence and very specific compatible habitats. The products of harvesting Arushan plants are seen as delicacies across charted space."
	skybox_icon = "arusha"
//	cargo_price_coef = TBD
	starlight_color = "#2d9647"
	starlight_power = 2
	starlight_range = 5

/datum/space_sector/libertys_cradle
	name = SECTOR_LIBERTYS_CRADLE
	description = "The beating heart of the modern Coalition of Colonies, Liberty’s Cradle is home to many of the Coalition’s most developed and influential worlds. In contrast to the Solarian stereotype of the frontier as a decivilized wasteland populated by roving bands of pirates and petty warlords, Liberty’s Cradle is a prosperous and safe region which has a higher standard of living than much of the former Middle and Outer Ring possessed prior to the Solarian Collapse of 2462. Post-Collapse the area has continued to prosper and, now that it dwells far behind the Coalition-controlled Weeping Stars, is more secure than it has ever been before."
	skybox_icon = "the_clash"//placeholder
//	cargo_price_coef = TBD
	starlight_color = "#962d96"
	starlight_power = 2
	starlight_range = 4

/datum/space_sector/burzsia
	name = SECTOR_BURZSIA
	description = "The system of Burzsia serves as a resource hub solely for the corporate interests of Hephaestus Industries, with vast mining infrastructure and sprawling supply ports dotted all over the system. Hephaestus ships, enormous freighters and personnel transportation vessels dominate the area, with corporate security being extremely tight. Private vessels are allowed transit and rest if needed, though always under the close surveillance of Hephaestus security and local executives. A population of local off-worlders has also been present before corporate domination, but mostly leave any external relations to the company that has, at this point, taken upon it to represent virtually all interests of the natives."
	skybox_icon = "weeping_stars"
	possible_exoplanets = list(/obj/effect/overmap/visitable/sector/exoplanet/barren/asteroid/burzsia, /obj/effect/overmap/visitable/sector/exoplanet/burzsia)
	cargo_price_coef = list("nt" = 1.2, "hpi" = 0.4, "zhu" = 0.8, "een" = 1.2, "get" = 1.2, "arz" = 1.2, "blm" = 1.2, "iac" = 1.2, "zsc" = 0.8, "vfc" = 1.2, "bis" = 0.8, "xmg" = 0.8, "npi" = 0.8)
	starlight_color = "#615bff"
	starlight_power = 2
	starlight_range = 4
	sector_welcome_message = 'sound/AI/welcome_weeping.ogg'
	sector_hud_menu = 'icons/misc/hudmenu/coalition_hud.dmi'
	sector_hud_arrow = "menu_arrow"

/datum/space_sector/haneunim
	name = SECTOR_HANEUNIM
	description = "Located in the northern Orion Spur, the Haneunim system is home to the planet Konyang - known for being one of the most pro-synthetic planets in the Spur, and the only place where synthetics have full and equal legal rights to humanity. Einstein Engines, Zeng-Hu Pharmaceuticals and Hephaestus Industries all have a major presence in this sector, and many vessels of desperate synthetics seek to find sanctuary from the wider Spur wihtin the borders of Konyang. A wealthy and prosperous system, Haneunim has endured a period of uncertainty - seceding from the Sol Alliance and joining the Coalition of Colonies in 2462, in the hope of protection from the Solarian warlords that plagued the region."
	skybox_icon = "haneunim"
	possible_exoplanets = list(/obj/effect/overmap/visitable/sector/exoplanet/barren/qixi, /obj/effect/overmap/visitable/sector/exoplanet/barren/asteroid/ice/haneunim, /obj/effect/overmap/visitable/sector/exoplanet/barren/hwanung, /obj/effect/overmap/visitable/sector/exoplanet/lava/huozhu)
	guaranteed_exoplanets = list(/obj/effect/overmap/visitable/sector/exoplanet/konyang)
	cargo_price_coef = list("nt" = 1.1, "hpi" = 0.7, "zhu" = 0.4, "een" = 1.0, "get" = 1.1, "arz" = 1.8, "blm" = 0.9, "iac" = 1.2, "zsc" = 1.8, "vfc" = 0.9, "bis" = 0.4, "xmg" = 0.7, "npi" = 0.8)

	starlight_color = "#e2719b"
	starlight_power = 2//placeholder
	starlight_range = 4//placeholder
	sector_lobby_art = list('icons/misc/titlescreens/lore/silicon_nightmares.dmi')
	sector_lobby_transitions = 0
	sector_welcome_message = 'sound/AI/welcome_konyang.ogg'
	sector_hud_menu = 'icons/misc/hudmenu/konyang_hud.dmi'
	sector_hud_arrow = "menu_arrow"

	lobby_tracks = list(
		'sound/music/lobby/konyang/konyang-1.ogg',
		'sound/music/lobby/konyang/konyang-2.ogg',
		'sound/music/lobby/konyang/konyang-3.ogg',
		'sound/music/lobby/konyang/konyang-4.ogg'
	)

	lore_radio_stations = list(
		"73.2 Navy Broadcasting Service" = "config/lore_radio/konyang/73.2_Navy_Broadcasting_Service.txt",
		"122 Great Blue Dot" = "config/lore_radio/konyang//122_Great_Blue_Dot.txt",
		"75.4 PBA" = "config/lore_radio/konyang/75.4_PBA.txt",
		"77.7 SoulFM" = "config/lore_radio/konyang/77.7_SoulFM.txt",
		"78.1 RealFM" = "config/lore_radio/konyang/78.1_RealFM.txt"
	)
