/datum/ghostspawner/human/ihss_reclamation
	name = "IHSS Reclamation Crew"
	short_name = "ihss_reclamation"
	desc = "Crew the IHSS Reclamation"
	tags = list("External")

	spawnpoints = list("ihss_crew")
	req_perms = null
	max_count = 4
	uses_species_whitelist = FALSE
	possible_species = list(SPECIES_UNATHI, SPECIES_VAURCA_WORKER, SPECIES_DIONA)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	welcome_message = "You are a crewmember aboard the IHSS Reclamation, an Izweski Hegemony ecological monitoring and terraforming station for coordinating the restoration of the Moghes Wasteland.\
	IMPORTANT - If you choose to play a Vaurca, know that they are very alien species, and difficult to roleplay. Reading the wiki page for the species is highly encouraged."
	assigned_role = "IHSS Reclamation Crewmember"
	special_role = "IHSS Reclamation Crewmember"
	extra_languages = list(LANGUAGE_UNATHI)
	respawn_flag = null

	outfit = /obj/outfit/admin/ihss_reclamation

/obj/outfit/admin/ihss_reclamation
	name = "IHSS Reclamation Crew"
	id = /obj/item/card/id
	shoes = /obj/item/clothing/shoes/sandals/caligae/socks
	uniform = /obj/item/clothing/under/unathi
	l_ear = /obj/item/device/radio/headset/ship
	r_pocket = /obj/item/storage/wallet/random

/obj/outfit/admin/ihss_reclamation/get_id_access()
	return list(access_kataphract, access_external_airlocks)

/obj/outfit/admin/ihss_reclamation/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(isvaurca(H))
		H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/vaurca/filter(H), slot_wear_mask)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/vaurca(H), slot_shoes)
	if(H?.wear_mask && H.species.has_organ[BP_PHORON_RESERVE])
		var/obj/item/organ/internal/vaurca/preserve/preserve = H.internal_organs_by_name[BP_PHORON_RESERVE]
		H.internal = preserve
		H.internals.icon_state = "internal1"
	var/obj/item/organ/A = new /obj/item/organ/internal/augment/language/klax(H)
	var/obj/item/organ/external/affected = H.get_organ(A.parent_organ)
	A.replaced(H, affected)
	H.update_body()

/datum/ghostspawner/human/ihss_reclamation/security
	name = "IHSS Reclamation Security"
	desc = "Protect the crew of the IHSS Reclamation"
	max_count = 3
	uses_species_whitelist = TRUE
	possible_species = list(SPECIES_UNATHI, SPECIES_VAURCA_WARRIOR)
	welcome_message = "You are security personnel aboard the IHSS Reclamation, an Izweski Hegemony ecological monitoring and terraforming station for coordinating the restoration of the Moghes Wasteland."
	assigned_role = "IHSS Reclamation Security"
	special_role = "IHSS Reclamation Security"
	outfit = /obj/outfit/admin/ihss_reclamation/security

/obj/outfit/admin/ihss_reclamation/security
	name = "IHSS Reclamation Security"
	belt = /obj/item/storage/belt/security/full
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = /obj/item/gun/energy/pistol/hegemony

/datum/ghostspawner/human/ihss_reclamation/captain
	name = "IHSS Reclamation Captain"
	desc = "Command the IHSS Reclamation"
	spawnpoints = list("ihss_captain")
	max_count = 1
	uses_species_whitelist = TRUE
	possible_species = list(SPECIES_UNATHI)
	welcome_message = "You are the captain of the IHSS Reclamation, an Izweski Hegemony ecological monitoring and terraforming station for coordinating the restoration of the Moghes Wasteland."
	assigned_role = "IHSS Reclamation Captain"
	special_role = "IHSS Reclamation Captain"
	outfit = /obj/outfit/admin/ihss_reclamation/captain

/obj/outfit/admin/ihss_reclamation/captain
	name = "IHSS Reclamation Captain"
	belt = /obj/item/melee/energy/sword/hegemony
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = /obj/item/gun/energy/pistol/hegemony

/obj/outfit/admin/ihss_reclamation/captain/get_id_access()
	return list(access_kataphract, access_kataphract_knight, access_external_airlocks)
