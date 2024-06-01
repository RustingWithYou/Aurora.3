/datum/ghostspawner/human/hotel_staff
	name = "Hotel Staff"
	short_name = "hotel_staff"
	desc = "Work at the Grand Ouerean Hotel, provide service with a smile!"
	max_count = 6
	spawnpoints = list("hotel")
	possible_species = list(SPECIES_UNATHI, SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_SKRELL_AXIORI, SPECIES_VAURCA_WORKER, SPECIES_VAURCA_BULWARK)
	outfit = /obj/outfit/admin/hotel_staff
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	uses_species_whitelist = FALSE
	respawn_flag = null
	assigned_role = "Grand Ouerean Hotel Staff"
	special_role = "Grand Ouerean Hotel Staff"
	password = "minimumwage"

/obj/outfit/admin/hotel_staff
	name = "Hotel Staff"
	uniform = /obj/item/clothing/under/waiter
	shoes = /obj/item/clothing/shoes/laceup
	species_shoes = list(
		SPECIES_UNATHI = /obj/item/clothing/shoes/footwraps,
		SPECIES_VAURCA_WORKER = /obj/item/clothing/shoes/vaurca,
		SPECIES_VAURCA_BULWARK = /obj/item/clothing/shoes/vaurca
	)
	id = /obj/item/card/id/hephaestus
	back = /obj/item/storage/backpack/satchel/leather
	l_pocket = /obj/item/storage/wallet/random
	l_ear = /obj/item/device/radio/headset/headset_service

/obj/outfit/admin/hotel_staff/get_id_access()
	return list(ACCESS_BAR, ACCESS_KITCHEN)

/datum/ghostspawner/human/hotel_security
	name = "Hotel Security"
	short_name = "hotel_sec"
	desc = "Keep the Grand Ouerean Hotel upscale and peaceful. Throw drunks in the tank."
	max_count = 4
	spawnpoints = list("hotel_sec")
	possible_species = list(SPECIES_UNATHI, SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_SKRELL_AXIORI, SPECIES_VAURCA_WARRIOR)
	uses_species_whitelist = FALSE
	outfit = /obj/outfit/admin/hotel_sec
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	respawn_flag = null
	assigned_role = "Grand Ouerean Hotel Security"
	special_role = "Grand Ouerean Hotel Security"
	password = "stopresisting"

/obj/outfit/admin/hotel_sec
	name = "Hotel Security"
	uniform = /obj/item/clothing/under/sl_suit
	shoes = /obj/item/clothing/shoes/laceup
	species_shoes = list(
		SPECIES_UNATHI = /obj/item/clothing/shoes/sandals/caligae/socks,
		SPECIES_VAURCA_WORKER = /obj/item/clothing/shoes/vaurca
	)
	accessory = /obj/item/clothing/accessory/holster/armpit/brown
	accessory_contents = list(/obj/item/gun/energy/taser = 1)
	belt = /obj/item/storage/belt/security/full
	id = /obj/item/card/id/hephaestus
	back = /obj/item/storage/backpack/satchel/leather
	l_pocket = /obj/item/storage/wallet/random
	l_ear = /obj/item/device/radio/headset/headset_sec

/obj/outfit/admin/hotel_sec/get_id_access()
	return list(ACCESS_BAR, ACCESS_KITCHEN, ACCESS_BRIG, ACCESS_SECURITY, ACCESS_CENT_GENERAL)

/datum/ghostspawner/human/hegemony_rep
	name = "Hegemony Representative"
	short_name = "heg_rep"
	desc = "Represent the Izweski Hegemony"
	spawnpoints = list("rep")
	max_count = 1
	possible_species = list(SPECIES_UNATHI)
	outfit = /obj/outfit/admin/hegemony_rep
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	respawn_flag = null
	assigned_role = "Hegemony Representative"
	special_role = "Hegemony Representative"
	password = "honor"

/obj/outfit/admin/hegemony_rep
	uniform = /obj/item/clothing/under/unathi/mogazali/blue
	shoes = /obj/item/clothing/shoes/sandals
	accessory = /obj/item/clothing/accessory/poncho/rockstone/red
	backpack_contents = list(/obj/item/gun/energy/pistol/hegemony = 1)
	id = /obj/item/card/id
	back = /obj/item/storage/backpack/satchel/leather
	l_pocket = /obj/item/storage/wallet/sol_rich
	l_ear = /obj/item/device/radio/headset

