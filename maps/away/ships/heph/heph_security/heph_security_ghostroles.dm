/datum/ghostspawner/human/heph_security
	name = "Hephaestus Asset Protection Agent"
	short_name = "hephsec"
	desc = "Crew a Hephaestus asset protection vessel. Ensure the company's operations in the sector stay secure and profitable."
	tags = list("External")

	welcome_message = ""

	spawnpoints = list("hephsec")
	max_count = 4

	outfit = /datum/outfit/admin/heph_security
	possible_species = list(SPECIES_HUMAN, SPECIES_HUMAN_OFFWORLD, SPECIES_IPC_G1, SPECIES_IPC_G2, SPECIES_IPC_SHELL, SPECIES_IPC_XION, SPECIES_UNATHI, SPECIES_VAURCA_WARRIOR)
	uses_species_whitelist = TRUE
	allow_appearance_change = APPEARANCE_PLASTICSURGERY

	assigned_role = "Hephaestus Asset Protection Agent"
	special_role = "Hephaestus Asset Protection Agent"
	respawn_flag = null

/datum/outfit/admin/heph_security
	name = "Hephaestus Asset Protection"
	uniform = /obj/item/clothing/under/rank/security/heph
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/combat
	l_ear = /obj/item/device/radio/headset/ship
	belt = /obj/item/storage/belt/military
	back = /obj/item/storage/backpack/satchel/heph
	id = /obj/item/card/id/hephaestus
	backpack_contents = list(/obj/item/storage/box/survival = 1)
	species_shoes = list(
		SPECIES_UNATHI = /obj/item/clothing/shoes/sandals/caligae/socks,
		SPECIES_VAURCA_WARRIOR = /obj/item/clothing/shoes/vaurca
	)
	species_suit = list(
		SPECIES_UNATHI = /obj/item/clothing/accessory/poncho/unathimantle/hephaestus
	)

/datum/outfit/admin/heph_security/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(isoffworlder(H))
		H.equip_or_collect(new /obj/item/storage/pill_bottle/rmt, slot_in_backpack)
	if(isvaurca(H))
		H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/vaurca/filter(H), slot_wear_mask)
		var/obj/item/organ/internal/vaurca/preserve/preserve = H.internal_organs_by_name[BP_PHORON_RESERVE]
		H.internal = preserve
		H.internals.icon_state = "internal1"
		H.equip_or_collect(new /obj/item/reagent_containers/food/snacks/koisbar, slot_in_backpack)
		var/obj/item/organ/A = new /obj/item/organ/internal/augment/language/klax(H)
		var/obj/item/organ/external/affected = H.get_organ(A.parent_organ)
		A.replaced(H, affected)
		H.update_body()
	if(H?.wear_suit)
		H.wear_suit.color = pick("#4f3911", "#292826")

/datum/outfit/admin/heph_security/get_id_access()
	return list(access_hephaestus, access_external_airlocks)

/datum/ghostspawner/human/heph_security/captain
	name = "Hephaestus Asset Protection Squad Leader"
	short_name = "hephsec_boss"
	desc = "Command a Hephaestus asset protection vessel. Ensure that your crew keeps the company's investments in the sector safe, secure and profitable. Keep an eye out for any unions."
	welcome_message = ""
	spawnpoints = list("hephsec_boss")

	outfit = /datum/outfit/admin/heph_security/captain
	max_count = 1
	possible_species = list(SPECIES_HUMAN, SPECIES_HUMAN_OFFWORLD, SPECIES_UNATHI)
	assigned_role = "Hephaestus Asset Protection Squad Leader"
	special_role = "Hephaestus Asset Protection Squad Leader"

/datum/outfit/admin/heph_security/captain
	name = "Hephaestus Asset Protection Squad Leader"
	uniform = /obj/item/clothing/under/rank/captain/hephaestus
