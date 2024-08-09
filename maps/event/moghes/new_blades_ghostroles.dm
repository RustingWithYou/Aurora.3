//Palace Staff
/datum/ghostspawner/human/servant
	name = "Hutay'zai Servant"
	short_name = "servant"
	desc = "A servant at the estate of Overlord Hutay'zai."
	tags = list("External")
	extra_languages = list(LANGUAGE_UNATHI, LANGUAGE_AZAZIBA)
	max_count = 6
	spawnpoints = list("servant")
	possible_species = list(SPECIES_UNATHI)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	outfit = /obj/outfit/admin/servant

	assigned_role = "Palace Staff"
	special_role = "Palace Staff"
	respawn_flag = null
	uses_species_whitelist = FALSE

/datum/ghostspawner/human/servant/post_spawn(mob/user)
	. = ..()
	renegades.add_antagonist(user.mind, do_not_equip = TRUE)

/obj/outfit/admin/servant
	uniform = /obj/item/clothing/under/unathi/brown
	shoes = /obj/item/clothing/shoes/sandals/caligae
	back = /obj/item/storage/backpack/satchel/leather
	id = /obj/item/card/id
	l_pocket = /obj/item/storage/wallet/random
	l_ear = /obj/item/device/radio/headset

/obj/outfit/admin/servant/get_id_access(mob/living/carbon/human/H)
	return list(ACCESS_BAR,ACCESS_KITCHEN)

/datum/ghostspawner/human/guard
	name = "Palace Guard"
	short_name = "guard"
	desc = "A guard at the estate of Overlord Hutay'zai."
	tags = list("External")
	extra_languages = list(LANGUAGE_UNATHI, LANGUAGE_AZAZIBA)
	max_count = 4
	spawnpoints = list("guard")
	possible_species = list(SPECIES_UNATHI)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	outfit = /obj/outfit/admin/guard

	assigned_role = "Palace Guard"
	special_role = "Palace Guard"
	respawn_flag = null
	uses_species_whitelist = FALSE

/obj/outfit/admin/guard
	uniform = /obj/item/clothing/under/unathi/zazali/white
	shoes = /obj/item/clothing/shoes/sandals/caligae
	id = /obj/item/card/id
	l_pocket = /obj/item/storage/wallet/random
	l_ear = /obj/item/device/radio/headset/distress
	belt = /obj/item/storage/belt/military
	belt_contents = list(
		/obj/item/melee/baton/loaded = 1,
		/obj/item/melee/energy/sword/hegemony = 1,
		/obj/item/shield/energy/hegemony/kataphract = 1,
		/obj/item/handcuffs = 2,
		/obj/item/device/flash = 1
	)
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = list(/obj/item/gun/energy/pistol/hegemony = 1)
	back = /obj/item/rig/unathi/fancy/equipped
	r_hand = /obj/item/melee/energy/glaive/hegemony

/obj/outfit/admin/guard/get_id_access()
	return list(ACCESS_KATAPHRACT,ACCESS_SECURITY)

/datum/ghostspawner/human/noble
	name = "Noble Guest"
	short_name = "noble"
	desc = "A guest at the estate of Overlord Hutay'zai."
	tags = list("External")
	extra_languages = list(LANGUAGE_UNATHI, LANGUAGE_AZAZIBA)
	max_count = 4
	spawnpoints = list("noble")
	possible_species = list(SPECIES_UNATHI)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	outfit = /obj/outfit/admin/noble

	assigned_role = "Guest"
	special_role = "Guest"
	respawn_flag = null
	uses_species_whitelist = FALSE

/obj/outfit/admin/noble
	uniform = /obj/item/clothing/under/unathi/mogazali
	shoes = /obj/item/clothing/shoes/sandals/caligae
	id = /obj/item/card/id
	l_pocket = /obj/item/storage/wallet/sol_rich
	back = /obj/item/storage/backpack/satchel/leather
	l_ear = /obj/item/device/radio/headset

/datum/ghostspawner/human/nralakk
	name = "Nralakk Diplomat"
	short_name = "nralakk"
	desc = "A Federation diplomat at the estate of Overlord Hutay'zai."
	tags = list("External")
	max_count = 2
	spawnpoints = list("nralakk")
	possible_species = list(SPECIES_SKRELL,SPECIES_SKRELL_AXIORI,SPECIES_DIONA,SPECIES_VAURCA_BREEDER)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	outfit = /obj/outfit/admin/nralakk

	assigned_role = "Federation Representative"
	special_role = "Federation Representative"
	respawn_flag = null
	uses_species_whitelist = TRUE

/obj/outfit/admin/nralakk
	uniform = /obj/item/clothing/under/skrell
	shoes = /obj/item/clothing/shoes/laceup
	l_pocket = /obj/item/storage/wallet/sol_rich
	r_pocket = /obj/item/clothing/accessory/badge/passport/nralakk
	back = /obj/item/storage/backpack/satchel/leather
	l_ear = /obj/item/device/radio/headset

/obj/outfit/admin/nralakk/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(H)
		if(isskrell(H))
			H.equip_to_slot_or_del(new /obj/item/gun/energy/fedpistol(H), slot_belt)
		if(isvaurca(H)) // there should be a system for this but for now this will have to do i guess
			H.equip_to_slot_or_del(new /obj/item/clothing/under/gearharness(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/vaurca_breeder/nralakk(H), slot_head)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/vaurca/breeder/cthur(H), slot_shoes)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/vaurca/filter(H), slot_wear_mask)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/vaurca/breeder/cthur(H), slot_wear_suit)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/typec/cthur(H), slot_back)
			H.equip_to_slot_or_del(new /obj/item/gun/energy/fedpistol/nopsi(H), slot_belt)
			H.equip_or_collect(new /obj/item/reagent_containers/food/snacks/koisbar(H), slot_in_backpack)
			H.equip_or_collect(new /obj/item/reagent_containers/food/snacks/koisbar(H), slot_in_backpack)
			H.equip_or_collect(new /obj/item/reagent_containers/food/snacks/koisbar(H), slot_in_backpack)
		else
			H.equip_to_slot_or_del(new /obj/item/gun/energy/fedpistol/nopsi(H), slot_belt)
			H.equip_or_collect(new /obj/item/device/uv_light(H), slot_in_backpack)

/datum/ghostspawner/human/hutayzai
	name = "Overlord Hutay'zai"
	short_name = "hutayzai"
	desc = "The man himself."
	tags = list("External")
	max_count = 1
	possible_species = list(SPECIES_UNATHI)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	outfit = /obj/outfit/admin/hutayzai

	assigned_role = "Overlord"
	special_role = "Overlord"
	respawn_flag = null
	uses_species_whitelist = TRUE

/obj/outfit/admin/hutayzai
	uniform = /obj/item/clothing/under/unathi/mogazali/blue
	shoes = /obj/item/clothing/shoes/sandals/caligae
	back = /obj/item/storage/backpack/satchel/leather
	r_pocket = /obj/item/melee/energy/sword/hegemony
	id = /obj/item/card/id
	l_ear = /obj/item/device/radio/headset/distress
