/area/new_blades
	name = "Moghes Wilderness"
	icon_state = "green"
	requires_power = FALSE
	dynamic_lighting = TRUE
	no_light_control = FALSE
	base_turf = /turf/simulated/floor/exoplanet/grass/moghes
	ambience = AMBIENCE_JUNGLE
	var/lighting = TRUE

/area/new_blades/Initialize()
	. = ..()
	if(lighting)
		for(var/turf/T in src)
			T.set_light(4, 5, COLOR_WHITE)

/area/new_blades/lake
	name = "Moghes Lake"
	icon_state = "bluenew"

/area/new_blades/caves
	name = "Tza Caverns"
	icon_state = "miner"
	lighting = FALSE
	base_turf = /turf/simulated/floor/exoplanet/grass/moghes/dirt
	ambience = AMBIENCE_RUINS
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/new_blades/outflow
	name = "Dam Outflow"

/area/new_blades/interiors
	name = "Tza Interiors"
	icon_state = "blue"
	lighting = FALSE
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/new_blades/interiors/dam
	name = "Tza Dam"
	requires_power = TRUE //restore the power, horizon crew...

/area/scc_shuttle
	name = "SCC Transport Shuttle"
	icon_state = "shuttle"
	requires_power = FALSE
	dynamic_lighting = TRUE
	no_light_control = FALSE
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/skrell_shuttle
	name = "Nralakk Transport Shuttle"
	icon_state = "shuttle"
	requires_power = FALSE
	dynamic_lighting = TRUE
	no_light_control = FALSE
	area_flags = AREA_FLAG_RAD_SHIELDED

/datum/shuttle/autodock/ferry/supply/moghes
	name = "OX Supply Shuttle"
	location = 1
	shuttle_area = /area/supply/dock
	dock_target = "cargo_shuttle"
	waypoint_station = "nav_cargo_shuttle_dock"
	waypoint_offsite = "nav_cargo_shuttle_start"

/obj/effect/shuttle_landmark/supply/moghes/start
	name = "SCCV Horizon Cargo Dock"
	landmark_tag = "nav_cargo_shuttle_start"
	base_turf = /turf/unsimulated/floor/plating
	base_area = /area/centcom

/obj/effect/shuttle_landmark/supply/moghes/dock
	name = "Planetary Docking Site"
	landmark_tag = "nav_cargo_shuttle_dock"
	docking_controller = "cargo_shuttle_dock"
	base_turf = /turf/simulated/floor/exoplanet/grass/moghes/dirt
	base_area = /area/new_blades

/obj/machinery/computer/terminal/dam_control
	name = "dam control terminal"
	icon_screen = "mass_driver"
	icon_keyboard = "tech_key"
	var/used = FALSE

/obj/machinery/computer/terminal/dam_control/attack_hand(mob/user)
	if(..())
		return
	if(stat & (NOPOWER|BROKEN))
		return
	if(used)
		to_chat(user, SPAN_NOTICE("The terminal flashes an error - the system is still rebooting. It will be done in a mere 89 hours."))
		return
	var/choice = alert(user, "Major system failure detected. Engage failsafe operations?", "Dam Control","Yes", "No")
	if(choice == "Yes")
		var/area/lake = GLOB.areas_by_type[/area/new_blades/lake]
		if(istype(lake))
			for(var/turf/simulated/floor/exoplanet/grass/moghes/T in lake)
				CHECK_TICK
				T.ChangeTurf(/turf/simulated/floor/exoplanet/water/shallow/moghes)
				T.set_light(4, 5, COLOR_WHITE)
		var/area/outflow = GLOB.areas_by_type[/area/new_blades/outflow]
		if(istype(outflow))
			for(var/turf/simulated/floor/exoplanet/water/shallow/moghes/T in outflow)
				CHECK_TICK
				T.ChangeTurf(/turf/simulated/floor/exoplanet/grass/moghes/dirt)
				T.set_light(4, 5, COLOR_WHITE)
		to_world(SPAN_DANGER("You hear the roaring of distant machinery, and the sudden sound of rushing water!"))
		used = TRUE