/obj/outfit/admin/hegemony_rep/get_id_access()
	return list(ACCESS_CENT_GENERAL)

/datum/ghostspawner/human/heph_rep
	name = "Hephaestus Representative"
	short_name = "heph_rep"
	desc = "Represent Hephaestus Industries"
	spawnpoints = list("rep")
	max_count = 1
	possible_species = list(SPECIES_HUMAN, SPECIES_UNATHI)
	uses_species_whitelist = FALSE
	outfit = /obj/outfit/admin/heph_rep
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	respawn_flag = null
	assigned_role = "Hephaestus Representative"
	special_role = "Hephaestus Representative"
	password = "unionsbad"

/obj/outfit/admin/heph_rep
	head = /obj/item/clothing/head/beret/corporate/heph
	uniform = /obj/item/clothing/under/rank/liaison/heph
	suit = /obj/item/clothing/suit/storage/liaison/heph
	id = /obj/item/card/id/hephaestus
	accessory = /obj/item/clothing/accessory/tie/corporate/heph
	suit_accessory = /obj/item/clothing/accessory/pin/corporate/heph
	back = /obj/item/storage/backpack/satchel/heph
	l_pocket = /obj/item/storage/wallet/sol_rich
	backpack_contents = list(/obj/item/stamp/hephaestus = 1)

/obj/outfit/admin/heph_rep/get_id_access()
	return list(ACCESS_CENT_GENERAL)

/datum/ghostspawner/human/fed_rep
	name = "Nralakk Representative"
	short_name = "fed_rep"
	desc = "Represent the Nralakk Federation"
	spawnpoints = list("rep")
	max_count = 1
	possible_species = list(SPECIES_SKRELL, SPECIES_SKRELL_AXIORI)
	uses_species_whitelist = FALSE
	outfit = /obj/outfit/admin/fed_rep
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	respawn_flag = null
	assigned_role = "Nralakk Federation Representative"
	special_role = "Nralakk Federation Representative"
	password = "warble"

/obj/outfit/admin/fed_rep
	uniform = /obj/item/clothing/under/skrell
	shoes = /obj/item/clothing/shoes/laceup
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = list(/obj/item/gun/energy/fedpistol = 1)
	back = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(/obj/item/clothing/accessory/badge/passport/nralakk = 1)
	l_pocket = /obj/item/storage/wallet/sol_rich
	l_ear = /obj/item/device/radio/headset
	id = /obj/item/card/id

/obj/outfit/admin/fed_rep/get_id_access()
	return list(ACCESS_CENT_GENERAL)

/datum/ghostspawner/human/hive_rep
	name = "K'lax Representative"
	short_name = "hive_rep"
	desc = "Represent the K'lax Hive. Assure people it's barely even a civil war."
	spawnpoints = list("rep")
	max_count = 1
	possible_species = list(SPECIES_VAURCA_BREEDER)
	uses_species_whitelist = FALSE
	outfit = /obj/outfit/admin/hive_rep
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	respawn_flag = null
	assigned_role = "K'lax Hive Representative"
	special_role = "K'lax Hive Representative"
	password = "nowarinheavenhere"

/obj/outfit/admin/hive_rep
	uniform = /obj/item/clothing/under/gearharness
	suit = /obj/item/clothing/suit/vaurca/breeder/klax
	shoes = /obj/item/clothing/shoes/vaurca/breeder/klax
	mask = /obj/item/clothing/mask/gas/vaurca/filter
	head = /obj/item/clothing/head/vaurca_breeder/klax/flag
	back = /obj/item/storage/backpack/typec/klax
	suit_accessory = /obj/item/clothing/accessory/vaurca_breeder/rockstone_cape/red
	id = /obj/item/card/id

/obj/outfit/admin/hive_rep/post_equip(mob/living/carbon/human/H, visualsOnly)
	var/obj/item/organ/internal/vaurca/preserve/preserve = H.internal_organs_by_name[BP_PHORON_RESERVE]
	H.internal = preserve
	H.internals.icon_state = "internal1"
	H.equip_or_collect(new /obj/item/reagent_containers/food/snacks/koisbar, slot_in_backpack)
	H.update_body()

/obj/outfit/admin/hive_rep/get_id_access()
	return list(ACCESS_CENT_GENERAL)
