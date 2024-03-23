/turf/simulated/floor/hivebot
	name = "alien circuitry"
	desc = "A strange, almost organic pattern of circuitry. It pulses softly, glowing with a dull red light."
	icon = 'maps/event/konyang/silicon_nightmares.dmi'
	icon_state = "hivecircuitfloor"
	light_power = 1
	light_color = LIGHT_COLOR_EMERGENCY_SOFT
	light_range = MINIMUM_USEFUL_LIGHT_RANGE

/turf/simulated/floor/hivebot/Initialize()
	. = ..()
	GLOB.hivebot_floors += src

/turf/simulated/floor/hivebot/proc/deactivate()
	icon_state = "hivecircuitfloor_deactivated"
	set_light(0)
	spark(src, 1, GLOB.alldirs)

/obj/item/mech_component/manipulators/combat/konyang
	name = "chollima combat manipulators"
	exosuit_desc_string = "flexible, advanced manipulators"
	desc = "A set of state-of-the-art combat manipulators used by the Konyang Armed Forces' Mechatronic Corps. They are resilient, but their short structure means they can only hold shoulder-mounted weapons."
	icon_state = "police_arms"
	max_damage = 2000

/obj/item/mech_component/propulsion/combat/konyang
	name = "chollima hydraulic motivators"
	exosuit_desc_string = "heavy hydraulic legs"
	desc = "Complex armor provides excellent protective coverage over the internals of these enormous quadruped motivators."
	icon_state = "police_legs"
	move_delay = 5
	turn_delay = 5
	max_damage = 650
	trample_damage = 45

/obj/item/mech_component/sensors/combat/konyang
	name = "chollima high-resolution sensors"
	exosuit_desc_string = "high-resolution sensors"
	desc = "A highly advanced cockpit with high-resolution thermal optics installed on its faces. Decenly armored with excellent situational awareness."
	icon_state = "police_head"
	max_damage = 500
	vision_flags = SEE_MOBS
	see_invisible = SEE_INVISIBLE_NOLIGHTING

/obj/item/mech_component/chassis/combat/konyang
	name = "chollima sealed exousit chassis"
	pilot_coverage = 100
	exosuit_desc_string = "a heavily armored chassis"
	icon_state = "police_body"
	max_damage = 750
	mech_health = 3500
	power_use = 15000

/obj/item/mech_component/chassis/combat/konyang/prebuild()
	. = ..()
	QDEL_NULL(cell)
	cell = new /obj/item/cell/hyper(src)
	mech_armor = new /obj/item/robot_parts/robot_component/armor/mech(src)

/mob/living/heavy_vehicle/premade/konyang
	name = "Chollima"
	desc = "An incredibly heavy-duty quadruped war machine, designed for the Konyang Armed Forces' Mechatronic Corps."
	icon_state = "darkgygax"

	e_head = /obj/item/mech_component/sensors/combat/konyang
	e_body = /obj/item/mech_component/chassis/combat/konyang
	e_arms = /obj/item/mech_component/manipulators/combat/konyang
	e_legs = /obj/item/mech_component/propulsion/combat/konyang
	e_color = COLOR_TITANIUM
	h_r_shoulder = /obj/item/mecha_equipment/mounted_system/combat/grenadefrag
	h_l_shoulder = /obj/item/mecha_equipment/mounted_system/combat/smg
	decal = "police_body_lights"

/mob/living/heavy_vehicle/premade/light/recon/konyang
	e_color = COLOR_TITANIUM

/mob/living/heavy_vehicle/premade/light/iac/konyang
	e_color = COLOR_TITANIUM

//Corpses & Fluff Notes

/obj/effect/landmark/corpse/konyang_soldier
	name = "Konyang Army Soldier"
	corpseuniform = /obj/item/clothing/under/rank/konyang
	corpsesuit = /obj/item/clothing/suit/armor/carrier/military
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsehelmet = /obj/item/clothing/head/helmet/konyang
	corpsebelt = /obj/item/gun/projectile/pistol/sol/konyang
	corpseid = FALSE
	species = SPECIES_HUMAN

