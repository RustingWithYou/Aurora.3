/datum/map/event/moghes
	name = "Moghes"
	full_name = "Moghes"
	path = "event/moghes"

	allowed_jobs = list(/datum/job/visitor, /datum/job/passenger, /datum/job/captain, /datum/job/xo, /datum/job/operations_manager, /datum/job/chief_engineer, /datum/job/cmo, /datum/job/rd, /datum/job/hos, /datum/job/consular, /datum/job/consular_assistant, /datum/job/representative)

	lobby_icons = list('icons/misc/titlescreens/sccv_horizon/sccv_horizon.dmi', 'icons/misc/titlescreens/aurora/synthetics.dmi', 'icons/misc/titlescreens/aurora/tajara.dmi', 'icons/misc/titlescreens/aurora/vaurca.dmi')
	lobby_transitions = 10 SECONDS

	traits = list(
		//Centcomm
		ZTRAITS_CENTCOM,
		//Z1
		list(ZTRAIT_STATION = TRUE, ZTRAIT_UP = TRUE, ZTRAIT_DOWN = FALSE),
		//Z2
		list(ZTRAIT_STATION = TRUE, ZTRAIT_UP = TRUE, ZTRAIT_DOWN = TRUE),
		//Z3
		list(ZTRAIT_STATION = TRUE, ZTRAIT_UP = FALSE, ZTRAIT_DOWN = TRUE)
	)

	admin_levels = list(1)
	contact_levels = list(2, 3, 4)
	player_levels = list(2, 3, 4)
	accessible_z_levels = list(2,3,4)

	station_name = "Moghes"
	station_short = "Moghes"
	dock_name = "SCCV Horizon"
	boss_name = "Stellar Corporate Conglomerate"
	boss_short = "SCC"
	company_name = "Stellar Corporate Conglomerate"
	company_short = "SCC"
	station_type = "planet"

	use_overmap = FALSE

	base_turf_by_z = list(
		"1" = /turf/space,
		"2" = /turf/simulated/floor/exoplanet/barren,
		"3" = /turf/simulated/open,
		"4" = /turf/simulated/open
	)
	force_spawnpoint = TRUE
