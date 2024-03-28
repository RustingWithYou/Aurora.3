/datum/map/event/moghes
	name = "Moghes"
	full_name = "Moghes"
	path = "event/moghes"
	lobby_icons = list('icons/misc/titlescreens/aurora/tajara.dmi')
	lobby_transitions = FALSE

	allowed_jobs = list(/datum/job/visitor, /datum/job/passenger, /datum/job/captain, /datum/job/xo, /datum/job/operations_manager, /datum/job/chief_engineer, /datum/job/cmo, /datum/job/rd, /datum/job/hos)

	station_levels = list(2)
	admin_levels = list(1)
	contact_levels = list(2)
	player_levels = list(2)
	accessible_z_levels = list(2)

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
		"2" = /turf/simulated/floor/exoplanet/mineral
	)

	map_shuttles = list(
		/datum/shuttle/autodock/ferry/supply/moghes
	)
	force_spawnpoint = TRUE
