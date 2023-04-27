/datum/map_template/ruin/away_site/hegemony_corvette
	name = "Hegemony Corvette"
	description = "Ship with lizards."
	suffixes = list("ships/hegemony/hegemony_corvette.dmm")
	sectors = list(SECTOR_BADLANDS, SECTOR_UUEOAESA)
	//spawn_weight = 1
	//ship_cost = 1
	id = "hegemony_corvette"
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/hegemony_shuttle)

/singleton/submap_archetype/hegemony_corvette
	map = "Hegemony Corvette"
	descriptor = "Ship with lizards."

/obj/effect/overmap/visitable/ship/hegemony_corvette
	name = "Hegemony Corvette"
	class = "HMV" //Hegemony Military Vessel
	desc = "stuff goes here"
	icon_state = "foundation"
	moving_state = "foundation-moving"
	colors = list("#e38222", "#f0ba3e")
	scanimage = "unathi_corvette.png"
	designer = "Hephaestus Industries, Izweski Hegemonic Naval Guilds"
	volume = "75 meters length, 35 meters beam/width, 21 meters vertical height"
	drive = "Low-Speed Warp Acceleration FTL Drive"
	weapons = "Dual extruding medium-caliber ballistic armament, port obscured flight craft bay"
	sizeclass = "Foundation-class corvette"
	shiptype = "Military patrol and anti-pirate operation."
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS
	vessel_mass = 5000
	fore_dir = SOUTH
	vessel_size = SHIP_SIZE_SMALL
	initial_restricted_waypoints = list(
		"Hegemony Shuttle" = list("nav_hegemony_corvette_shuttle"),
		"Intrepid" = list("nav_hegemony_corvette_intrepid")
	)
	initial_generic_waypoints = list(
		"nav_hegemony_corvette1",
		"nav_hegemony_corvette2",
		"nav_hegemony_corvette3",
		"nav_hegemony_corvette4"
	)

/obj/effect/overmap/visitable/ship/hegemony_corvette/New()
	designation = "[pick("Three Heads' Chosen", "Revenge for Gakal'zaal", "Child of Chanterel", "Horns of the Hegemon", "Hide of Steel", "Battle-Talon", "Roaming Warrior", "Abiding Victory", "Scorched Scales", "Wildfire of Moghes", "Travakh Unending", "Blessed By The Spirits", "Blackened Tail", "Legend Foretold", "Molten Claws", "Unfading River", "Emberstorm")]"
	..()

/obj/effect/shuttle_landmark/hegemony_corvette
	base_turf = /turf/space/dynamic
	base_area = /area/space

/obj/effect/shuttle_landmark/hegemony_corvette/nav1
	name = "Hegemony Corvette - Fore"
	landmark_tag = "nav_hegemony_corvette1"

/obj/effect/shuttle_landmark/hegemony_corvette/nav2
	name = "Hegemony Corvette - Aft"
	landmark_tag = "nav_hegemony_corvette2"

/obj/effect/shuttle_landmark/hegemony_corvette/nav3
	name = "Hegemony Corvette - Port"
	landmark_tag = "nav_hegemony_corvette3"

/obj/effect/shuttle_landmark/hegemony_corvette/nav4
	name = "Hegemony Corvette - Starboard"
	landmark_tag = "nav_hegemony_corvette4"

/obj/effect/shuttle_landmark/hegemony_corvette/transit
	name = "In transit"
	landmark_tag = "nav_transit_hegemony_corvette"
	base_turf = /turf/space/transit/north

/obj/effect/shuttle_landmark/hegemony_corvette/dock
	name = "Hegemony Corvette - Shuttle Dock"
	landmark_tag = "nav_hegemony_corvette_shuttle"

/obj/effect/shuttle_landmark/hegemony_corvette/intrepid
	name = "Hegemony Corvette - Intrepid Dock"
	landmark_tag = "nav_hegemony_corvette_intrepid"


//Shuttle Stuff

/obj/effect/overmap/visitable/ship/landable/hegemony_shuttle
	name = "Hegemony Shuttle"
	class = "HMV"
	designation = "Hatchling"
	desc = "An inefficient design of ultra-light shuttle. Its only redeeming features are the extreme cheapness of the design and the ease of finding replacement parts. Manufactured by Hephaestus."
	icon_state = "pod"
	moving_state = "pod_moving"
	shuttle = "Hegemony Shuttle"
	colors = list("#e38222", "#f0ba3e")
	max_speed = 1/(3 SECONDS)
	burn_delay = 2 SECONDS
	vessel_mass = 3000 //very inefficient pod
	fore_dir = SOUTH
	vessel_size = SHIP_SIZE_TINY

/obj/machinery/computer/shuttle_control/explore/hegemony_shuttle
	name = "shuttle control console"
	shuttle_tag = "Hegemony Shuttle"

/datum/shuttle/autodock/overmap/hegemony_shuttle
	name = "Hegemony Shuttle"
	move_time = 20
	shuttle_area = list(/area/shuttle/hegemony)
	current_location = "nav_hegemony_corvette_shuttle"
	landmark_transition = "nav_transit_hegemony_corvette"
	range = 1
	fuel_consumption = 2
	logging_home_tag = "nav_hegemony_corvette_shuttle"
	defer_initialisation = TRUE