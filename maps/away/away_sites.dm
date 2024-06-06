// Hey! Listen! Update \config\away_site_blacklist.txt with your new ruins!

/datum/map_template/ruin/away_site
	var/list/generate_mining_by_z
	prefix = "maps/away/"

	/// If null, ignored, and exoplanet generation is not used.
	/// If set, away site spawning includes partial exoplanet generation.
	/// Should be assoc map of `/turf/unsimulated/marker/...` path to `/datum/exoplanet_theme/...` path,
	/// where exoplanet generation with the map value is applied only on marker turfs of the applicable map key.
	var/list/exoplanet_themes = null
	///Exoplanets that this site will force to spawn. Useful for on-planet away sites such as Point Verdant or other ports of call.
	var/list/force_exoplanets = list()
	///Exoplanets that this site will prohibit from spawning. Useful for fake planet away sites intended to replace normal exoplanets.
	var/list/ban_exoplanets = list()

/datum/map_template/ruin/away_site/New(var/list/paths = null, rename = null)

	//Apply the subfolder that all ruins are in, as the prefix will get overwritten
	prefix = "maps/away/[prefix]"

	..()
