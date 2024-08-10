/area/new_blades
	name = "Base Area"
	icon_state = "green"
	requires_power = FALSE
	dynamic_lighting = TRUE
	no_light_control = FALSE
	base_turf = /turf/simulated/floor/exoplanet/grass/moghes/dirt
	is_outside = OUTSIDE_YES
	var/lighting = TRUE

/area/new_blades/Initialize()
	. = ..()
	if(lighting)
		for(var/turf/T in src)
			T.set_light(4, 0.5, "#c24713")

/area/new_blades/underground
	name = "Underground"
	icon_state = "bluenew"
	lighting = FALSE
	base_turf = /turf/simulated/floor/exoplanet/barren
	ambience = AMBIENCE_RUINS
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_HIDE_FROM_HOLOMAP
	area_blurb = "The caverns are dark and quiet, the mountains closing around you."
	is_outside = OUTSIDE_NO

// AREAS
/area/new_blades/palace
	name = "Hutay'zai Estate"
	icon_state = "blue"
	is_outside = OUTSIDE_NO
	lighting = FALSE
	area_blurb = "The buildings here are vast and ancient things of stone, towering and cavernous. Sound echoes through the hallways, lit by the soft glow of electric lights."

/area/new_blades/garden
	name = "Gardens"
	icon_state = "green"
	area_blurb = "A soft wind blows through the grass. The gentle sunset light is clear here."
	ambience = AMBIENCE_JUNGLE

//Shuttles
/area/shuttle/scc_evac
	name = "SCC Transport Shuttle"
	area_flags = AREA_FLAG_RAD_SHIELDED
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
	is_outside = OUTSIDE_NO

/datum/shuttle/autodock/ferry/scc_evac
	name = "SCCV Apollo"
	location = 1
	warmup_time = 10
	shuttle_area = /area/shuttle/scc_evac
	move_time = 20
	dock_target = "scc_evac"
	waypoint_station = "nav_scc_evac_dock"
	landmark_transition = "nav_scc_evac_interim"
	waypoint_offsite = "nav_scc_evac_start"
	knockdown = FALSE

/obj/effect/shuttle_landmark/scc_evac/start
	name = "Izilukh Landing Zone"
	landmark_tag = "nav_scc_evac_start"
	docking_controller = "scc_evac_station"
	base_turf = /turf/simulated/floor/exoplanet/desert
	base_area = /area/new_blades

/obj/effect/shuttle_landmark/scc_evac/interim
	name = "In transit"
	landmark_tag = "nav_scc_evac_interim"
	base_turf = /turf/space/transit/bluespace/west

/obj/effect/shuttle_landmark/scc_evac/dock
	name = "SCCV Horizon Docking Port"
	landmark_tag = "nav_scc_evac_dock"
	docking_controller = "scc_evac_shuttle_dock"
	landmark_flags = SLANDMARK_FLAG_AUTOSET

/obj/machinery/computer/shuttle_control/scc_evac
	name = "SCCV Apollo control console"
	req_access = list(ACCESS_HEADS)
	shuttle_tag = "SCCV Apollo"
	var/locked = FALSE

/obj/machinery/computer/shuttle_control/scc_evac/attack_hand(mob/user)
	if(locked)
		return
	..()
