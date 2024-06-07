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
	area_blurb = "The world is dark and still here, in the caverns of Tza. You stand beneath mountains older than civilisation. Water drips gently from stalactites, as the stale air of the subterrane surrounds you."

/area/new_blades/caves/Entered(mob/living/L)
	. = ..()
	if(isunathi(L) && !(L.ckey in global.misc_blurb_stated_to))
		var/mob/living/carbon/human/H = L
		if(H.origin.name == "Tza Prairie Lower Castes" || H.origin.name == "Tza Prairie Upper Castes")
			to_chat(H, SPAN_CULT("We live our lives at the mercy of the mountains, and it is to them that our bones return. These peaks stood before there were Sinta, and when the last soul is gone from this world they will stand in silence still."))
			misc_blurb_stated_to += L.ckey

/area/new_blades/caves/mine
	name = "Tza Mines"
	area_blurb = "Tarnished beams hold up these tunnels, winding deep into the mountain. Dust lingers in the stale air. You are beneath the mountain now, in the mine that Kazseres once owed its livelihood to."

/area/new_blades/caves/mine/Entered(mob/living/L)
	. = ..()
	if(L.client && !(L.ckey in global.job_blurb_stated_to))
		if(L.mind.assigned_role == "Operations Personnel" || L.mind.assigned_role == "Operations Manager")
			to_chat(L, SPAN_NOTICE("This mine is poorly maintained, and likely the furthest thing from safe for prolonged operation. Peering through the dark of the tunnels, however, your experience tells you that this mine could likely be restored to working order in time - all it would need would be investment and new hands."))
			global.job_blurb_stated_to += L.ckey

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
	area_blurb = "The soft drip of water echoes through this ancient structure. The smell of damp and rust lingers in the air."

/area/new_blades/interiors/dam/Entered(mob/living/L)
	. = ..()
	if(L.client && !(L.ckey in global.job_blurb_stated_to))
		if(L.mind.assigned_role == "Engineering Personnel" || L.mind.assigned_role == "Chief Engineer")
			to_chat(L, SPAN_NOTICE("Looking over the derelict structure, you can tell that a full repair effort would be an enormous project. The machinery here seems to be rather well-preserved, however - just lacking power."))
			global.job_blurb_stated_to += L.ckey

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
