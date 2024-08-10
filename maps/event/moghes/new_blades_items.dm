/obj/structure/statue/crowned_warrior
	name = "statue of King Okso Hutay'zai"
	icon = 'maps/event/moghes/statues.dmi'
	icon_state = "warrior_crown"
	desc = "A gray marble statue of a crowned and armored Unathi. A label on the plinth identifies him as King Okso I Hutay'zai."
	desc_extended = "King Okso I Hutay'zai, recorded as 'The Uniter' was the first king of Tza, who arose after the fall of the First Hegemony. Formerly the lord of Kutah, Okso led his armies to victory over the kingdoms of the Prairie, uniting his lands for the first time in history. He was slain by an assassin in the Year of Falling Stars, succeeded by Princess Lhizan Hutay'zai."

/obj/structure/statue/warrior
	name = "statue of a warrior"
	icon = 'maps/event/moghes/statues.dmi'
	icon_state = "warrior"
	desc = "A gray marble statue of an armored Unathi, bearing a vicious curved sword."
	desc_extended = "This statue depicts a traditional Tza warrior's attire, in honor of those who have fought and died for this land throughout the centuries."

/obj/structure/statue/king
	name = "statue of King Sskor Hutay'zai"
	icon = 'maps/event/moghes/statues.dmi'
	icon_state = "king"
	desc = "A gray marble statue of a crowned and armored Unathi. A label on the plinth identifies him as King Sskor V Hutay'zai."
	desc_extended = "King Sskor V Hutay'zai, recorded as 'The Undefeated', was the second-to-last king of Tza, who led the kingdom's forces for the majority of the Contact War. King Sskor presided over several of the Tza Kingdom's greatest victories during the war, most notably his victories in the Siege of Ura'mastyx and the Second Battle of Tak. He perished from sickness towards the end of the war, succeeded by his son Azui III Hutay'zai."

/obj/structure/statue/queen
	name = "statue of Queen Oriz Hutay'zai"
	icon = 'maps/event/moghes/statues.dmi'
	icon_state = "queen"
	desc = "A gray marble statue of a crowned and robed Unathi. A label on the plinth identifies her as Queen Okso VI Hutay'zai."
	desc_extended = "Queen Okso VI Hutay'zai, recorded as 'The Voice of Lights', ruled Tza during the days of the Second Hegemony. She was known as a great scholar of her time, having established the Kutah Academy of Natural Philosophy under her reign, and was responsible for the rapid modernisation of the kingdom's armies in the face of increasing Sarakus aggression. She perished of old age in the Year of Broken Stones, succeeded by Prince Vhariz II Hutay'zai."

/obj/structure/statue/warrior2
	name = "statue of a warrior"
	icon = 'maps/event/moghes/statues.dmi'
	icon_state = "unathi"
	desc = "A gray marble statue of an armored Unathi, bearing a halberd."
	desc_extended = "This statue depicts a Tza warrior's attire from the early Second Hegemony, in honor of those who have fought and died for this land throughout the centuries."

/obj/structure/statue/warrior3
	name = "statue of a warrior"
	icon = 'maps/event/moghes/statues.dmi'
	icon_state = "gun"
	desc = "A gray marble statue of an armored Unathi, bearing a rifle."
	desc_extended = "This statue depicts a Tza warrior's attire from the early Contact War, in honor of those who have fought and died for this land throughout the centuries."

/obj/structure/armor
	name = "suit of armor"
	icon = 'maps/event/moghes/nbow.dmi'
	icon_state = "armor"
	desc = "A well-preserved suit of bronze armor. A large and vicious-looking polearm has been placed in its hand."
	desc_extended = "This is a very old set of Moghesian armor, of a style common in the days of the First Hegemony. It seems to have been carefully preserved, and is well-polished. Engravings on the armor indicate that this particular set originated in the Tza Prairie."