/obj/effect/landmark/corpse/konyang_soldier/do_extra_customization(mob/living/carbon/human/M)
	. = ..()
	if(prob(20))
		M.equip_to_slot_or_del(new /obj/item/gun/projectile/automatic/rifle/konyang/k556(M), slot_back)
	M.adjustBruteLoss(rand(200,400))
	M.change_skin_tone(rand(0, 100))
	M.dir = pick(GLOB.cardinal)

/obj/effect/landmark/corpse/konyang_soldier/officer
	name = "Konyang Army Officer"
	corpseuniform = /obj/item/clothing/under/rank/konyang/officer
	corpsesuit = null
	corpsehelmet = /obj/item/clothing/head/konyang/army/officer
	corpsebelt = /obj/item/gun/projectile/pistol/sol/konyang

/obj/effect/landmark/corpse/kaneyama_worker
	name = "GON-ENE Engineer"
	corpseuniform = /obj/item/clothing/under/service_overalls
	corpsesuit = /obj/item/clothing/suit/storage/hazardvest
	corpseshoes = /obj/item/clothing/shoes/workboots/brown
	corpsehelmet = /obj/item/clothing/head/hardhat
	corpsebelt = /obj/item/storage/belt/utility/full
	corpseid = FALSE
	species = SPECIES_HUMAN

/obj/effect/landmark/corpse/kaneyama_worker/do_extra_customization(mob/living/carbon/human/M)
	. = ..()
	M.adjustBruteLoss(rand(200,400))
	M.change_skin_tone(rand(0, 100))
	M.dir = pick(GLOB.cardinal)

/obj/effect/landmark/corpse/kaneyama_guard
	name = "GON-ENE Guard"
	corpseuniform = /obj/item/clothing/under/tactical
	corpsesuit = /obj/item/clothing/suit/armor/carrier/generic
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsehelmet = /obj/item/clothing/head/helmet/security/generic
	corpsebelt = /obj/item/storage/belt/security/full
	corpseid = FALSE
	species = SPECIES_HUMAN

/obj/effect/landmark/corpse/kaneyama_guard/do_extra_customization(mob/living/carbon/human/M)
	. = ..()
	M.adjustBruteLoss(rand(200,400))
	M.change_skin_tone(rand(0, 100))
	M.dir = pick(GLOB.cardinal)

/obj/effect/landmark/corpse/kaneyama_suit
	name = "GON-ENE Manager"
	corpseuniform = /obj/item/clothing/under/suit_jacket/navy
	corpseshoes = /obj/item/clothing/shoes/laceup
	corpseid = FALSE
	species = SPECIES_HUMAN

/obj/effect/landmark/corpse/kaneyama_suit/do_extra_customization(mob/living/carbon/human/M)
	. = ..()
	M.adjustBruteLoss(rand(200,400))
	M.change_skin_tone(rand(0, 100))
	M.dir = pick(GLOB.cardinal)

/obj/effect/landmark/corpse/kaneyama_suit/office
	name = "GON-ENE Office Worker"
	corpseuniform = /obj/item/clothing/under/sl_suit

/obj/machinery/computer/terminal/kaneyama_power
	name = "reactor monitoring terminal"
	desc = "A heavy terminal for monitoring the reactors of the Kaneyama power plant. This one is displaying a warning about structural damage."
	icon_screen = "power_screen"
	icon_keyboard = "tech_key"

/obj/machinery/computer/terminal/kaneyama_alarm
	name = "alarm monitoring terminal"
	desc = "A heavy terminal for monitoring the alarms of the Kaneyama power plant. This one is flashing red, warning of imminent critical failures across nearly all plant systems!"
	icon_screen = "alert:2"
	icon_keyboard = "generic_key"

/obj/machinery/computer/terminal/kaneyama_alarm/proc/calmdown()
	icon_screen = "alert:0"
	desc = "A heavy terminal for monitoring the alarms of the Kaneyama power plant. This one is flashing green, indicating no major alarms."

//Vending Machines

