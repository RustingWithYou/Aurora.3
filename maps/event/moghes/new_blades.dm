/area/new_blades
	name = "Moghes Wilderness"
	icon_state = "green"
	requires_power = FALSE
	dynamic_lighting = TRUE
	no_light_control = FALSE
	base_turf = /turf/simulated/floor/exoplanet/grass/moghes
	ambience = AMBIENCE_JUNGLE
	is_outside = TRUE
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
	is_outside = FALSE

/area/new_blades/outflow
	name = "Dam Outflow"

/area/new_blades/interiors
	name = "Tza Interiors"
	icon_state = "blue"
	lighting = FALSE
	area_flags = AREA_FLAG_RAD_SHIELDED
	is_outside = FALSE

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
	is_outside = FALSE

/area/skrell_shuttle
	name = "Nralakk Transport Shuttle"
	icon_state = "shuttle"
	requires_power = FALSE
	dynamic_lighting = TRUE
	no_light_control = FALSE
	area_flags = AREA_FLAG_RAD_SHIELDED
	is_outside = FALSE

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
	desc = "This terminal is labeled as \"DAM CONTROL\". A thick layer of dust covers its screen."
	icon_screen = "mass_driver"
	icon_keyboard = "tech_key"
	var/used = FALSE
	var/has_disk = TRUE

/obj/machinery/computer/terminal/dam_control/get_examine_text(mob/user)
	. = ..()
	if(stat & NOPOWER)
		. += "The screen is dark and unresponsive. It does not appear to have power."
	else
		. += "The screen displays flashing Sinta'Unathi text."
	if(used)
		if(GLOB.all_languages[LANGUAGE_UNATHI] in user.languages)
			. += "It reads: \"FLOODGATE FAILSAFE ENGAGED - SYSTEM REBOOTING. ETD: 89 HOURS."
	else
		if(GLOB.all_languages[LANGUAGE_UNATHI] in user.languages)
			. += "It reads: \"CRITICAL SYSTEM FAILURES DETECTED. RECOMMENDED COURSE OF ACTION - SEAL FLOODGATES AND CONTACT A QUALIFIED JUNZI ELECTRIC GUILDSMAN FOR FULL DAMAGE ASSESSMENT.\""


/obj/machinery/computer/terminal/dam_control/attack_hand(mob/user)
	if(..())
		return
	if(stat & (NOPOWER|BROKEN))
		return
	if(used && !has_disk)
		to_chat(user, SPAN_NOTICE("The terminal flashes an error - it appears the system is unresponsive at this time."))
		return
	if(used && has_disk)
		var/disk = tgui_alert(user, "External disk storage full. Eject?", "Dam Control", list("Eject","Cancel"))
		if(disk == "Eject")
			visible_message(SPAN_NOTICE("\The [src] ejects a small disk."))
			new /obj/item/disk/mcguffin1(get_turf(src))
			has_disk = FALSE
	var/choice = "Cancel"
	if(has_disk)
		choice = tgui_alert(user, "Major system failures detected. External data disk full. Recommended action: Seal floodgates. Proceed?", "Dam Control", list("Seal Floodgates","Eject Disk", "Cancel"))
	else
		choice = tgui_alert(user, "Major system failures detected. Recommended action: Seal floodgates. Proceed?", "Dam Control", list("Seal Floodgates","Cancel"))
	if(choice == "Seal Floodgates")
		playsound(loc, 'sound/misc/bloblarm.ogg', 50)
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
	else if(choice == "Eject Disk")
		visible_message(SPAN_NOTICE("\The [src] ejects a small disk."))
		new /obj/item/disk/mcguffin1(get_turf(src))
		has_disk = FALSE