/obj/structure/armor/mador
	name = "strange suit of armor"
	icon_state = "mador_armor"
	desc = "A well-preserved suit of bronze armor. A vicious-looking trident has been placed in its hands."
	desc_extended = "This armor is not of a style that has ever been common on Moghes - the large, rounded helmet and the layered metal skirt indicates that it is a Sinta'Mador relic, from the ancient Unathi of the north polar region."


/obj/structure/bed/stool/chair/throne
	name = "throne"
	desc = "A grand throne, rather simple in design. Carved from a dark wood."
	icon = 'maps/event/moghes/nbow_64.dmi'
	icon_state = "throne"
	base_icon = "throne"
	anchored = TRUE
	held_item = null
	can_pad = FALSE
	pixel_x = -1*WORLD_ICON_SIZE/2
	pixel_y = -1*WORLD_ICON_SIZE/2
	material_alteration = MATERIAL_ALTERATION_NONE

/obj/structure/bed/stool/chair/throne/New(var/newloc)
	..(newloc, MATERIAL_WOOD)

/obj/structure/fountain
	name = "fountain"
	desc = "A large ornamental fountain."
	icon = 'maps/event/moghes/nbow_64.dmi'
	icon_state = "fountain_g"
	anchored = TRUE

/obj/structure/sign/plaque
	name = "plaque"
	desc = null
	icon = 'icons/turf/decals/decals.dmi'
	icon_state = "plaque"

//VR outfits
/obj/outfit/admin/kataphract_vr
	name = "Kataphract Knight"
	uniform = /obj/item/clothing/under/unathi
	suit = /obj/item/clothing/suit/space/void/kataphract
	head = /obj/item/clothing/head/helmet/space/void/kataphract
	shoes = /obj/item/clothing/shoes/magboots/hegemony
	accessory = /obj/item/clothing/accessory/holster/hip/brown
	back = /obj/item/tank/jetpack/carbondioxide
	suit_store = /obj/item/tank/oxygen
	accessory_contents = list(
		/obj/item/gun/energy/pistol/hegemony = 1
	)
	belt = /obj/item/storage/belt/military
	belt_contents = list(
		/obj/item/melee/energy/sword/hegemony = 1,
		/obj/item/shield/energy/hegemony/kataphract = 1,
		/obj/item/melee/hammer/powered/hegemony = 1
	)
	id = /obj/item/card/id
	headset = null
	l_ear = null

/obj/outfit/admin/kataphract_vr/get_id_access()
	return list(ACCESS_KATAPHRACT, ACCESS_EXTERNAL_AIRLOCKS)

/obj/outfit/admin/pirate_vr
	name = "Izharshan Raider"
	uniform = /obj/item/clothing/under/unathi/izharshan
	suit = /obj/item/clothing/suit/space/void/unathi_pirate
	head = /obj/item/clothing/head/helmet/space/void/unathi_pirate
	shoes = /obj/item/clothing/shoes/magboots
	accessory = /obj/item/clothing/accessory/holster/hip/brown
	back = /obj/item/tank/jetpack/carbondioxide
	suit_store = /obj/item/tank/oxygen
	accessory_contents = list(
		/obj/item/gun/projectile/pistol/spitter = 1
	)
	belt = /obj/item/storage/belt/military
	belt_contents = list(
		/obj/item/melee/energy/sword/pirate = 1,
		/obj/item/shield/energy = 1,
		/obj/item/ammo_magazine/spitterpistol = 2
	)
	r_hand = /obj/random/civgun/rifle
	id = /obj/item/card/id
	headset = null

/obj/outfit/admin/izharshan_vr/get_id_access()
	return list(ACCESS_UNATHI_PIRATE, ACCESS_EXTERNAL_AIRLOCKS)

/obj/structure/chandelier
	name = "chandelier"
	desc = "A fancy ornament with suspended lights."
	light_color = COLOR_ORANGE
	icon = 'maps/event/moghes/chandelier.dmi'
	icon_state = "chandelier"
	anchored = TRUE
	density = FALSE
	light_wedge = LIGHT_OMNI
	light_range = 4
	light_power = 4
	layer = ABOVE_HUMAN_LAYER