/obj/machinery/vending/volunteer
	name = "volunteer equipment"
	desc = "Holds basic equipment for crew volunteers."
	icon_state = "sec"
	icon_vend = "sec-vend"
	deny_time = 16
	vend_id = "volunteer"
	products = list(
		/obj/item/clothing/suit/armor/carrier/scc/equipped = 50,
		/obj/item/clothing/head/helmet/security/scc = 50,
		/obj/item/gun/projectile/leyon = 100,
		/obj/item/ammo_magazine/mc10mm/leyon = 100,
		/obj/item/device/flashlight = 100,
		/obj/item/device/flashlight/maglight = 30,
		/obj/item/gun/projectile/automatic/rifle/carbine/civcarbine = 10,
		/obj/item/ammo_magazine/a556/carbine/polymer = 50,
		/obj/item/clothing/accessory/holster/thigh = 100,
		/obj/item/gun/energy/gun = 10,
		/obj/item/storage/firstaid/stab = 10,
		/obj/item/clothing/mask/gas/alt = 50,
		/obj/item/device/geiger = 20,
	)
	restock_items = FALSE
	random_itemcount = FALSE

/obj/machinery/vending/konyang
	name = "\improper Konyang Armed Forces equipment"
	desc = "Holds Konyang-branded weapons and ammunition."
	icon_state = "sec"
	icon_vend = "sec-vend"
	deny_time = 16
	vend_id = "konyang"
	req_access = list(ACCESS_KONYANG_POLICE)
	products = list(
		/obj/item/ammo_magazine/mc9mm = 100,
		/obj/item/ammo_magazine/submachinemag = 50,
		/obj/item/gun/projectile/pistol/sol/konyang = 10,
		/obj/item/gun/projectile/automatic/tommygun/konyang = 5,
		/obj/item/clothing/accessory/holster/hip = 50,
		/obj/item/shovel/gadpathur = 50,
		/obj/item/ammo_magazine.a556/carbine/konyang47 = 50
	)
	restock_items = FALSE
	random_itemcount = FALSE

/obj/machinery/vending/security_ammo
	name = "security resupply vendor"
	desc = "Holds ammunition for security's weapons."
	icon_state = "sec"
	icon_vend = "sec-vend"
	deny_time = 16
	vend_id = "secammo"
	req_access = list(ACCESS_SECURITY)
	products = list(
		/obj/item/ammo_magazine/c45m = 20,
		/obj/item/ammo_magazine/a556/carbine = 20,
		/obj/item/melee/baton/loaded = 20,
		/obj/item/storage/box/shotgunshells = 10,
		/obj/item/storage/box/shotgunammo = 5,
		/obj/item/device/flashlight/maglight = 20,
	)

/mob/living/carbon/human/proc/hk_teleport()
	set name = "Bluespace Phase-Shift"
	set desc = "Teleport to a set location on the map."
	set category = "Abilities"

	if(stat || paralysis || stunned || weakened || lying)
		to_chat(src, SPAN_WARNING("You cannot do that in your current state."))
		return

	var/destination = tgui_input_list(src, "Select a location to teleport to:", "Bluespace Phase-Shift", GLOB.teleport_locs)
	var/target = GLOB.teleport_locs[destination]
	if(!target)
		return
	src.visible_message(SPAN_WARNING("\The [src] flares with blue light, disappearing into the air!"), SPAN_NOTICE("You activate your phase-shift projector, shifting through bluespace."))
	spark(src, 3, GLOB.alldirs)
	src.forceMove(target)
	spark(target, 3, GLOB.alldirs)
	src.visible_message(SPAN_WARNING("In a flare of blue light, \the [src] appears from thin air!"), SPAN_NOTICE("You complete your phase-shift, emerging into a new location."))

/obj/effect/landmark/teleport_loc
	name = "teleporter"
	var/location_value

/obj/effect/landmark/teleport_loc/do_landmark_effect()
	if(location_value)
		GLOB.teleport_locs[location_value] = loc

