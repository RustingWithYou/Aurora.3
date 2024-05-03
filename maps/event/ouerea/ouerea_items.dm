/obj/structure/notzar_statue
	name = "Hegemon Not'zar Izweski statue"
	desc = "A statue in grey marble depicting a finely-dressed Unathi, easily recognizable as Hegemon Not'zar Izweski. The statue holds a cane to one side, but does not appear to be leaning on it - treating it more like an accessory than a medical aid."
	icon = 'maps/event/ouerea/ouerea_statue.dmi'
	icon_state = "notzar"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_HUMAN_LAYER

/obj/structure/ouerea_unathi_statue
	name = "Faces of Revolution - Unathi"
	desc = "A statue in grey marble depicting an armored Unathi warrior holding a halberd. Their face is lifted towards the sky, with an expression of grim determination."
	icon = 'maps/event/ouerea/ouerea_statue.dmi'
	icon_state = "unathi"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_HUMAN_LAYER

/obj/structure/skrell_statue
	name = "Faces of Revolution - Skrell"
	desc = "A statue in grey marble depicting a cloaked Skrell with long headtails holding a staff. Unsurprisingly, their expression betrays no emotion."
	icon = 'maps/event/ouerea/ouerea_statue.dmi'
	icon_state = "skrell"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_HUMAN_LAYER

/obj/structure/human_statue
	name = "Faces of Revolution - Humanity"
	desc = "A statue in grey marble depicting an armored human holding an Unathi rifle. A soft smile is etched onto their face."
	icon = 'maps/event/ouerea/ouerea_statue.dmi'
	icon_state = "human"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_HUMAN_LAYER

/obj/item/paper/fluff/museum
	name = "declaration of war"
	desc = "A photocopy of a handwritten statement."
	info = "To the cowards of the Izweski, who would sell us as slaves to their alien puppeteers, I, King Don'zai Azarak, address this declaration of war. \
	You will not be allowed to despoil Moghes with your corruption - the Azarak Kingdom will fight you, if we must tear Skalamar to the ground brick by brick. I do not stand \
	alone in this - with me stands a mighty coalition of nations, who shall preserve the traditional ways of Moghes. The Kopesk States, the Kingdoms of Tza, Han'san, Kazhkz, Szek'hakh, Thos'karum and a thousand more stand with me, Izweski - \
	and yet you stand alone. Know that your days are numbered, and your empire of thugs and killers shall know a more honorable death than it deserves.<BR>\
	In My name and by My will,<BR>\
	Don'zai of the Clan Azarak,<BR>\
	Third of His Name,<BR>\
	King of the Vharzk Steppes and battle-commander of the Traditionalist Coalition."

/obj/item/paper/fluff/museum/Initialize()
	. = ..()
	var/languagetext = "\[lang=p\]"
	languagetext += "[info]\[/lang\]"
	info = parsepencode(languagetext)
	icon_state = "paper_words"

/obj/machinery/cryopod/living_quarters/hotel
	name = "reserved suites lift"
	desc = "A lift heading to the hotel's reserved suites."
	on_store_message = "has departed for"
	on_store_location = "the reserved suites"
	on_store_name = "Hotel Oversight System"
	on_enter_occupant_message = "The elevator door closes slowly, ready to bring you down to the hotel's reserved suites."

/obj/machinery/computer/cryopod/living_quarters/hotel
	name = "hotel oversight console"
	desc = "An interface between the hotel's main floor and the reserved suites for Horizon crew."

	storage_name = "Hotel Oversight Control"

/datum/shuttle/autodock/ferry/lift/hotel
	name = "Hotel Lift"
	location = 0
	shuttle_area = /area/turbolift/ouerea_hotel
	waypoint_station = "nav_hotel_bottom"
	waypoint_offsite = "nav_hotel_top"

/obj/effect/shuttle_landmark/lift/hotel_top
	name = "Grand Ouerean Hotel - Executive Level"
	landmark_tag = "nav_hotel_top"
	landmark_flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/ouerea_hotel
	base_turf = /turf/simulated/open

