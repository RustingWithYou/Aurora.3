//map here
/datum/map/event/ouerea_hotel
	name = "Grand Ouerean Hotel"
	full_name = "Grand Ouerean Hotel"
	path = "event/ouerea"
	lobby_icons = list('icons/misc/titlescreens/aurora/nss_aurora.dmi')
	allowed_jobs = list(/datum/job/visitor, /datum/job/passenger, /datum/job/captain, /datum/job/xo, /datum/job/chief_engineer, /datum/job/cmo, /datum/job/hos, /datum/job/operations_manager, /datum/job/rd, /datum/job/representative, /datum/job/consular)

	station_levels = list(1,2)
	contact_levels = list(1,2)
	player_levels = list(1,2)
	accessible_z_levels = list(1,2)

	station_name = "Ouerea"
	station_short = "Ouerea"
	station_type = "planet"
	dock_name = "SCCV Horizon"
	dock_short = "Horizon"
	boss_name = "Stellar Corporate Conglomerate"
	boss_short = "SCC"
	company_name = "Stellar Corporate Conglomerate"
	company_short = "SCC"

	use_overmap = FALSE
	map_shuttles = list(
		/datum/shuttle/autodock/ferry/lift/hotel
	)
	base_turf_by_z = list(
		"1" = /turf/simulated/floor/exoplanet/grass,
		"2" = /turf/simulated/open
	)

/area/ouerea_hotel
	name = "Grand Ouerean Hotel"
	icon_state = "bluenew"
	requires_power = FALSE
	dynamic_lighting = TRUE
	no_light_control = FALSE
	area_flags = AREA_FLAG_RAD_SHIELDED
	base_turf = /turf/simulated/floor/exoplanet/grass

/area/ouerea_hotel/shuttle
	name = "IHV Venture"
	icon_state = "shuttle"
	ambience = AMBIENCE_HANGAR

/area/turbolift/ouerea_hotel
	name = "Hotel Elevator"
	sound_environment = SOUND_AREA_TUNNEL_ENCLOSED
	ambience = AMBIENCE_GHOSTLY