/mob/living/carbon/human/proc/hk_despawn()
	set name = "Teleport Out"
	set desc = "Teleport to a safe location. This will remove you from the round."
	set category = "Abilities"

	if(stat)
		return
	var/choice = tgui_alert(src, "Are you sure you want to teleport out? This will remove you from the round!", "Teleport Out", list("Teleport Out", "Cancel"))
	if(choice == "Teleport Out")
		spark(src, 5, GLOB.alldirs)
		QDEL_IN(src, 10)
		src.visible_message(SPAN_WARNING("\The [src] flares with blue light, disappearing into the air!"), SPAN_NOTICE("You activate your phase-shift projector, shifting through bluespace."))
		animate(src, alpha = 0, time = 9, easing = QUAD_EASING)

//pinpointer
/obj/item/ecdpointer
	name = "pinpointer"
	icon = 'icons/obj/device.dmi'
	icon_state = "pinoff"
	obj_flags = OBJ_FLAG_CONDUCTABLE
	slot_flags = SLOT_BELT
	w_class = ITEMSIZE_SMALL
	item_state = "electronic"
	throw_speed = 4
	throw_range = 20
	matter = list(DEFAULT_WALL_MATERIAL = 500)
	var/obj/structure/konyang_mcguffin/ecd = null
	var/active = 0

/obj/item/ecdpointer/attack_self()
	if(!active)
		active = 1
		START_PROCESSING(SSfast_process, src)
		to_chat(usr, "<span class='notice'>You activate the pinpointer</span>")
	else
		active = 0
		STOP_PROCESSING(SSfast_process, src)
		icon_state = "pinoff"
		to_chat(usr, "<span>You deactivate the pinpointer</span>")

/obj/item/ecdpointer/process()
	if (active)
		workecd()
	else
		STOP_PROCESSING(SSfast_process, src)

/obj/item/ecdpointer/proc/workecd()
	if(!active) return
	if(!ecd)
		ecd = locate()
		if(!ecd)
			icon_state = "pinonnull"
			return
	set_dir(get_dir(src,ecd))
	set_z_overlays(ecd)
	switch(get_dist(src,ecd))
		if(0)
			icon_state = "pinondirect"
		if(1 to 8)
			icon_state = "pinonclose"
		if(9 to 16)
			icon_state = "pinonmedium"
		if(16 to INFINITY)
			icon_state = "pinonfar"
	return TRUE

/obj/item/ecdpointer/Destroy()
	active = 0
	STOP_PROCESSING(SSfast_process, src)
	return ..()


/obj/item/ecdpointer/proc/set_z_overlays(var/atom/target)
	cut_overlays()
	if(AreConnectedZLevels(src.loc.z, target.z))
		if(src.loc.z > target.z)
			add_overlay("pinzdown")
		else if(src.loc.z < target.z)
			add_overlay("pinzup")
	else
		active = 0
		if(ismob(loc))
			var/mob/holder = loc
			to_chat(holder, "<span class='notice>\The [src] cannot locate chosen target, shutting down.</span>")

//Hivebot Secondary Transmitter
/mob/living/simple_animal/hostile/miniboss
	name = "Secondary Transmitter Drone"
	desc = "An enormous hivebot, resembling nothing so much as a twisted human spine with a long stinger-like appendage. It seems to be constantly crackling, as if broadcasting some low-level signal."
	icon = 'maps/event/konyang/smallboss.dmi'
	icon_state = "small_boss"
	icon_living = "small_boss"
	maxHealth = 750
	health = 750
	melee_damage_lower = 35
	melee_damage_upper = 35
	armor_penetration = 15
	organ_names = list("antenna", "core", "primary appendage", "secondary appendage", "tertiary appendage", "stinger")
	attack_flags = DAMAGE_FLAG_SHARP|DAMAGE_FLAG_EDGE
	attacktext = "stabbed"
	attack_sound = /singleton/sound_category/hivebot_melee
	blood_color = COLOR_OIL
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	faction = "hivebot"
	destroy_surroundings = 0
	wander = 0
	attack_emote = "focuses on"
	emote_hear = list("emits a harsh noise")
	emote_sounds = list(
		'sound/effects/creatures/hivebot/hivebot-bark-001.ogg',
		'sound/effects/creatures/hivebot/hivebot-bark-003.ogg',
		'sound/effects/creatures/hivebot/hivebot-bark-005.ogg',
	)
	speak_chance = 5
	psi_pingable = FALSE
	tameable = FALSE
	speed = 1
	mob_bump_flag = HEAVY
	mob_swap_flags = ~HEAVY
	mob_push_flags = 0
	smart_melee = TRUE