/obj/effect/shuttle_landmark/lift/hotel_bottom
	name = "Grand Ouerean Hotel - Main Level"
	landmark_tag = "nav_hotel_bottom"
	base_area = /area/ouerea_hotel
	base_turf = /turf/simulated/floor/plating

/obj/machinery/computer/shuttle_control/lift/hotel
	shuttle_tag = "Hotel Lift"

/obj/machinery/computer/shuttle_control/lift/wall/hotel
	shuttle_tag = "Hotel Lift"

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

/obj/outfit/admin/kataphract_vr/get_id_access()
	return list(ACCESS_KATAPHRACT, ACCESS_EXTERNAL_AIRLOCKS)

/obj/outfit/admin/kataphract_vr/heavy
	name = "Kataphract Heavy"
	suit = null
	head = null
	shoes = /obj/item/clothing/shoes/sandals/caligae
	back = /obj/item/rig/unathi/fancy/equipped
	suit_store = /obj/item/melee/energy/glaive/hegemony

/obj/outfit/admin/kataphract_vr/klax
	name = "Kataphract K'laxan"
	suit = /obj/item/clothing/suit/armor/unathi/klax
	head = /obj/item/clothing/head/helmet/unathi/klax
	shoes = /obj/item/clothing/shoes/magboots/vaurca
	accessory = /obj/item/clothing/accessory/storage/bandolier
	mask = /obj/item/clothing/mask/gas/vaurca/tactical
	accessory_contents = list(
		/obj/item/ammo_casing/slugger = 10
	)
	suit_store = /obj/item/gun/projectile/heavysniper/unathi
	belt_contents = list(
		/obj/item/melee/energy/sword/hegemony = 1,
		/obj/item/shield/energy/hegemony/kataphract = 1,
		/obj/item/gun/energy/pistol/hegemony = 1
	)

/obj/outfit/admin/kataphract_vr/klax/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(H?.wear_mask && H.species.has_organ[BP_PHORON_RESERVE])
		var/obj/item/organ/internal/vaurca/preserve/preserve = H.internal_organs_by_name[BP_PHORON_RESERVE]
		H.internal = preserve
		H.internals.icon_state = "internal1"
	var/obj/item/organ/A = new /obj/item/organ/internal/augment/language/klax(H)
	var/obj/item/organ/external/affected = H.get_organ(A.parent_organ)
	A.replaced(H, affected)
	var/obj/item/organ/internal/vaurca/neuralsocket/S = H.internal_organs_by_name[BP_NEURAL_SOCKET]
	qdel(S)
	H.update_body()

/obj/outfit/admin/izharshan_vr
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

/obj/outfit/admin/izharshan_vr/captain
	name = "Izharshan Raider Captain"
	suit = /obj/item/clothing/suit/space/void/unathi_pirate/captain
	head = /obj/item/clothing/head/helmet/space/void/unathi_pirate/captain
	accessory_contents = list(
		/obj/item/gun/projectile/pistol/super_heavy = 1
	)
	belt_contents = list(
		/obj/item/melee/energy/sword/pirate = 1,
		/obj/item/shield/energy = 1,
		/obj/item/ammo_magazine/super_heavy = 2,
		/obj/item/melee/hammer/powered = 1
	)

/obj/structure/fake_warform
	name = "Type BDE Warform Model"
	desc = "An enormous hexapodal Vaurca, with some strange yellow glow beneath its carapace. Upon closer examination, it appears to be a model."
	icon = 'maps/event/ouerea/ouerea_64x64.dmi'
	icon_state = "warform"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_OBJ_LAYER
	var/image/eye_overlay

/obj/structure/fake_warform/Initialize()
	. = ..()
	eye_overlay = image(icon, "overlay", plane = EFFECTS_ABOVE_LIGHTING_PLANE)
	eye_overlay.appearance_flags = KEEP_APART
	add_overlay(eye_overlay)
