//Civilians
/datum/ghostspawner/human/mudki_civ
	name = "Mudki Citizen"
	short_name = "civ"
	desc = "A resident of the once-proud city of Mudki, now decayed and scarred by battle."
	tags = list("External")
	extra_languages = list(LANGUAGE_UNATHI, LANGUAGE_AZAZIBA)
	max_count = 14
	spawnpoints = list("civ")
	possible_species = list(SPECIES_UNATHI)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	outfit = /obj/outfit/admin/unathi_village

	assigned_role = "Mudki Citizen"
	special_role = "Mudki Citizen"
	respawn_flag = null
	uses_species_whitelist = FALSE

/datum/ghostspawner/human/mudki_civ/post_spawn(mob/user)
	. = ..()
	renegades.add_antagonist(user.mind, do_not_equip = TRUE)