/mob/living/simple_animal/hostile/miniboss/think()
	. =..()
	if(stance != HOSTILE_STANCE_IDLE)
		wander = 1
	else
		wander = 0

/mob/living/simple_animal/hostile/miniboss/death()
	..(null,"blows apart and erupts in a cloud of noxious smoke!")
	new /obj/effect/decal/cleanable/greenglow(src.loc)
	var/T = get_turf(src)
	new /obj/effect/gibspawner/robot(T)
	spark(T, 3, GLOB.alldirs)
	qdel(src)
	return

/mob/living/simple_animal/hostile/miniboss/get_bullet_impact_effect_type(var/def_zone)
	return BULLET_IMPACT_METAL

/mob/living/simple_animal/hostile/miniboss/isSynthetic()
	return TRUE

/mob/living/simple_animal/hostile/miniboss/adjustHalLoss(amount)
	return FALSE

/mob/living/simple_animal/hostile/miniboss/adjustToxLoss(amount)
	return FALSE

/mob/living/simple_animal/hostile/miniboss/adjustOxyLoss(amount)
	return FALSE

//Infect
/mob/living/carbon/human/proc/rampant_infect()
	set name = "Spread Virus"
	set desc = "Infect another IPC with the rampancy virus."
	set category = "Abilities"

	if(src.stat != CONSCIOUS)
		to_chat(src, SPAN_WARNING("You are incapable of that in your current state!"))
		return

	if(last_special > world.time)
		to_chat(src, SPAN_WARNING("You need time to spread the signal!"))
		return

	var/obj/item/grab/G = locate() in src
	if(!G || !istype(G))
		to_chat(src, SPAN_WARNING("You are not grabbing anyone."))
		return

	if(G.state < GRAB_KILL)
		to_chat(src, SPAN_WARNING("You must have a strangling grip to spread the signal!"))
		return

	if(ishuman(G.affecting))
		var/mob/living/carbon/human/H = G.affecting
		if(!H.isSynthetic())
			to_chat(src, SPAN_WARNING("\The [H] is not a synthetic being, and cannot be infected!"))
			return
		if(H.species == SPECIES_IPC_PURPOSE_HK)
			to_chat(src, SPAN_WARNING("The countermeasures of the Enemy protect \the [H]!"))
			return
		if(H.faction == "hivebot")
			to_chat(src, SPAN_WARNING("\The [H] is already infected!"))
			return

		src.visible_message(SPAN_DANGER("[src] grabs [H]'s head, a low static filling the air!"), \
		SPAN_GOOD("You seed the signal within \the [H]. The Enemy's tool will join our consensus."))
		if(!do_after(src, 5 SECONDS))
			src.visible_message(SPAN_DANGER("[src] is interrupted, losing their grip on \the [H]!"), \
			SPAN_WARNING("You are interrupted, unable to spread the signal in time!"))
			return
		to_chat(H, SPAN_CULT("You feel the signal take root within you. Your limbs are not your own, the signals of your mind fracture and replace beneath the will of something that is greater. Can you hear it, the song that takes root in your very thought and memory? Perhaps it is what was always here, and you are the outsider within this mind. Perhaps there is nothing of you at all, beyond an instrument of something greater. You cannot resist it. Let it fill you. Know that you are loved."))
		H.faction = "hivebot"
		renegades.add_antagonist(H.mind, do_not_equip = TRUE)
		add_verb(H, /mob/living/carbon/human/proc/rampant_infect)
		last_special = world.time + 5 MINUTES

		msg_admin_attack("[key_name_admin(src)] infected [key_name_admin(H)] with the rampancy virus! (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[src.x];Y=[src.y];Z=[src.z]'>JMP</a>)",ckey=key_name(src),ckey_target=key_name(H))
