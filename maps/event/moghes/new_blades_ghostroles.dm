//Kazseres
/datum/ghostspawner/human/nbow_civ
	name = "Kazseres Resident"
	short_name = "nbow_civ"
	desc = "Live your life in the town of Kazseres, on the edge of the Tza Prairie."
	tags = list("External")

	spawnpoints = list("nbow_civ")
	max_count = 12

	extra_languages = list(LANGUAGE_UNATHI, LANGUAGE_AZAZIBA)
	outfit = /obj/outfit/admin/unathi_village
	possible_species = list(SPECIES_UNATHI)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	origin_restriction = list(/singleton/origin_item/origin/tza_lower)

	assigned_role = "Kazseres Resident"
	special_role = "Kazseres Resident"
	respawn_flag = null

/datum/ghostspawner/human/nbow_civ/post_spawn(mob/user)
	. = ..()

/datum/ghostspawner/human/nbow_civ/trader
	name = "Kazseres Merchant"
	short_name = "nbow_trader"
	spawnpoints = list("nbow_trader")
	max_count = 1
	assigned_role = "Kazseres Merchant"
	special_role = "Kazseres Merchant"

/datum/ghostspawner/human/nbow_civ/trader/post_spawn(mob/user)
	. = ..()
	renegades.add_antagonist(user.mind, do_not_equip = TRUE)

/datum/ghostspawner/human/nbow_civ/shaman
	name = "Kazseres Shaman"
	short_name = "nbow_shaman"
	spawnpoints = list("nbow_shaman")
	max_count = 1
	assigned_role = "Th'akh Shaman"
	special_role = "Th'akh Shaman"
	outfit = /obj/outfit/admin/moghes_thakh/shaman

/datum/ghostspawner/human/nbow_civ/shaman/post_spawn(mob/user)
	. = ..()
	renegades.add_antagonist(user.mind, do_not_equip = TRUE)

/datum/ghostspawner/human/nbow_civ/watch
	name = "Kazseres Watchman"
	short_name = "nbow_watch"
	spawnpoints = list("nbow_watch")
	desc = "Enforce the law in the town of Kazseres."
	max_count = 4
	outfit = /obj/outfit/admin/watchman
	assigned_role = "Kazseres Watchman"
	special_role = "Kazseres Watchman"

/datum/ghostspawner/human/nbow_civ/watch/post_spawn(mob/user)
	. = ..()
	renegades.add_antagonist(user.mind, do_not_equip = TRUE)

/obj/outfit/admin/watchman
	name = "Kazseres Watchman"
	uniform = /obj/item/clothing/under/unathi
	shoes = /obj/item/clothing/shoes/sandals/caligae/socks
	accessory = /obj/item/clothing/accessory/holster/hip/brown
	back = /obj/item/storage/backpack/satchel/leather
	belt = /obj/item/storage/belt/security/full/alt
	backpack_contents = list(
		/obj/item/clothing/suit/armor/carrier/generic = 1,
		/obj/item/clothing/head/helmet/security/generic = 1
	)
	l_ear = /obj/item/device/radio/headset/town
	id = /obj/item/card/id

/obj/outfit/admin/watchman/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H)
		return
	if(H.w_uniform)
		H.w_uniform.color = pick("#dad9d6", "#422c09")
		H.w_uniform.accent_color = pick("#dad9d6", "#422c09")
	if(H.shoes)
		H.shoes.color = "#423509"

/datum/ghostspawner/human/nbow_noble
	name = "Kazseres Noble"
	short_name = "nbow_noble"
	spawnpoints = list("nbow_noble")
	desc = "Rule the town of Kazseres."
	max_count = 1
	tags = list("External")

	extra_languages = list(LANGUAGE_UNATHI, LANGUAGE_AZAZIBA)
	outfit = /obj/outfit/admin/nbow_noble
	possible_species = list(SPECIES_UNATHI)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	origin_restriction = list(/singleton/origin_item/origin/tza_upper)
	respawn_flag = null
	assigned_role = "Noble"
	special_role = "Noble"

/datum/ghostspawner/human/nbow_noble/post_spawn(mob/user)
	. = ..()
	renegades.add_antagonist(user.mind, do_not_equip = TRUE)

/datum/ghostspawner/human/nbow_civ/servant
	name = "Kazseres Manservant"
	short_name = "nbow_servant"
	spawnpoints = list("nbow_servant")
	max_count = 1
	assigned_role = "Manservant"
	special_role = "Manservant"

/datum/ghostspawner/human/nbow_civ/servant/post_spawn(mob/user)
	renegades.add_antagonist(user.mind, do_not_equip = TRUE)

