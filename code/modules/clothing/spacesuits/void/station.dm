// Station voidsuits
//Engineering rig
/obj/item/clothing/head/helmet/space/void/engineering
	name = "engineering voidsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low-pressure environment. Has radiation shielding."
	icon = 'icons/obj/clothing/voidsuit/station/engineering.dmi'
	icon_state = "engineering_helm"
	item_state = "engineering_helm"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc", "vau")
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
	)
	max_pressure_protection = ENG_VOIDSUIT_MAX_PRESSURE
	light_overlay = "helmet_light_dual_low"
	brightness_on = 6

/obj/item/clothing/suit/space/void/engineering
	name = "engineering voidsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has radiation shielding."
	icon = 'icons/obj/clothing/voidsuit/station/engineering.dmi'
	icon_state = "engineering"
	item_state = "engineering"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc", "vau")
	slowdown = 1
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
	)
	max_pressure_protection = ENG_VOIDSUIT_MAX_PRESSURE
	allowed = list(/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/storage/bag/ore,/obj/item/device/t_scanner,/obj/item/pickaxe,/obj/item/material/twohanded/fireaxe,/obj/item/rfd/construction,/obj/item/storage/bag/inflatable)

//Mining rig
/obj/item/clothing/head/helmet/space/void/mining
	name = "mining voidsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Has reinforced plating."
	icon = 'icons/obj/clothing/voidsuit/station/mining.dmi'
	icon_state = "mining_helm"
	item_state = "mining_helm"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc", "vau")
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)
	light_overlay = "merc_voidsuit_lights"
	brightness_on = 6

/obj/item/clothing/suit/space/void/mining
	name = "mining voidsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has reinforced plating."
	icon = 'icons/obj/clothing/voidsuit/station/mining.dmi'
	icon_state = "mining"
	item_state = "mining"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc", "vau")
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)
	allowed = list(/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/storage/bag/ore,/obj/item/pickaxe, /obj/item/gun/custom_ka, /obj/item/gun/energy/vaurca/thermaldrill,/obj/item/rfd/mining)

//Medical Rig
/obj/item/clothing/head/helmet/space/void/medical
	name = "medical voidsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Has minor radiation shielding."
	icon = 'icons/obj/clothing/voidsuit/station/medical.dmi'
	icon_state = "medical_helm"
	item_state = "medical_helm"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc")
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		laser = ARMOR_LASER_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SMALL
	)
	light_overlay = "helmet_light_dual_low"
	brightness_on = 6

/obj/item/clothing/suit/space/void/medical
	name = "medical voidsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has minor radiation shielding."
	icon = 'icons/obj/clothing/voidsuit/station/medical.dmi'
	icon_state = "medical"
	item_state = "medical"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc")
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		laser = ARMOR_LASER_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SMALL
	)
	allowed = list(/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/storage/firstaid,/obj/item/device/healthanalyzer,/obj/item/stack/medical,/obj/item/device/breath_analyzer,/obj/item/material/twohanded/fireaxe)

	//Security
/obj/item/clothing/head/helmet/space/void/security
	name = "security voidsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Has an additional layer of armor."
	icon = 'icons/obj/clothing/voidsuit/station/security.dmi'
	icon_state = "security_helm"
	item_state = "security_helm"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc")
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MEDIUM,
		laser = ARMOR_LASER_PISTOL,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)
	light_overlay = "helmet_light_dual_low"
	brightness_on = 6

/obj/item/clothing/suit/space/void/security
	name = "security voidsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has an additional layer of armor."
	icon = 'icons/obj/clothing/voidsuit/station/security.dmi'
	icon_state = "security"
	item_state = "security"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc")
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MEDIUM,
		laser = ARMOR_LASER_PISTOL,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)
	allowed = list(/obj/item/gun,/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/melee/baton)

//Atmospherics Rig
/obj/item/clothing/head/helmet/space/void/atmos
	desc = "A special helmet designed for work in a hazardous, low pressure environments. Has improved thermal protection and minor radiation shielding."
	name = "atmospherics voidsuit helmet"
	icon = 'icons/obj/clothing/voidsuit/station/engineering.dmi'
	icon_state = "engineering"
	item_state = "engineering"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc", "vau")
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SMALL
	)
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE + 10000 // It is a suit designed for fire, enclosed
	max_pressure_protection = FIRESUIT_MAX_PRESSURE
	light_overlay = "helmet_light_dual_low"
	brightness_on = 6

/obj/item/clothing/suit/space/void/atmos
	name = "atmos voidsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has improved thermal protection and minor radiation shielding."
	icon = 'icons/obj/clothing/voidsuit/station/engineering.dmi'
	icon_state = "engineering"
	item_state = "engineering"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc", "vau")
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SMALL
	)
	max_pressure_protection = FIRESUIT_MAX_PRESSURE
	allowed = list(/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/storage/bag/ore,/obj/item/device/t_scanner,/obj/item/pickaxe,/obj/item/material/twohanded/fireaxe,/obj/item/rfd/construction,/obj/item/storage/bag/inflatable)
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE + 10000 // It is a suit designed for fire, enclosed

//Head of Security
/obj/item/clothing/head/helmet/space/void/hos
	name = "heavy security voidsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Has an additional layer of armor, and gold trim."
	icon = 'icons/obj/clothing/voidsuit/station/security.dmi'
	icon_state = "hos_helm"
	item_state = "hos_helm"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc")
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MEDIUM,
		laser = ARMOR_LASER_PISTOL,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
	)
	light_overlay = "helmet_light_dual"

/obj/item/clothing/suit/space/void/hos
	name = "heavy security voidsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has an additional layer of armor, and gold trim."
	icon = 'icons/obj/clothing/voidsuit/station/security.dmi'
	icon_state = "hos"
	item_state = "hos"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc")
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MEDIUM,
		laser = ARMOR_LASER_PISTOL,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
	)
	allowed = list(/obj/item/gun,/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/melee/baton)

	//Science
/obj/item/clothing/head/helmet/space/void/sci
	name = "research voidsuit helmet"
	desc = "A special helmet designed for usage by SCC research personnel in hazardous, low pressure environments."
	icon = 'icons/obj/clothing/voidsuit/station/research.dmi'
	icon_state = "research_helm"
	item_state = "research_helm"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc", "vau")
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		laser = ARMOR_LASER_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
	)

/obj/item/clothing/suit/space/void/sci
	name = "research voidsuit"
	desc = "A special suit that designed for usage by SCC research personnel in hazardous, low pressure environments."
	icon = 'icons/obj/clothing/voidsuit/station/research.dmi'
	icon_state = "research"
	item_state = "research"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc", "vau")
	allowed = list(/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit)
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		laser = ARMOR_LASER_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
	)