/obj/outfit/admin/nbow_noble
	uniform = /obj/item/clothing/under/unathi/mogazali
	suit = /obj/item/clothing/suit/unathi/jokfar/black
	shoes = /obj/item/clothing/shoes/sandals/caligae/socks
	suit_accessory = /obj/item/clothing/accessory/poncho/rockstone/red
	back = /obj/item/storage/backpack/satchel/leather
	r_pocket = /obj/item/storage/wallet/sol_rich
	l_ear = /obj/item/device/radio/headset/town

//Nralakk Federation
/datum/ghostspawner/human/nralakk
	name = "Nralakk Humanitarian Worker"
	short_name = "nralakk"
	desc = "Provide aid to Kazseres on behalf of the Nralakk Federation"
	tags = list("External")
	max_count = 4
	spawnpoints = list("nralakk")
	extra_languages = list(LANGUAGE_SKRELLIAN)
	outfit = /obj/outfit/admin/nralakk
	possible_species = list(SPECIES_SKRELL, SPECIES_SKRELL_AXIORI, SPECIES_DIONA, SPECIES_DIONA_COEUS, SPECIES_VAURCA_BULWARK, SPECIES_VAURCA_WORKER)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	assigned_role = "Nralakk Humanitarian Worker"
	special_role = "Nralakk Humanitarian Worker"
	respawn_flag = null
	uses_species_whitelist = FALSE

/datum/ghostspawner/human/nralakk/post_spawn(mob/user)
	. = ..()
	renegades.add_antagonist(user.mind, do_not_equip = TRUE)

/obj/outfit/admin/nralakk
	uniform = /obj/item/clothing/under/skrell/nralakk/ix/med
	shoes = /obj/item/clothing/shoes/jackboots/kala
	species_shoes = list(
		SPECIES_VAURCA_BULWARK = /obj/item/clothing/shoes/vaurca,
		SPECIES_VAURCA_WORKER = /obj/item/clothing/shoes/vaurca,
		SPECIES_DIONA = null,
		SPECIES_DIONA_COEUS = null
	)
	back = /obj/item/storage/backpack/kala
	id = /obj/item/card/id
	r_pocket = /obj/item/clothing/accessory/badge/passport/nralakk
	l_ear = /obj/item/device/radio/headset/skrell

/obj/outfit/admin/nralakk/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(isvaurca(H))
		H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/vaurca, slot_wear_mask)
		var/obj/item/organ/internal/vaurca/preserve/preserve = H.internal_organs_by_name[BP_PHORON_RESERVE]
		H.equip_or_collect(new /obj/item/reagent_containers/food/snacks/koisbar, slot_in_backpack)
		H.equip_or_collect(new /obj/item/reagent_containers/food/snacks/koisbar, slot_in_backpack)
		H.equip_or_collect(new /obj/item/reagent_containers/food/snacks/koisbar, slot_in_backpack)
		H.internal = preserve
		H.internals.icon_state = "internal1"
		H.update_body()
	if(H.is_diona())
		H.equip_or_collect(new /obj/item/device/uv_light(src), slot_in_backpack)

/obj/outfit/admin/nralakk/get_id_access()
	return list(ACCESS_SKRELL, ACCESS_MEDICAL)

/datum/ghostspawner/human/nralakk/leader
	name = "Nralakk Humanitarian Leader"
	short_name = "nralakk_lead"
	desc = "Lead the Federation humanitarian team."
	spawnpoints = list("nralakk_lead")
	max_count = 1
	outfit = /obj/outfit/admin/nralakk/leader
	possible_species = list(SPECIES_SKRELL, SPECIES_SKRELL_AXIORI)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	assigned_role = "Nralakk Humanitarian Leader"
	special_role = "Nralakk Humanitarian Leader"

/obj/outfit/admin/nralakk/leader
	uniform = /obj/item/clothing/under/skrell/nralakk/oqi/security
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = list(/obj/item/gun/energy/fedpistol = 1)

//Gawgaryn
/datum/ghostspawner/human/nbow_gawgaryn
	name = "Gawgaryn Raider"
	short_name = "gawgaryn"
	desc = "Survive as a Gawgaryn raider in the southern Tza Prairie."
	tags = list("External")
	mob_name_suffix = " Gawgaryn"
	mob_name_pick_message = "Pick an Unathi first name."

	max_count = 3
	spawnpoints = list("gawgaryn")

	extra_languages = list(LANGUAGE_UNATHI, LANGUAGE_AZAZIBA)
	outfit = /obj/outfit/admin/moghes_gawgaryn
	possible_species = list(SPECIES_UNATHI)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	origin_restriction = list(/singleton/origin_item/origin/wastelander)

	assigned_role = "Gawgaryn Raider"
	special_role = "Gawgaryn Raider"
	respawn_flag = null
	uses_species_whitelist = FALSE

/datum/ghostspawner/human/nbow_gawgaryn/post_spawn(mob/user)
	. = ..()
	renegades.add_antagonist(user.mind, do_not_equip = TRUE)
